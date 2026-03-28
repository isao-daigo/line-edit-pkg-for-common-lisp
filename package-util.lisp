;;;
;;; last updated : 2026-03-27 10:49:22(JST)
;;;

#+ :build-as-packages
(defpackage :package-util
  (:use :common-lisp)
  (:nicknames :px :dir)
  (:export
   #:cd
   #:pwd
   #:pushd
   #:popd
   #:dirs
   #:ls
   #:auto-show-dirs
   #:number-of-external-symbols
   #:set-package-name-case
   #:get-package-name-case
   #:name-case-convert
   #:package-name-case-convert
   #:shortest-nickname
   #:get-external-symbols
   #:get-internal-symbols
   #:get-inherited-symbols
   #:symbol-attribute
   #:type-of-symbol
   )
  )

(declaim (optimize (safety 0) (speed 3) (space 0) (debug 0) (compilation-speed 0)))	;; maximum speed.
;;(declaim (optimize (safety 3) (speed 0) (space 0) (debug 3) (compilation-speed 0)))	;; maximum safety

#+ :build-as-packages
(in-package :px)

(defparameter *package-name-stack* nil)
(defparameter *auto-show-dirs* t)
(defparameter *package-case* nil)

;; 引数で与えられたパッケージの基本名とニックネームを表示する。
(defun show-principal-and-nicknames (pkg)
  (when (null (find-package pkg))
    (return-from show-principal-and-nicknames (values))
    )
  (cond
    ((package-nicknames pkg)
     (format t "~a ~a" (find-package pkg) (sort-nicknames *package*))
     )
    (t
     (format t "~a" (find-package pkg))
     )
    ) ;; end cond
  (values)
  ) ;; end show-pricipal-and-nicknames

;; print current working package.
(defun pwd () (show-principal-and-nicknames *package*))

(defun cd (&optional (pkg nil)) ;; change package.
  (when (null *package-name-stack*)
    (push *package* *package-name-stack*)
    )
  (cond
    ((null pkg) ;; ホーム・パッケージに戻る。
     (setf *package-name-stack* nil)
     (setf *package* (find-package :cl-user))
     (pwd)
     )
    ((packagep (find-package pkg))
     (pop *package-name-stack*)
     (push pkg *package-name-stack*)
     (setf *package* (find-package pkg)) ;; (in-package pkg)
     (if (auto-show-dirs)
         (dirs)
         (show-principal-and-nicknames pkg)
         ) ;; end if
     )
    (t
     (warn "package ~a not found." pkg)
     )
    ) ;; end cond
  ) ;; end cd

(defun pushd (pkg) ;; push package.
  (when (null *package-name-stack*)
    (push *package* *package-name-stack*)
    )
  (cond
    ((null pkg)
     nil
     )
    ((packagep (find-package pkg))
     (push pkg *package-name-stack*)
     (setf *package* (find-package pkg)) ;; (in-package pkg)
     (if (auto-show-dirs)
         (dirs)
         (show-principal-and-nicknames pkg)
         )
     )
    (t
     (warn "package ~a not found." pkg)
     )
    ) ;; end cond
  ) ;; end pushd

(defun popd () ;; pop package.
  (cond
    ((null *package-name-stack*)
     (push *package* *package-name-stack*)
     (pwd)
     )
    (t
     (pop *package-name-stack*)
     (setf *package* (find-package (first *package-name-stack*))) ;; [in-package]
     (if (auto-show-dirs)
         (dirs)
         (show-principal-and-nicknames *package*)
         ) ;; end if
     )
    ) ;; end cond
  ) ;; end popd

;; 引数のリスト内の文字列を小文字化して返す。
(defun string-downcase-list (lst)
  (let ((result nil))
    (dolist (arg lst)
      (if (stringp arg)
          (push (string-downcase arg) result)
          (push arg result)
          )
      ) ;; end dolist
    (reverse result)
    ) ;; end let
  )

