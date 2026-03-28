;;; last updated : 2026-03-28 13:44:16(JST)

#+ :build-as-packages
(defpackage :history-repl
  (:use :common-lisp)
  (:use :external-command)
  (:use :basic-symbol-name-function)
  (:use :print-color-string)
  (:use :history-pkg)
  (:use :line-edit-pkg)
  (:use :debug-print)
  (:use :package-util)
  (:export
   #:history-repl
   #:current-default-prompt-color
   )
  )

#+ :build-as-packages
(in-package :history-repl)

(declaim (optimize (safety 0) (speed 3) (space 0) (compilation-speed 0)))
;;(declaim (optimize (safety 3) (speed 0) (space 0) (compilation-speed 0)))

(defparameter *current-default-prompt-color* 'blue)		;; repl毎のプロンプト全体の既定色。
(defparameter *last-package* (find-package :common-lisp-user))	;; 前回のカレント・パッケージを記録しておく。

(defun current-default-prompt-color ()
  *current-default-prompt-color*
  )

(load (external-command:config-file-abs-path "init-repl-prompt")) ;; 各種初期設定。

;; 起動時にこの関数を呼び出すとヒストリ機能が使えるようになる。
;; > (load "history-pkg.fasl") ;; or (load "history-pkg.lisp")
;; T
;; > (history-pkg:history-repl) ;; or (in-package :history-pkg) -> (history-repl)
;;
;; プロンプトを変更したい場合は関数[set-prompt-element]で変更する。
;;
(defun history-repl ()
  "ANSI Common Lispの標準機能に基づいたカスタムREPL。"
  (let ((prmpt-color nil) (prmpt-attr nil) tmp)

    (history-pkg:clear-history)	;; 履歴をクリア。
    (history-pkg:read-history)	;; 前回記録した履歴ファイルを読み込む。
    (set-macro-character #\! #'history-pkg:hist) ;; C-shell風履歴コマンドを処理するマクロ。

    (unwind-protect
         (loop

           (setf prmpt-attr (history-pkg:get-prompt-attributes))

           #+ :debug
           (when (debug-print-p "history-repl")
             (format t "history-repl(5):prmpt-attr=~s~%" prmpt-attr)
             (setf tmp (member ':color prmpt-attr :test #'string-equal-by-symbol-name :key #'car))
             (finish-output)
             )

           (setf tmp (member ':color prmpt-attr :test #'equal :key #'car))

           #+ :debug
           (when (debug-print-p "history-repl")
             (format t "history-repl(6):tmp=~s~%" tmp)
             (finish-output)
             )


           (cond
             ((null tmp)
              (setf prmpt-color *current-default-prompt-color*)
              )
             (t
              (setf prmpt-color (second (first tmp)))
              (setf *current-default-prompt-color* prmpt-color) ;; 次回以降のデフォルトとして記録する。
              (setf tmp (remove ':color prmpt-attr :test #'string-equal-by-symbol-name :key #'car))
              (setf prmpt-attr nil)
              (dolist (s tmp)reverse
                (setf prmpt-attr (append s prmpt-attr))
                ) ;; end dolist
              )   ;; end [t]
             )    ;; end cond

           ;;(fresh-line)

           #+ :debug
           (when (debug-print-p "history-repl")
             (format t "history-repl(7):prmpt-color=~s~%(system-prompt)=~s~%prmpt-attr=~s~%"
                     prmpt-color (system-prompt) prmpt-attr)
             (finish-output)
             )

           ;; (print-colored-string [color] [atom-or-list] &key ...)
           (apply #'print-colored-string prmpt-color (system-prompt) prmpt-attr)

           ;;(force-output)
           (finish-output)
       
           (handler-case ;; **HANDLER-CASE** でエラーを捕捉

               (let ((input ""))
                 (declare (type (or string null) input))

                 ;; OS(端末)が持っている入力バッファとsbclが持っている入力バッファの同期がずれるため
                 ;; sbclでは「stty -echo raw」が必要(clispでは不要)。「stty -echo」でOSによる画面表示
                 ;; を消してもOSのバッファには入力文字が蓄積されている。このため「stty echo」でエコーを
                 ;; 再開した瞬間に蓄積していた文字を出力してしまう？
                 ;;
                 ;; 恐らくclispはrawモードを独自にシミュレートしているため処理系自身の入力バッファだけで
                 ;; 処理が完結している。このためOS側入力バッファと処理系側入力バッファの同期がずれるとい
                 ;; うことがないのだと思われる。
                 ;;
                 (raw-mode) ;; OS側でのバッファリングなし、エコーなしの入力モードにする。
                 (unwind-protect
                      (progn

                        ;; 端末からの行編集機能付き入力。入出力制御はすべて関数[line-edit]が行う。
                        (line-edit-pkg::move-logical-cursor-to 0)
                        (setf input (line-edit-pkg:line-edit)) ;; 返す型は文字列型。

                        #+ :debug
                        (when (debug-print-p "history-repl")
                          (format t "history-repl(7.1) reached.~%")
                          )

                        (when (null input) ;; [nil]の場合のみ。何も入力しない場合は[""]が返るので該当しない。
                          (if (not (suppress-important-message))
                              (format t "line-edit returned [nil]. exit.~%")
                              )
                          (return-from history-repl t)
                          )

                        ;; (quit-repl)と入力されたら[history-repl]を終了。
                        (when (string-equal input "(quit-repl)")
                          (if (not (suppress-important-message))
                              (format t "Quited history-repl.")
                              (finish-output)
                              )
                          (return-from history-repl t)
                          )

                        ;; (exit)と入力された場合も[history-repl]を終了。
                        (when (string-equal input "(exit)")
                          (if (not (suppress-important-message))
                              (format t "Exited history-repl.")
                              (finish-output)
                              )
                          (return-from history-repl t)
                          )

                        ;; 空文字なら何もしない。
                        (when (not (and (stringp input) (zerop (length input))))
                          ;;(history-pkg:add-str-to-hist input) ;; 入力を履歴に追加。履歴番号更新も行う。

                          (let ((form (read-from-string input))) ;; 先にリードしてマクロを展開させる。
                            ;; "!"で始まる履歴操作マクロは展開された内容を文字列に戻して履歴に追加。
                            ;; 展開前が"!"で始まる履歴操作マクロでなければ入力そのままを履歴に追加。
                            (unless
                                (and
                                 (listp form)
                                 (member (car form) (history-pkg:history-functions)))
                              (if (char= (char input 0) #\!)
                                  (history-pkg:add-str-to-hist (format nil "~s" form))
                                  (history-pkg:add-str-to-hist input)
                                  ) ;; end if
                              )     ;; end unless
                            #+ :debug
                            (when (debug-print-p "history-repl")
                              (format t "history-repl(8):form=~s~%" form)
                              )
                            ;; 評価し、多値の場合を含めて結果を表示する。
                            (format t "~{~a~%~}" (multiple-value-list (eval form)))
                            ) ;; end let
                          (finish-output)
                          ) ;; end when
                        )   ;; end progn
                   ;; 以下、異常終了時を含めた終了処理。
                   (finish-output)
                   (cooked-mode) ;; OS側のバッファリングあり、エコーありの入力モードに戻す。

                   ;;-------------------------------------------------------------------------
                   ;;
                   ;; 新しく移動した先のパッケージの外部、内部、継承シンボル情報を得る。
                   ;;
                   ;;-------------------------------------------------------------------------
                   (let (
                         (keymap nil)
                         (num-list nil)
                         (current-package-completion-keymap nil)
                         (n 0)
                         #+ :debug temp
                         )
                     (when (and
                            (not (member *package* (packages-exception-list) :test #'equal))
                            (not (equal *last-package* *package*)) ;; パッケージを移動した。
                            )

                       (dolist (p '(:external :internal :inherited))
                         (multiple-value-setq (keymap n) 
                           (make-package-symbol-completion-keymap *package* p))
                         #+ :debug
                         (when (debug-print-p "history-repl-symbol-info")
                           (format t "------------------------------------------------------------~%")
                           (format t "p=~s~%" p)
                           (setf temp (line-edit-pkg::get-candidates nil keymap))
                           (if (null temp)
                               (format t "(get-candidates nil keymap)=~s~%" temp)
                               (format t "(get-candidates nil keymap)=~%~s~%" temp)
                               )
                           (format t "(length (get-candidates nil keymap)=~d~%" (length temp))
                           (finish-output)
                           ) ;; end debug-print-p
                         (push n num-list)
                         (setf current-package-completion-keymap
                               (condense current-package-completion-keymap keymap))
                         ) ;; dolist

                       (setf current-package-completion-keymap
                             (condense (default-completion-keymap) current-package-completion-keymap)
                             )

                       #+ :debug
                       (when (debug-print-p "history-repl-symbol-info")
                         (setf *print-level* 3)
                         (setf *print-length* 5)

                         (format t "------------------------------------------------------------~%")
                         (format t "current-package-completion-keymapへの合成後のテスト。~%")
                         (format t "(length (get-candidates nil current-package-completion-keymap))=~d~%"
                                 (length
                                  (line-edit-pkg::get-candidates nil current-package-completion-keymap)))
                         (format t "(get-candidates \"p\" current-package-completion-keymap)=~%~s~%"
                                 (get-candidates "p" current-package-completion-keymap))
                         (format t "------------------------------------------------------------~%")
                         (finish-output)
                         (setf *print-level* nil)
                         (setf *print-length* nil)
                         ) ;; end debug-print-p

                       (when (verbose-message)
                         (finish-output)
                         ;;(format t "Collected ~a's ext(~d),int(~d),non-system inherited symbols(~d)."
                         (format t "~&~aの外部(~d),内部(~d),システム由来以外の継承シンボル(~d)を取得しました。~%"
                                 (package-name-case-convert (package-name *package*))
                                 (nth 2 num-list) (nth 1 num-list) (nth 0 num-list)
                                 )
                         (finish-output)
                         ) ;; end when

                       (setf *last-package* *package*)
                       ) ;; end when
                     )   ;; end let
                   ;;-------------------------------------------------------------------------

                   ) ;; end unwind-protect
                 )   ;; end let

             ;; ユーザーがC-cなどでプロセスを中断した場合の処理
             ;; SBCLの場合
             #+sbcl
             (sb-sys:interactive-interrupt (c)
               (declare (ignore c))
               (format *error-output* "~& SBCL Interrupted.~%")
               (return) ;; 中断処理後、REPLを終了
               )

             ;; CLISPの場合
             #+clisp
             (interrupt (c)
               (declare (ignore c))
               (format *error-output* "~& CLISP Interrupted.~%")
               (return) ;; 中断処理後、REPLを終了
               )

             ;; GCLの場合
             #+gcl
             (lisp::user-interrupt (c)
               (declare (ignore c))
               (format *error-output* "~& GCL Interrupted.~%")
               (return) ;; 中断処理後、REPLを終了
               )
    
             ;; 標準のエラーを捕捉し、エラー処理後に read-eval-print-loop に戻る
             (error (c)
               (format *error-output* "~&General Error: ~A~%" c)
               (break)
               ) ;; エラー処理後、デバッガへ。
             )   ;; end handler-case
           )     ;; end loop

      ;;
      ;; clean up form.
      ;;
      ;;=======================================================================
      (history-pkg:write-history)
      (if (not (suppress-important-message))
          (format t "~&History saved.~%")
          )

      (when (user-keymap-added-p)
        (line-edit-pkg:save-completion-dictionaries) ;; save completion info if added.
        (when (not (suppress-important-message))
          (format t "~&Completion dictionaries saved.~%")
          ) ;; end when
        ) ;; end when

      (exit-runtime)
      ;;=======================================================================

      ) ;; end unwind-protect
    )   ;; end let
  ) ;; end history-repl

;;#+ :build-as-packages (provide :history-repl)
