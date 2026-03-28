;;;; 
;;;; last updated : 2026-01-24 10:47:16(JST)
;;;;

#+ :build-as-packages
(defpackage :simple-debug-functions
  (:use :common-lisp)
  (:nicknames :debug-print)
  (:export
   #:debug-print
   #:debug-print-p
   )
  )

(in-package :simple-debug-functions)

(defparameter *debug-print* nil)

(defun debug-print (&optional (arg t))
  "デバッグ・プリントを表示させるキーワード文字列を登録する関数。
引数に文字列または文字列のリストを指定すると、指定された文字列をデバッグ対象文字列に追加する。
結果として現在のデバッグ対象文字列のリストを返す。
引数に[nil]を指定するとキーワード文字列をリセットする。
引数を省略すると現在登録されているキーワード文字列を返す。
"
  (cond
    ((null arg)
     (setf *debug-print* nil)
     )
    ((and
      (stringp arg)
      (stringp *debug-print*)
      )
     (setf *debug-print* (list arg *debug-print*))
     )
    ((and
      (stringp arg)
      (listp *debug-print*)
      )
     (push arg *debug-print*)
     )
    ((and
      (listp arg)
      (every #'stringp arg)
      (listp *debug-print*)
      )
     (setf *debug-print* (append arg *debug-print*))
     )
    (t
     *debug-print*
     )
    )
  ) ;; end debug-print

(defun debug-print-p (&optional (args t))
  "引数として文字列、または文字列のリストを与える。
指定された文字列がスペシャル変数[*debug-print*]に設定されている文字列と等しいか、
または文字列のリストの要素の一部と等しければ[t]を返す。
引数を指定しない[=nil]と常に[t]を返す。
文字列または[nil]以外の値を指定すると常に[t]を返す。
"
  (cond
    ((null args)
     t)
    ((null *debug-print*)
     nil)
    ((and
      (stringp args)
      (stringp *debug-print*)
      )
     (string-equal args *debug-print*)
     )
    ((and
      (stringp args)
      (listp *debug-print*)
      (every #'stringp *debug-print*)
      )
     (member args *debug-print* :test #'string-equal)
     )
    ((and
      (listp args)
      (stringp *debug-print*)
      )
     (member *debug-print* args :test #'string-equal)
     )
    ((and
      (listp args)
      (every #'stringp args)
      (listp *debug-print*)
      (every #'stringp *debug-print*)
      )
     (intersection args *debug-print* :test #'string-equal)
     )
    ((identity args)
     t
     )
    ) ;; end cond
  ) ;; end debug-print-p

#+ :build-as-packages (provide :simple-debug-functions)
