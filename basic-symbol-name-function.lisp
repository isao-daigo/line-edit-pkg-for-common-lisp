;;;; last updated : 2026-01-24 10:46:58(JST)

(defpackage :basic-symbol-name-function
  (:use :common-lisp)
  (:export
   #:member-by-symbol-name
   #:assoc-by-symbol-name
   #:string-equal-by-symbol-name
   )
  )

(in-package :basic-symbol-name-function)

(defun alist-p (list)
  "リストのすべての要素がコンスセルであり、連想リストの形式を満たしているか判定する。

(alist-p '((a . b) (c . d))) ; => T
(alist-p '(a b c))           ; => NIL (要素がシンボルであり、コンスセルではない)
(alist-p '((a . b) c))       ; => NIL (最後の要素 c がコンスセルではない)
(alist-p nil)                ; => T (空リストは有効なAlistであるため)
"
  (and (listp list)		;; 引数がリストであり
       (every #'consp list)	;; リスト内のすべての要素がコンスセルであること
       )
  )

;;
;; シンボルのパッケージが異なる場合でもシンボル名が一致するかどうかで判定する。
;;
(defun member-by-symbol-name (item list)
  "ITEM（シンボル）がLISTの要素（シンボル）と名前が一致するかどうかを判定する。"
  (declare (inline symbol-name string-equal))
  (if (not (symbolp item)) (return-from member-by-symbol-name nil))
  (member (symbol-name item) list :key #'symbol-name :test #'string-equal)
  )

;;
;; シンボルのパッケージが異なる場合でもシンボル名が一致するかどうかで判定する。
;;
(defun assoc-by-symbol-name (item a-list)
  (declare (inline symbol-name string-equal))

  (when (or (not (symbolp item)) (not (alist-p a-list)))
    (return-from assoc-by-symbol-name nil)
    ) ;; end when

  (assoc (symbol-name item) a-list :test #'string-equal :key #'symbol-name)
  )

;;
;; シンボルのパッケージが異なる場合でもシンボル名が一致するかどうかで判定する。
;;
(defun string-equal-by-symbol-name (sym-1 sym-2)
  (string-equal (symbol-name sym-1) (symbol-name sym-2))
  )

(provide :basic-symbol-name-function)