(defun dirs () ;; スタックに積まれているパッケージの履歴を表示する。
  (when (null *package-name-stack*)
    (push *package* *package-name-stack*)
    )
  (let ((i (1- (length *package-name-stack*))) (nickname-list nil))
    (dolist (p *package-name-stack*)
      (let ((is-current (eq (find-package p) *package*)))
        (format t "~3d:~c ~a"
                i
                (if is-current #\* #\Space)
                (find-package p)
                ) ;; end format
        )         ;; end let
      (when  (package-nicknames p)
        (setf nickname-list (sort-nicknames p))
        (let ((lst nil))
          (dolist (q nickname-list)
            (push (name-case-convert q) lst)
            )
          (format t " ~a" (reverse lst))
          ) ;; end let
        )   ;; end when
      (terpri)
      (decf i)
      ) ;; end dolist
    )   ;; end let
  (values)
  ) ;; end dirs

(defun auto-show-dirs (&optional (p nil sw))
  (cond
    ((null sw)
     *auto-show-dirs*
     )
    (t
     (setf *auto-show-dirs* p)
     )
    ) ;; end cond
  ) ;; end auto-show-dirs

;;
;; 引数で指定されたパッケージの外部シンボル数を[str-1]と[str-2]で指定した文字で挟んで文字列として返す。
;; [history-pkg:set-prompt-element]の[:not-cl-user]との整合性のため[cl-user]パッケージは対象外とする。
;; [cl-user]の外部シンボルは通常は[0]。(px:ls :package :cl-user)で表示することはできる。
;;
(defun number-of-external-symbols (&optional (pkg *package*) (str-1 "") (str-2 ""))
  (let ((lst nil))

    (when (eq (find-package pkg) (find-package :cl-user))
      (return-from number-of-external-symbols "")
      )

    (setf lst (get-external-symbols pkg))

    (return-from number-of-external-symbols (format nil "~a~d~a" str-1 str-2 (length lst)))
    ) ;; end let
  ) ;; end number-of-external-symbols

;; シンボルの種別を表す文字列のリストを返す。
(defun type-of-symbol (sym)
  (let ((result nil))
    (setf result (symbol-attribute sym))
    (if (null result)
        (setf result "")
        (setf result (string-capitalize (symbol-name result)))
        ) ;; end if
    (return-from type-of-symbol result)
    ) ;; end let
  ) ;; end type-of-symbol

(defun ls (&key (string "") (package *package*)
             (external t) (internal nil) (inherited nil)
             (verbose t) (quiet nil))
  "指定したパッケージの指定された種類のシンボルを一覧表示する。"

  (let (
        (target (find-package package))
        (count 0)
        (total-count 0)
        (kind nil)
        (kind-str nil)
        (lst '(external internal inherited))
        (lst-evaled (list external internal inherited))
        p
        )

    (when (null target)
      (warn "Package ~a not found." package)
      (return-from ls (values))
      ) ;; end when
    
    (when (not (stringp string))
      (setf string (string-downcase (symbol-name string)))
      )

    (setf total-count 0)
    (dotimes (i (length lst))
      (setf p (nth i lst))
      ;;(format t "p=~s~%" p)
      (when (identity (nth i lst-evaled))
        (when (not quiet)
          (format t "~a symbols in ~a:~%"
                  (string-capitalize (symbol-name p))
                  (string-downcase (package-name target))
                  )
          ) ;; end inner when
        (setf count 0)
        (dolist (q (get-symbols target p))
          (when (or (zerop (length string)) (search string (symbol-name q) :test #'string-equal))
            (incf count)
            (cond
              ((identity verbose)
               (setf kind (type-of-symbol q))
               ;;(setf kind-str (if kind (format nil "(~{~a~^/~})" kind) ""))
               (setf kind-str (if kind (format nil "(~a)" kind) ""))
               (format t "~18@a " kind-str)
               (format t "~a~%" (string-downcase (symbol-name q)))
               )
              (t
               (format t "~8@t~a~%" (string-downcase (symbol-name q)))
               )
              ) ;; end cond
            )
          ) ;; end dolist

        (when (identity verbose)
          (format t "~d symbols~%" count)
          ) ;; end when
        (incf total-count count)
        ) ;; end when
      )   ;; end dotimes
    (when (identity verbose)
      (format t "Total: ~d symbols~%" total-count)
      ) ;; end when
    (values)
    ) ;; end let
  ) ;; end ls

;; 指定されたパッケージの指定されたアクセシビリティのシンボル一覧のリストを返す。
(defun get-symbols (pkg accessibility)
  (cond
    ((eql accessibility 'external)
     (get-external-symbols pkg))
    ((eql accessibility 'internal)
     (get-internal-symbols pkg))
    ((eql accessibility 'inherited)
     (get-inherited-symbols pkg))
    (t (warn "Symbol's accessibility should be :external, :internal, or :inherited.~%"))
    ) ;; end cond
  )

(defun shortest-string (string1 string2)
  "二つの文字列のうち、長さが短い方を返す。"
  (if (< (length string1) (length string2))
      string1
      string2
      ) ;; end if
  ) ;; end shortest-string

(defun find-shortest-string (string-list)
  "リスト内の全ての文字列を比較し、最も短い文字列を返す。"
  
  ;; リストが空の場合は[nil]を返す
  (when (null string-list)
    (return-from find-shortest-string nil))

  ;; REDUCE がリストの要素を順にshortest-string-reducerに適用する
  (reduce #'shortest-string string-list)

  ) ;; end find-shortest-string

(defun shortest-nickname (pkg)
  "パッケージが複数のニックネームを持つ場合、最も文字数が短いニックネームを返す。"
  (when (null (package-nicknames pkg))
    (return-from shortest-nickname nil)
    )
  (return-from shortest-nickname (find-shortest-string (package-nicknames pkg)))
  ) ;; end shortest-nickname

;; [p],[q] must be string.
;; [p]と[q]の長さを比較して[p]の方が短ければ[t]を返し、そうでなければ[nil]を返す。
;; 長さが同じなら[p]の方が[q]より辞書式順序で前なら[t]を返し、そうでなければ[nil]を返す。
(defun shortest-first-order (p q)
  "2つの文字列を比較して第1引数が第2引数より文字数が短ければ[t]を返し、そうでなければ[nil]を返す。
2つの文字列の長さが同じ場合は第1引数が第2引数より辞書式順序で前ならば[t]を返し、そうでなければ[nil]を返す。"
  (let (len-p len-q)
    (setf len-p (length p))
    (setf len-q (length q))
    (cond
      ((< len-p len-q)
       t)
      ((and
        (= len-p len-q)
        (string< p q))
       t)
      ((and ;; 「安定なソート」
        (= len-p len-q)
        (string= p q))
       t)
      (t nil)
      ) ;; end cond
    )   ;; end let
  ) ;; end shortest-first-order

(defun sort-nicknames (pkg)
  (when (null (package-nicknames pkg))
    (return-from sort-nicknames nil)
    ) ;; end when
  (sort (copy-seq (package-nicknames (package-name pkg))) #'shortest-first-order)
  ) ;; end sort-nicknames

(defun name-case-convert (name-string)
  (package-name-case-convert name-string)
  )

(defun package-name-case-convert (package-name-string)
  "プロンプトに表示するパッケージ名の形式を大文字・小文字・先頭のみ大文字・処理系標準にする。
"
  (let ((package-case nil))
    (setf package-case (get-package-name-case))
    (cond
      ((null package-case)
       package-name-string
       )
      ;; キーワードが[:downcase, :upcase, :capitalize]以外のときは何もしない。
      ((null (member package-case '(:downcase :upcase :capitalize) :test #'equal))
       package-name-string
       )
      ((equal package-case :downcase) ;; [:downcase]なら小文字化して返す。
       (string-downcase package-name-string)
       )
      ((equal package-case :upcase) ;; [:upcase]なら大文字化して返す。
       (string-upcase package-name-string)
       )
      ((equal package-case :capitalize) ;; [:capitalize]なら単語の先頭文字のみ大文字にして返す。
       (string-capitalize package-name-string)
       )
      ) ;; end cond
    )   ;; end let
  ) ;; end package-name-case-convert

(defun set-package-name-case (package-case)
  "プロンプト構成指示子のうち

	:current-package
	:original-package-name
	:not-cl-user

のパッケージ名文字列はスペシャル変数

	*package-case*

の設定に従う。それぞれ小文字化、大文字化、キャピタライズを意味する。

	(set-package-name-case ':downcase)	==> 小文字化
	(set-package-name-case ':upcase)	==> 大文字化
	(set-package-name-case ':capitalize)	==> 先頭のみ大文字 
	(set-package-name-case nil)		==> 処理系の設定通り(通常は大文字)

[nil]なら処理系の返す文字列のまま(通常は大文字)。
"
  (if (member package-case '(:downcase :upcase :capitalize) :test #'equal)
      (setf *package-case* package-case)
      (setf *package-case* nil)
      ) ;; end if
  (return-from set-package-name-case *package-case*)
  ) ;; end set-package-name-case

(defun get-package-name-case ()
  (return-from get-package-name-case *package-case*)
  )

;;
;; シンボルの属性を返す。
;;
(defun symbol-attribute (sym)
  (let ((result nil))
    (if (find-class sym nil) (setf result :class))
    (if (boundp sym) (setf result :variable))
    (if (constantp sym) (setf result :constant))
    (if (find-package sym) (setf result :package))
    (if (fboundp sym) (setf result :function))
    (if (macro-function sym) (setf result :macro)) ;; [:function]かつ[:macro]であれば[:macro]。
    (return-from symbol-attribute result)
    ) ;; end let
  ) ;; end symbol-attribute

(let ((last-pkg nil) (last-result nil))
  ;;
  ;; 指定されたパッケージの外部シンボル一覧を文字列化したリストと、その個数を返す。
  ;;
  (defun get-external-symbols (&optional (pkg *package*))
    (let ((n 0))
      (if (equal pkg last-pkg)
          (setf n (first last-result))
          (setf n (first (get-external&internal&inherited-symbol-list pkg)))
          ) ;; end if
      (values n (length n))
      ) ;; end let
    )     ;; end get-current-external-symbols

  ;;
  ;; 指定されたパッケージの内部シンボル一覧を文字列化したリストと、その個数を返す。
  ;;
  (defun get-internal-symbols (&optional (pkg *package*))
    (let ((n 0))
      (if (equal pkg last-pkg)
          (setf n (second last-result))
          (setf n (second (get-external&internal&inherited-symbol-list pkg)))
          ) ;; end if
      (values n (length n))
      ) ;; end let
    ) ;; end get-internal-symbols

  ;;
  ;; [use-package]を介して継承されているシンボル(=内部シンボル)一覧を文字列化したリストと、その個数を返す。
  ;;
  (defun get-inherited-symbols (&optional (pkg *package*))
    (let ((n 0))
      (if (equal pkg last-pkg)
          (setf n (third last-result))
          (setf n (third (get-external&internal&inherited-symbol-list pkg)))
          ) ;; end if
      (values n (length n))
      ) ;; end let
    ) ;; end get-external-internal-inherited-symbols

  (defun get-external&internal&inherited-symbol-list (&optional (pkg *package*))
    (let ((external-symbols nil)
          (internal-symbols nil)
          (inherited-symbols nil) )
      (setf last-pkg pkg)
      (do-symbols (s (find-package pkg))
        (when (symbol-attribute s)
          (multiple-value-bind (sym status) (find-symbol (symbol-name s) pkg)
            (declare (ignore sym))
            (cond
              ((equal status :external)
               (pushnew s external-symbols))
              ((equal status :internal)
               (pushnew s internal-symbols))
              ((and
                (equal status :inherited)
                (not (equal (symbol-package s) (find-package :common-lisp)))
                )
               (pushnew s inherited-symbols))
              (t nil)
              ) ;; end cond
            )   ;; end multiple-value-bind
          )
        )     ;; end do-symbols
      (setf last-result (list external-symbols internal-symbols inherited-symbols))
      ) ;; end let
    )   ;; end get-external&internal&inherited-symbol-list
  ) ;; end let

#+ :build-as-packages (provide :move-around-package-like-dir-stack)
