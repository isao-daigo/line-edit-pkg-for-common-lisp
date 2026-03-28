(pushnew :build-as-packages *features*)

(load "~/build-utils.lisp")

#+sbcl (declaim (sb-ext:muffle-conditions sb-ext:compiler-note))
(compile-file (get-src-path "simple-debug-functions.lisp"))

#+sbcl (exit)
#+clisp (exit)
#+gcl (si::bye)
