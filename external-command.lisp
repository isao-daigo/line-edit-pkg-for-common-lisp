;;;
;;; 機種依存関数の定義
;;;

#+ :build-as-packages
(defpackage :external-command
  (:use :common-lisp)
  (:nicknames :ext-cmd)
  (:export
   #:exit-runtime
   #:current-directory-pathname-string
   #:short-current-directory-pathname-string
   #:home-directory-pathname-string
   #:absolute-path
   #:config-file-abs-path
   #:config-file-dir
   #:find-current-and-home-dir
   #:getenv
   #:exec-command
   #:raw-mode
   #:cooked-mode
   #:shell
   #:less
   #:parse-dir
   #:raw-mode
   #:cooked-mode
   #:split-string
   #:test-can-use-color-cursor	;; ユーザにカーソル色が変化するかを判断してもらう関数。
   #:can-use-color-cursor	;; カラー・カーソル機能の有無を[t/nil]で設定する関数。
   #:can-use-color-cursor-p	;; カラー・カーソル機能の有無を返す関数。
   #:record-color-cursor-info	;; カラー・カーソル機能の有無と、挿入モード時のカー−ソル色の情報を記録する。
   #:set-cursor-color-for-insert-mode ;; 挿入モード時のカーソル色を設定する。
   #:set-cursor-color		;; '(#xrr #xgg #xbb) ;; 全ての状況でカーソル色を即時変更する。
   #:set-cursor-color-by-name	;; '(black red green yellow blue magenta cyan white) ;; 同上。
   #:current-cursor-color-name	;; returns one of color name or returns [nil].
   #:cursor-info-file-name	;; カラー・カーソル機能の有無やカーソル色情報を記録するファイル名を返す関数。
   #:reset-cursor-color		;; カーソル色を標準色にリセットする関数。
   #:black-cursor		;; ラッパー関数。(set-cursor-color-by-name 'black)と同じ。
   #:red-cursor			;; ラッパー関数。(set-cursor-color-by-name 'red)と同じ。
   #:green-cursor		;; ラッパー関数。(set-cursor-color-by-name 'green)と同じ。
   #:yellow-cursor		;; ラッパー関数。(set-cursor-color-by-name 'yellow)と同じ。
   #:blue-cursor		;; ラッパー関数。(set-cursor-color-by-name 'blue)と同じ。
   #:magenta-cursor		;; ラッパー関数。(set-cursor-color-by-name 'magenta)と同じ。
   #:cyan-cursor		;; ラッパー関数。(set-cursor-color-by-name 'cyan)と同じ。
   #:white-cursor		;; ラッパー関数。(set-cursor-color-by-name 'white)と同じ。
   #:iso-date-string
   #:iso-time-string
   #:iso-timezone
   #:time12-string
   ) ;; end export
  ) ;; end defpackage

;;(declaim (optimize (safety 0) (speed 3) (space 0) (debug 0) (compilation-speed 0)))	;; maximum speed.
(declaim (optimize (safety 3) (speed 0) (space 0) (debug 3) (compilation-speed 0)))	;; maximum safety

(declaim (ftype (function (string &key (:ext t) (:dir t)) (values (or null simple-string) &optional))
                find-current-and-home-dir))

#+ :build-as-packages
(in-package :external-command)

