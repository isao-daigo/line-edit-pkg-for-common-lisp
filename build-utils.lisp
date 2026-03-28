;; build-utils.lisp

;;
;; 環境変数[env-var]で指定されたパスを第1引数のファイルに付加した文字列を返す。
;;
(defun get-src-path (filename &optional (env-var "SOURCE_DIR"))
  (let* ((env-dir (or #+sbcl (sb-ext:posix-getenv env-var)
                      #+clisp (ext:getenv env-var)
                      #+ gcl   (si:getenv env-var)
                      "~/Lisp/line-edit/")) ; フォールバック
         (base-dir (if (char= #\/ (char env-dir (1- (length env-dir)))) ;; 末尾がスラッシュでなければ付け足す
                       env-dir
                       (concatenate 'string env-dir "/"))))
    ;;(merge-pathnames filename (pathname base-dir))))
    (concatenate 'string base-dir filename)))
