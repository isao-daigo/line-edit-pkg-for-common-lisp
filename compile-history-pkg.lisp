(pushnew :build-as-packages *features*)
(pushnew :use-history-pkg *features*)

(load "~/build-utils.lisp")

#+sbcl (load (get-src-path "package-util.fasl"))
#+sbcl (load (get-src-path "simple-debug-functions.fasl"))
#+sbcl (load (get-src-path "basic-symbol-name-function.fasl"))
#+sbcl (load (get-src-path "external-command.fasl"))
#+sbcl (load (get-src-path "print-color-string.fasl"))

#+clisp (load (get-src-path "package-util.fas"))
#+clisp (load (get-src-path "simple-debug-functions.fas"))
#+clisp (load (get-src-path "basic-symbol-name-function.fas"))
#+clisp (load (get-src-path "external-command.fas"))
#+clisp (load (get-src-path "print-color-string.fas"))

#+gcl (load (get-src-path "package-util.o"))
#+gcl (load (get-src-path "simple-debug-functions.o"))
#+gcl (load (get-src-path "basic-symbol-name-function.o"))
#+gcl (load (get-src-path "external-command.o"))
#+gcl (load (get-src-path "print-color-string.o"))

#+sbcl (declaim (sb-ext:muffle-conditions sb-ext:compiler-note))
(compile-file (get-src-path "history-pkg.lisp"))

#+sbcl (exit)
#+clisp (exit)
#+gcl (si::bye)
