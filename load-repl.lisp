(pushnew :builed-as-packages *features*)
(pushnew :use-history-pkg *features*)

(load "~/build-utils.lisp" :verbose nil :print nil)

(let ((*load-verbose* nil))
  ;; ロード順序は依存関係の下位から上位へ。さもないとエラーとなる。
  ;; ファイル/ロード時のメッセージを抑止する。
  #+ sbcl (load (get-src-path "simple-debug-functions.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "package-util.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "basic-symbol-name-function.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "external-command.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "print-color-string.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "history-pkg.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "line-edit-pkg.fasl") :verbose nil :print nil)
  #+ sbcl (load (get-src-path "history-repl.fasl") :verbose nil :print nil)
      
  #+ clisp (load (get-src-path "simple-debug-functions.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "package-util.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "basic-symbol-name-function.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "external-command.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "print-color-string.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "history-pkg.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "line-edit-pkg.fas") :verbose nil :print nil)
  #+ clisp (load (get-src-path "history-repl.fas") :verbose nil :print nil)

  #+ gcl (load (get-src-path "simple-debug-functions.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "package-util.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "basic-symbol-name-function.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "external-command.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "print-color-string.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "history-pkg.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "line-edit-pkg.o") :verbose nil :print nil)
  #+ gcl (load (get-src-path "history-repl.o") :verbose nil :print nil)
  ) ;; end let

(in-package :cl-user)

;;(setf *print-level* 5)
;;(setf *print-length* 5)

;;(debug-print::debug-print "true-get-candidates")
;;(debug-print:debug-print "display-line")
;;(debug-print:debug-print "line-edit-command-loop")
;;(debug-print:debug-print "set-point")
;;(debug-print:debug-print "info-list")

;;(trace line-edit-pkg::sync-point-and-cursor)
;;(trace line-edit-pkg::display-range)
;;(trace line-edit-pkg::display-line)
;;(trace line-edit-pkg::set-point)
;;(trace line-edit-pkg::current-line)
;;(trace line-edit-pkg::get-command)
;;(trace line-edit-pkg::jump-and-return-balanced-paren)
;;(trace line-edit-pkg::move-to-matching-paren)
;;(trace line-edit-pkg::skip-double-quoted-string)
;;(trace line-edit-pkg::skip-string-or-literal)
;;(trace line-edit-pkg::self-insert)

;; cd, pushd, popd, dirs, lsをすべてのパッケージでパッケージ修飾子なしで使えるようにする。
(shadowing-import '(package-util:cd
                    package-util:pushd
                    package-util:popd
                    package-util:dirs
                    package-util:ls)
                  :common-lisp-user)
(use-package :package-util)

(history-repl:history-repl)