(defparameter *shell* "bash") ;; or "csh" "zsh" ...
(defparameter *config-file-dir*
  (concatenate 'string (namestring (user-homedir-pathname)) ".config/line-edit/"))
(defparameter *config-file-dir-exist* nil)
(defparameter *config-file-ext* ".lisp")
(defparameter *cursor-info-file-name* "cursor-info")

(defun exit-runtime ()
  #+sbcl  (sb-ext:exit)	;; (sb-ext:quit)
  #+clisp (ext:exit)	;; (ext:quit)
  #+gcl   (system:bye)	;; (system:quit)
  (error "この処理系での終了方法が定義されていません。")
  )

;;
;; (split-string "/bin:/usr/bin" #\:)	=>	("bin" "/usr/bin")
;; (split-string "/usr/local/bin::/usr/bin" #\:) => ("/usr/local/bin" "" "/usr/bin")
;; (split-string "/usr/local/bin::/usr/bin" #\: :remove-empty-p t) => ("/usr/local/bin" "/usr/bin")
;;
(defun split-string (str delimiter &key (remove-empty-p nil))
  "strを指定された単一の文字delimiterで分割し、文字列のリストを返す。
   :remove-empty-p が t の場合、空文字列は結果から除外する。"
  (declare (type string str)
           (type character delimiter))
  (let (start pos result)
    (setf start 0)
    (setf result nil)
    (loop
      (setf pos (position delimiter str :start start)) ; デリミタの位置を検索
      (push (subseq str start (or pos (length str))) result) ;; 部分文字列をリストに追加。
      (if (null pos) (return result)) ; デリミタが見つからなければループを終了
      (setf start (1+ pos)) ; 次の検索開始位置をデリミタの次の文字に設定
      )                     ;; end loop
    ;; 収集した結果を post-process
    (return-from split-string
      (reverse
       (if (identity remove-empty-p)
           ;; :remove-empty-p が T の場合は、空文字列を除外
           (remove-if #'(lambda (s) (string= s "")) result)
           ;; そうでなければそのまま返す
           result)
       ) ;; end reverse
      )  ;; end return-from
    )    ;; end let
  ) ;; end split-string

;;
;; 指定されたファイルが存在するなら絶対パスを返す。[:exec-p t]を加えて呼び出すと実行可能性もチェックする。
;;
(defun absolute-path (fname &key (pathname-object nil) (current-dir-first nil) (exec-p t))
  "PATH環境変数を使用してファイルの絶対パスを検索して返す。ファイルが存在しなければ[nil]を返す。
キーワード[pathname-object]に[t]を与えて呼び出すとパス名オブジェクト形式で返す。
そうでないならパス名文字列を返す。

キーワード[current-dir-first]に[t]を与えて呼び出すと、PATH環境変数に登録されたディレクトリを
探す前にカレント・ディレクトリからプログラムを探す。

キーワード[exec-p]に[nil]を与えて呼び出すと実行可能かどうかのチェックを行わない。デフォルトは[t]。
\"/usr/bin/less\"
[2] (absolute-path \"less\" :pathname-object t)
#P\"/usr/bin/less\"
[3] (absolute-path \"less\" :current-dir-first t)
nil
"
  (let* ((path-string (getenv "PATH"))
         ;; PATHをコロンで分割してディレクトリのリストを作成
         (directories (when path-string (split-string path-string #\:)))
         )
    (when current-dir-first
      (push (current-directory-pathname-string) directories)
      )
    ;;(format t "directories=~s~%" directories)
    (dolist (dir directories)
      (let* ((full-path
               (merge-pathnames
                (make-pathname :name fname)
                (parse-dir (concatenate 'string dir "/"))
                )
               )
             (full-path-string (namestring full-path))
             )
        ;;(format t "(make-pathname \:name ~s)=~s~%" fname (make-pathname :name fname))
        ;;(format t "(parse-dir ~s)=~s~%" dir (parse-dir dir))
        ;;(format t "full-path=~s~%" full-path)
        ;; ファイルが存在するかを確認
        (when
            (and ;; ファイルが存在し、かつ実行可能形式かを調べる。
             (probe-file full-path)
             (when exec-p
               #+sbcl (sb-unix:unix-access (sb-ext:native-namestring full-path) sb-unix:x_ok)
               #+clisp (null (ext:shell (format nil "test -x ~A" full-path-string)))
               ;;#+gcl (si:file-executable-p full-path)
               #+gcl (system::file-test 1 full-path)
               ) ;; end when
             ) ;; end and
          (return-from absolute-path
            (cond
              ((identity pathname-object)
               full-path ;; [pathname-object]が[nil]ならパス名オブジェクト形式で返す。
               )
              (t
               full-path-string) ;; そうでないならパス名文字列を返す。
              )                  ;; end cond
            )
          ) ;; end when
        )   ;; end let*
      )     ;; end dolist
    (return-from absolute-path nil)
    ) ;; end let*
  ) ;; end absolute-path

;; Linuxのコマンドを呼び出す。
(defun exec-command (command &rest params)
  (let (cmd)
    (declare (string command))
    (setf cmd (absolute-path command :exec-p t))
    (when (null cmd) ;; 存在し実行可能か？
      (format t "実行可能なコマンド(~a)は存在しませんでした。~%" command)
      (return-from exec-command nil)
      )
    #+ clisp (ext:run-program cmd :arguments params :wait t)
    #+ sbcl  (sb-ext:run-program cmd params :input t :output t :error t :wait t) 
    #+ gcl   (system (concatenate 'string cmd (string-list-to-string params)))
    )
  )

;;;
;;; バッファリングなし、エコーなしの入力モードにする。
;;;
(defun raw-mode ()
  (exec-command "stty" "-echo" "raw")
  )

;;;
;;; バッファリングあり、エコーありの入力モードに戻す。
;;;
(defun cooked-mode ()
  (exec-command "stty" "sane")
  )

;; 環境変数[env-var]の値を取得する。
#+ clisp (defun getenv (env-var) (ext:getenv env-var))
#+ sbcl  (defun getenv (env-var) (sb-ext:posix-getenv env-var))
#+ gcl   (defun getenv (env-var) (si:getenv env-var))

;; パス名文字列を受け取りCommon Lispのpathnameオブジェクトに変換する。
#+ sbcl  (defun parse-dir (dir) (parse-namestring dir))
#+ clisp (defun parse-dir (dir) (parse-namestring dir))
#+ gcl   (defun parse-dir (dir) (pathname dir)) ;; GCLはpathnameで対応可能

;; ホーム・ディレクトリ文字列を返す。
(defun home-directory-pathname-string ()
  "returns such as /home/daigo/"
  #+ clisp (namestring (user-homedir-pathname))
  #+ sbcl  (namestring (user-homedir-pathname))
  #+ gcl   (namestring (user-homedir-pathname))
  ;;#+ gcl   (si::getenv "HOME")
  )

;; カレント・ディレクトリ文字列を返す。
(defun current-directory-pathname-string ()
  "returns such as /home/daigo/Lisp/"
  #+ clisp (namestring (ext:default-directory))
  #+ sbcl  (namestring (truename "."))
  #+ gcl   (si::get-working-directory)
  )

(defun short-current-directory-pathname-string ()
  "
(split-string (current-directory-pathname-string) #\/ :remove-empty-p t)
	==> (\"home\" \"daigo\" \"Lisp\" \"external-command\")
(split-string (namestring (user-homedir-pathname)) #\/ :remove-empty-p t)
	==> (\"home\" \"daigo\")

(short-current-directory-pathname-string)
	==> \"~/Lisp/external-command/\"
"

  (let (current-dir-path-list home-dir-path-list (result nil))
    (setf current-dir-path-list (split-string (current-directory-pathname-string) #\/ :remove-empty-p t))
    (setf home-dir-path-list (split-string (namestring (user-homedir-pathname)) #\/ :remove-empty-p t))

    (when (not (string-equal (first current-dir-path-list) (first home-dir-path-list)))
      (return-from short-current-directory-pathname-string (current-directory-pathname-string))
      ) ;; end when

    (loop
      (if (string-equal (first current-dir-path-list) (first home-dir-path-list))
          (progn
            (pop current-dir-path-list)
            (pop home-dir-path-list)
            ) ;; end progn
          (progn
            (dolist (s (reverse current-dir-path-list))	;; (reverse '("Lisp" "ext"))
              (push "/" result) ;; ("/") => ("/" "ext" "/")
              (push s result)	;; ("ext" "/") => ("Lisp" "/" "ext" "/")
              )
              (push "~/" result) ;; ("~/" "Lisp" "/" "ext" "/")
            (return-from short-current-directory-pathname-string
              (format nil "~{~a~}" result))
            )   ;; end progn
          )     ;; end if
      )         ;; end loop
    )           ;; end let
  ) ;; end short-current-directory-pathname-string

(defun ends-with-slash-p (path-string)
  "文字列path-stringがスラッシュで終わるか判定する。"
  (declare (type string path-string))
  (let ((len (length path-string)))
    (and (> len 0)                     ; 文字列が空でないことを確認
         (char= #\/ (char path-string (1- len)))))) ; 末尾の文字が #\/ かをチェック

(defun find-current-and-home-dir (fname &key ((:ext extension) nil) ((:dir directory) nil))
  "[extension]が文字列のときは、指定されたファイル名に[extension]で指定された拡張子を付加して
カレント・ディレクトリ→ホーム・ディレクトリの順に指定されたファイルを探し絶対パス名を返す。

[:dir]が指定されていた場合は、まず[:dir]で指定されたディレクトリを探し、次にカレント・ディレクトリ
→ホーム・ディレクトリの順に指定されたファイルを探し、絶対パスを返す。

[extension]が文字列のリストのときはリストに指定された順序に拡張子を付加してファイルを
探して絶対パス名を返す。存在しなければ[nil]を返す。

[3]> (find-current-and-home-dir \"test\" :ext (\".fasl\" \".lisp\"))

カレント・ディレクトリの\"test.fasl\" --> ホーム・ディレクトリの\"test.fasl\"の順に探し、
見つからなければ次に、カレント・ディレクトリの\"test.lisp\" --> ホーム・ディレクトリの\"test.lisp\"
の順に探す。つまり、指定された拡張子の順にカレント・ディレクトリ --> ホーム・ディレクトリの順に探す。
"
  ;;(let ((current-dir nil) (home-dir nil) (user-dir nil) (extension ext) (dir-path dir))
  (let ((current-dir nil) (home-dir nil) (user-dir nil))

    (cond
      ((not (stringp fname))
       (return-from find-current-and-home-dir nil) ;; [nil]を返して終わり。
       )
      ((stringp extension)
       nil ;; 継続処理。
       )
      ((not ;; [extension]が全てが文字列からなるリストでないなら[nil]。
        (and
         (listp extension)
         (every #'stringp extension)
         )
        )
       (return-from find-current-and-home-dir nil) ;; [nil]を返して終わり。
       )
      ) ;; end cond

    ;; 指定されたディレクトリの末尾が"/"で終わっていなければ付加する。
    ;;(when (and (identity directory) (stringp directory) (not (ends-with-slash-p directory)))
    (when (and directory (stringp directory) (not (ends-with-slash-p directory)))
      (setf directory (concatenate 'string directory "/"))
      )

    ;; 指定されたディレクトリ[directory]が存在するなら、最初に探すべきディレクトリとして設定。
    (when (and (identity directory) (stringp directory) (probe-file (parse-namestring directory)))
      (setf user-dir directory)
      )
    (setf current-dir (current-directory-pathname-string))
    (setf home-dir    (namestring (user-homedir-pathname)))
    ;;(format t "current-dir=~s~%home-dir=~s~%" current-dir home-dir)

    ;; 拡張子指定がない場合（extensionがnil）の処理
    ;; extensionがない場合、ファイル名そのままを指定ディレクトリ→カレント→ホームの順に探す
    (when (null extension)
      (dolist (s (list user-dir current-dir home-dir))
        ;;(when (identity s) ;; [user-dir], [home-dir]は[nil]の場合があり得る。
        (when s ;; [user-dir], [home-dir]は[nil]の場合があり得る。
          (let ((full-path (concatenate 'string s fname)))
            (when (probe-file full-path)
              ;;(return-from find-current-and-home-dir (namestring (probe-file full-path)))
              (return-from find-current-and-home-dir full-path)
              )                                   ;; end when
            )                                     ;; end let
          )                                       ;; end when
        )                                         ;; end dolist
      (return-from find-current-and-home-dir nil) ;;指定されたファイルが存在しなかった。
      )

    ;; 単一の拡張子だけが指定された(文字列のみ)場合の処理。
    (when (stringp extension)
      (dolist (s (list user-dir current-dir home-dir)) ;; [user-dir], [home-dir]は[nil]の場合があり得る。
        ;;(when (and (identity s) (probe-file (concatenate 'string s fname extension)))
        (when (and s (probe-file (concatenate 'string s fname extension)))
          (return-from find-current-and-home-dir
            ;;(namestring (probe-file (concatenate 'string s fname extension))))
            (concatenate 'string s fname extension))
          )                                       ;; end when
        )                                         ;; end dolist
      (return-from find-current-and-home-dir nil) ;;指定されたファイルが存在しなかった。
      )

    ;; 複数の拡張子が文字列のリストで指定されていた場合の処理。
    ;; 指定された拡張子から順に、カレント・ディレクトリ→ホーム・ディレクトリの順に探す。
    (when (listp extension)
      (dolist (ext extension) ;; 全てのリストの要素が文字列からなることは確認済み。
        (dolist (s (list user-dir current-dir home-dir))
          ;;(when (and (identity s) (probe-file (concatenate 'string s fname ext)))
          (when (and s (probe-file (concatenate 'string s fname ext)))
            (return-from find-current-and-home-dir
              ;;(namestring (probe-file (concatenate 'string s fname ext))))
              (concatenate 'string s fname ext))
            )
          ) ;; end dolist
        )   ;; end dolist
      )
    ;;(return-from find-current-and-home-dir nil) ;; 指定されたファイルが存在しなかった。
    ) ;; end let
  (return-from find-current-and-home-dir nil)
  ) ;; end find-current-and-home-dir

(defun config-file-dir ()
  *config-file-dir*
  )

;;
;; ファイル名[fname]に拡張子があるかどうかを調べる。
;;
(defun with-file-ext-p (fname)
  (find "." fname :from-end t :test #'string=)
  ) ;; end with-file-ext-p

;;
;; 設定用ディレクトリが存在しなければ作成し、[fname]で指定された設定用ファイルの絶対パス名を返す。
;; [fname]の拡張子がなければ、[*config-file-ext*]で定義された値を付加する。
;;
(defun config-file-abs-path (fname)
  (let ((abs-fname ""))
    (if (with-file-ext-p fname) ;; 拡張子があるかチェック。
        (setf abs-fname (concatenate 'string *config-file-dir* fname))
        (setf abs-fname (concatenate 'string *config-file-dir* fname *config-file-ext*))
        ) ;; end if
    (when (null *config-file-dir-exist*)
      (setf *config-file-dir-exist* t)
      (ensure-directories-exist abs-fname)
      ) ;; end when
    abs-fname
    ) ;; end let
  ) ;; end config-file-abs-path

(defun shell (&optional (shell-name nil) (keep-new-shell t))
  "指定されたシェルを起動する。指定がなければ現在のシェルを起動する。
指定されたシェルが実行可能な場合は起動するシェルを指定されたシェルに切り替える。
第２引数に[nil]を指定すると起動シェルの切り替えを記憶しない。
[3]> (shell)
 指定されたシェルが実行可能なパスに存在しなければエラー・メッセージを表示して[nil]を返す。"
  (let (result is-exist)
    (when shell-name ;; 起動するシェルが指定されていた場合は実行可能かチェック。
      (setf is-exist (absolute-path shell-name))
      )
    (cond
      ((and ;; 起動シェルが指定されていて実行可能で、起動シェルの変更を記憶する。
        shell-name
        is-exist
        keep-new-shell
        )
       (setf result (change-shell shell-name))
       (if (null result) (return-from shell nil))
       (pure-shell result)
       )
      ((and ;; 起動シェルが指定されていて実行可能で、起動シェルの変更を記憶しない。
        shell-name
        is-exist
        (null keep-new-shell)
        )
       (pure-shell shell-name)
       )
      ((and ;; 起動シェルが指定されておらず現在の起動シェルが実行可能で、それを記憶する。
        (null shell-name)
        (absolute-path *shell*)
        keep-new-shell
        )
       (pure-shell *shell*)
       )
      ((and ;; 起動シェルが指定されておらず現在の起動シェルが実行可能で、それを記憶しない。
        (null shell-name)
        (absolute-path *shell*)
        (null keep-new-shell)
        )
       (format t "warning: 新たな起動シェルが指定されていないため現在の起動シェルを変更しません。~%")
       (pure-shell *shell*)
       )
      ) ;; end cond
    )   ;; end let
  )

(defun pure-shell (shell-name)
  #+clisp (ext:shell (absolute-path shell-name))
  #+sbcl (sb-ext:run-program (absolute-path shell-name) nil :input t :output t :error t :wait t) 
  #+ gcl (system shell-name)
  )

(defun change-shell (&optional (shell-name nil))
"関数[shell]で起動するシェルを引数で指定されたシェルに切り替える。
[3]> (change-shell \"bash\")
引数が指定されなければ現在設定されているシェル名を返す。
指定されたシェルが実行可能なパスに存在していなければメッセージを表示して[nil]を返す。"
  (let (shell)
    (when (null shell-name) (return-from change-shell *shell*)) ;; 引数なしで呼び出すと現在のシェル名を返す。

    (setf shell (absolute-path shell-name)) ;; 実行可能なパスに存在するかチェック。
    (cond
      ((null shell)
       (format t "指定されたシェル(~a)は実行可能なパスに存在しませんでした。~%" shell-name)
       (format t "現在のシェル設定(~a) は変更されていません。~%" (absolute-path *shell*))
       (return-from change-shell nil)
       )
      (t
       (setf *shell* shell-name)
       )
      ) ;; end cond
    )   ;; end let
  )

(defun less (&rest fname)
  (format t "(less ~s)~%" fname)
#+ gcl (system (concatenate 'string "less" (string-list-to-string fname)))
#+ clisp (ext:run-program (absolute-path "less") :arguments fname :input t :output t :wait t)
#+ sbcl
  (sb-ext:run-program (absolute-path "less") fname :input t :output t :error t :wait t) 
  )

(defun string-list-to-string (lst)
  (let (result)
    (setf result nil)
    (dolist (s lst)
      (push s result)
      )
    (reverse result)
    )
  )

(defun cursor-info-file-name ()
  *cursor-info-file-name*
  )

(defun iso-date-string ()
  (let (tmp)
    (setf tmp (multiple-value-list (get-decoded-time)))
    (format nil "~4d-~2,'0d-~2,'0d" (sixth tmp) (fifth tmp) (fourth tmp))
    )
  )

(defun iso-time-string ()
  (let (tmp)
    (setf tmp (multiple-value-list (get-decoded-time)))
    (format nil "~2,'0d:~2,'0d:~2,'0d" (third tmp) (second tmp) (truncate (first tmp)))
    )
  )

(defun iso-timezone ()
  (- (nth 8 (multiple-value-list (get-decoded-time))))
  )   ;; end iso-timezone

(defun time12-string ()
  (let (tmp (am-pm nil))
    (setf tmp (multiple-value-list (get-decoded-time)))
    (if (> (third tmp) 12)
      (setf am-pm 'pm)
      (setf am-pm 'am)
      )
    (if (equal am-pm 'am)
        (format nil "~2,'0d:~2,'0dam" (third tmp) (second tmp))
        (format nil "~2,'0d:~2,'0dpm" (- (third tmp) 12) (second tmp))
        )
    )
  )

;;;
;;; カーソルの色を変えるための関数群の定義。
;;;
;;;	使用できるとは限らない機能なので用意したテスト用関数(test-osc-rgb)
;;;	を実行して可否を判断してから使用する。
;;;
(let* (
       (tmp 0)
       (can-use-color-cursor t)
       (cursor-color-for-insert-mode nil)
       (black '(#x00 #x00 #x00))
       (red '(#xff #x00 #x00))
       (green '(#x00 #xff #x00))
       (yellow '(#xff #xff #x00))
       (blue '(#x00 #x00 #xff))
       (magenta '(#xff #x00 #xff))
       (cyan '(#x00 #xff #xff))
       (white '(#xff #xff #xff))
       (color-list
         (list
          (list 'black black)
          (list 'red red)
          (list 'green green)
          (list 'yellow yellow)
          (list 'blue blue)
          (list 'magenta magenta)
          (list 'cyan cyan)
          (list 'white white)
          )
         )
       (rgb-color-list
         (list
          (list 'red red)
          (list 'green green)
          (list 'blue blue)
          )
         )
       )

  (defun test-can-use-color-cursor ()
    (let ( (result nil)
           (msg "=====================================================================================
Operationg System Command(OSC)が有効な場合にカーソルの色を変えることができます。

しかし、OSCは規格ではないので確実に機能の有無を調べる方法はなく、機械的な検査では推測の域を出ません。

そのため、ユーザ自身に機能の有無を確認してもらうために端末上のカーソル色を変えるテストを行います。
標準的な方法でカーソルの色を変える操作を行いますので

	*** 色が変化しているのを認めたら[yes]と回答して下さい。***

端末の表示が乱れたり、クラッシュした場合は端末ソフトを終了して、端末ソフトを起動し直して下さい。
その場合は設定用ディレクトリ[~/.config/line-edit/]に中身のない[cursor-info.lisp]という
ファイルを用意して下さい。
	$ touch ~/.config/line-edit/cursor-info.lisp
で作れます。このファイルがあると以後、カーソルをカラーで表示する機能に関する質問は行いません。

※ カーソルをカラー指定する機能なども無視されます。有効にするにはLispセッション内で
	> (can-use-color-cursor t)
としますが、カーソルをカラー化する機能がない端末では画面表示が乱れる可能性があります。
")
           )
      ;; 設定ファイルが存在しているならテストは行わない。
      (when (config-file-abs-path (cursor-info-file-name))
        (return-from test-can-use-color-cursor nil)
        )

      (format t "~%~a~%" msg)
      (format t "ではカーソルの色が変更できるかどうか赤・緑・青の3原色についてテストを行います。~%")

      (setf result nil)
      (dolist (p rgb-color-list)
        (set-cursor-color (second p))
        (push
         (yes-or-no-p "カーソル色は ~a です。変化を認めますか？" (string-downcase (symbol-name (first p))))
         result)
        ) ;; end dolist

      (reset-cursor-color)

      ;;(format t "result=~s~%" result)

      (when (some #'identity result)
        (terpri)
        (format t "#\Tab*** カーソルをカラー表示する機能が使えます。 ***~%")
        (can-use-color-cursor t)
        ) ;; end when


      (format t
              "~%関数[set-cursor-color]を使えば (set-cursor-color '(#xff #x00 #x00))のようにRGBの要素それぞれを最大16ビットで指定できます(表現できる色数は端末の表示能力の範囲内です)。

本ソフトでは利便性を考えて black, red, green, yellow, blue, magenta, cyan, white の8色をシンボル名で指定できます。

	(set-cursor-color-by-name 'green)
は
	(set-cusor-color '(#x00 #xff #x00))

と同じです。~%")

      (loop
        (format t "~%挿入モード時のカーソル色を以下から番号で選んで下さい。~%")

        (dotimes (i (length color-list))
          (format t "~02d) ~a~%" (1+ i) (string-capitalize (symbol-name (first (nth i color-list)))))
          ) ;; dotimes

        (format t "Enter : ")
        (finish-output)
        (setf tmp (read))

        (if (and (<= 0 tmp) (<= tmp (1+ (length color-list))))
            (return) ;; exit loop.
            (format t "1-~dの範囲の番号を入力して下さい。~%" (1+ (length color-list)))
            ) ;; end if
        )     ;; end loop

      (set-cursor-color-for-insert-mode (first (nth (1- tmp) color-list)))

      (record-color-cursor-info
       :fname (cursor-info-file-name) :verbose nil :can-use t :cursor-color (current-cursor-color-name))

      (format t "設定ファイル(~a)に情報を記録しました。~%" (cursor-info-file-name)) 

      ) ;; end let
    )   ;; end test-can-use-color-cursor

  ;;
  ;; カラー・カーソル機能の有無と、機能する場合のカーソル色をファイルに設定する関数。
  ;;
  (defun record-color-cursor-info
      (&key
         (fname (cursor-info-file-name))
         (verbose nil) ;; メッセージを表示するか？
         (can-use t)   ;; カーソルのカラー表示機能は使えるか？
         (cursor-color (current-cursor-color-name)) ;; 挿入モード時のカーソルの表示色。
         )
    (let (msg-1 msg-2 msg-3 abs-fname)
      (setf abs-fname (config-file-abs-path fname))
      (with-open-file (s abs-fname :direction :output :if-does-not-exist :create :if-exists :supersede)
        (setf msg-1 (format nil ";; ~a ~a JST(~2,0@d\:00)"
                            (iso-date-string) (iso-time-string) (iso-timezone)))
        (setf msg-2 (format nil "(external-command:can-use-color-cursor ~a)"
                            (string-downcase (symbol-name can-use)))) ;; 小文字は単なる趣味。
        (setf msg-3 (format nil "(external-command:set-cursor-color-for-insert-mode \'~a)"
                            (string-downcase (symbol-name cursor-color)))) ;; 同上。
        (format s "~a~%" msg-1)
        (format s "~a~%" msg-2)
        (format s "~a~%" msg-3)

        (can-use-color-cursor can-use)
        (set-cursor-color-for-insert-mode cursor-color)
        ) ;; end with-open-file
      (when verbose
        (format t "~a を作成し、以下のカラー・カーソル表示情報を書き込みました。~%"
                (cursor-info-file-name))
        (format t "~a~%" msg-1)
        (format t "~a~%" msg-2)
        (format t "~a~%" msg-3)
        (if (can-use-color-cursor-p)
            (progn
              (format t "...この端末はカラー・カーソル表示が有効です。~%")
              (format t "...挿入モード時のカーソル色(~a)を書き込みました。~%"
                      (string-downcase (symbol-name (current-cursor-color-name))))
              ) ;; end progn
            (format t "...この端末はカラー・カーソル機能無効です。~%")
            ) ;; end if
        )     ;; end when
      )       ;; end let
    )         ;; end record-color-cursor-info

  (defun can-use-color-cursor-p ()
    can-use-color-cursor
    )

  (defun can-use-color-cursor (p)
    (setf can-use-color-cursor p)
    )

  ;;
  ;; Operationg System Command(OSC)が有効な場合にカーソルの色を変える。
  ;; OSCはANSI規格ではないので全ての端末に機能が備わっているとは限らず、
  ;; 備わっていても同じ規格とは限らない。
  ;;
  ;; 引数にはrgb各最大16ビットの数値リストを渡す。例:赤='(#xff #x00 #x00)
  ;; この関数を実行するとカーソルの色が即座に変わる。
  ;;
  (defun set-cursor-color (rgb-color-list)
    "端末上のカーソルの色を変える。r, g, bはそれぞれ最大16ビット。
ただし表示できる色数は端末依存。"
    ;;(format t "set-cursor-color:rgb-color-list=~s~%" rgb-color-list)
    (when (can-use-color-cursor-p)
      (let (r g b)
        (setf r (first rgb-color-list))
        (setf g (second rgb-color-list))
        (setf b (third rgb-color-list))
        (when (can-use-color-cursor-p)
          ;;(format t "~C]12;rgb:~2,'0X/~2,'0X/~2,'0X~C" #\Esc r g b #\Bel)
          (format t "~C]12;rgb:~2,'0X/~2,'0X/~2,'0X~C" (code-char 27) r g b (code-char 7)) ;; for GCL.
          (finish-output)))
      ) ;; end when
    )   ;; end set-cursor-color

  ;; 
  ;; vi-modeでの挿入モード時のカーソル色を設定する。
  ;; この関数を実行してもカーソルの色は即座には変わらない。
  ;; カーソルの色が変わるのは挿入モード時のみ。
  ;;
  (defun set-cursor-color-for-insert-mode (color-name)
    (when (can-use-color-cursor-p)
      (setf cursor-color-for-insert-mode color-name)
      ) ;; end when
    )   ;; end set-cursor-color-for-insert-mode

;;;
;;; カーソルの色を(black red green yellow blue magenta cyan white)からシンボル名で指定する。
;;;
  (defun set-cursor-color-by-name (color-name)
    (when (and
           (can-use-color-cursor-p)
           (member (symbol-name color-name) '(black red green yellow blue magenta cyan white)
                   :key #'symbol-name :test #'string-equal)
           ) ;; end and
      (set-cursor-color (second (find (symbol-name color-name) color-list
                                      :key #'(lambda (x) (symbol-name (first x))) :test #'equal)))
      (set-cursor-color-for-insert-mode color-name) 
      ) ;; end when
    (return-from set-cursor-color-by-name cursor-color-for-insert-mode)
    ) ;; end cursor-color-by-name

  ;;
  ;; wrapper functions
  ;;
  (defun black-cursor ()
    (set-cursor-color-for-insert-mode 'black)
    )

  (defun red-cursor ()
    (set-cursor-color-for-insert-mode 'red)
    )

  (defun green-cursor ()
    (set-cursor-color-for-insert-mode 'green)
    )

  (defun yellow-cursor ()
    (set-cursor-color-for-insert-mode 'yellow)
    )

  (defun blue-cursor ()
    (set-cursor-color-for-insert-mode 'blue)
    )

  (defun magenta-cursor ()
    (set-cursor-color-for-insert-mode 'magenta)
    )

  (defun cyan-cursor ()
    (set-cursor-color-for-insert-mode 'cyan)
    )

  (defun white-cursor ()
    (set-cursor-color-for-insert-mode 'white)
    )

  (defun current-cursor-color-name ()
    (return-from current-cursor-color-name cursor-color-for-insert-mode)
    )

  (defun reset-cursor-color ()
    (when (can-use-color-cursor-p)
      ;;(format t "~C]112~C" #\Esc #\Bel)
      (format t "~C]112~C" (code-char 27) (code-char 7) )
      (finish-output)))

  ) ;; end let

;; 現在のシェル名を起動シェルの初期値として取得しておく。
(setf *shell* (getenv "SHELL"))

#+ :build-as-packages
(provide :external-command)
