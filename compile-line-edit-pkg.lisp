(pushnew :build-as-packages *features*)
(pushnew :use-history-pkg   *features*)
(pushnew :use-package-util  *features*)
;;(pushnew :debug *features*)

(load "~/build-utils.lisp")

#+sbcl (load (get-src-path "package-util.fasl"))
#+sbcl (load (get-src-path "simple-debug-functions.fasl"))
#+sbcl (load (get-src-path "basic-symbol-name-function.fasl"))
#+sbcl (load (get-src-path "external-command.fasl"))
#+sbcl (load (get-src-path "print-color-string.fasl"))
#+sbcl (load (get-src-path "history-pkg.fasl"))

#+clisp (load (get-src-path "package-util.fas"))
#+clisp (load (get-src-path "simple-debug-functions.fas"))
#+clisp (load (get-src-path "basic-symbol-name-function.fas"))
#+clisp (load (get-src-path "external-command.fas"))
#+clisp (load (get-src-path "print-color-string.fas"))
#+clisp (load (get-src-path "history-pkg.fas"))

#+gcl (load (get-src-path "package-util.o"))
#+gcl (load (get-src-path "simple-debug-functions.o"))
#+gcl (load (get-src-path "basic-symbol-name-function.o"))
#+gcl (load (get-src-path "external-command.o"))
#+gcl (load (get-src-path "print-color-string.o"))
#+gcl (load (get-src-path "history-pkg.o"))

#+sbcl (declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

;;#+sbcl (sb-int:clear-info :function :where-from 'external-command:find-current-and-home-dir)
;;#+sbcl (sb-int:clear-info :function :type 'external-command:find-current-and-home-dir)
;;#+sbcl (sb-int:clear-info :function :definition 'external-command:find-current-and-home-dir)
;;(declaim (notinline external-command:find-current-and-home-dir))
(compile-file (get-src-path "line-edit-pkg.lisp"))

#+sbcl (exit)
#+clisp (exit)
#+gcl (si::bye)
