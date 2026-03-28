
;;; ===========================================================================
;;; Completion Dictionary Data
;;;
;;; The syntax information for Common Lisp symbols was derived from:
;;; 1. Common Lisp HyperSpec (CLHS) by Kent M. Pitman (LispWorks).
;;;    (c) 1996-2005 LispWorks.
;;; 2. Slim-CLHS project by Inaimathi (GitHub), which provides extracted 
;;;    one-line syntax summaries for ANSI CL symbols.
;;;
;;; Combined and formatted for 'line-edit-pkg' by Gemini (Google AI) 2025.
;;; Modified by Isao Daigo.
;;; ===========================================================================
;;
;; <syntax-info> ::= ( <name> :last-access <time> :count <count-number> <type> <info> ) ;;
;; <name> ::= <string> ;;
;; <time> ::= {1900年1月1日0時0分0秒からの経過秒数} ;; universal-time.
;; <count-number> ::= {定義本体が採用された回数} ;;
;; <type> ::= :function | :macro | :special | :constant | :class | :declaration | :document | :type ;;
;; <info> ::= {情報本体(文字列)} ;;
;;

("abort" :|last-access| 0 :|count| 0 :|function|
 "abort &optional condition) => |")
("abs" :|last-access| 0 :|count| 0 :|function| "abs number => absolute-value")
("access-date" :|last-access| 0 :|count| 0 :|function|
 "access-date path) => universal-time")
("acons" :|last-access| 0 :|count| 0 :|function|
 "acons key datum alist) => new-alist")
("acos" :|last-access| 0 :|count| 0 :|function| "acos number) => radians")
("acosh" :|last-access| 0 :|count| 0 :|function| "acosh number) => res")
("add-method" :|last-access| 0 :|count| 0 :|function|
 "add-method generic-function method) => generic-function")
("adjoin" :|last-access| 0 :|count| 0 :|function|
 "adjoin item list &key key test test-not) => new-list")
("adjust-array" :|last-access| 0 :|count| 0 :|function|
 "adjust-array array new-dimensions &key element-type initial-element initial-contents fill-pointer displaced-to displaced-index-offset) => adjusted-array")
("adjustable-array-p" :|last-access| 0 :|count| 0 :|function|
 "adjustable-array-p array) => generalized-boolean")
("allocate-instance" :|last-access| 0 :|count| 0 :|function|
 "allocate-instance class &rest initargs) => new-instance")
("alpha-char-p" :|last-access| 0 :|count| 0 :|function|
 "alpha-char-p character) => generalized-boolean")
("alphanumericp" :|last-access| 0 :|count| 0 :|function|
 "alphanumericp character) => generalized-boolean")
("and" :|last-access| 0 :|count| 0 :|macro| "and form*) => result*")
("append" :|last-access| 0 :|count| 0 :|function|
 "append &rest lists) => result")
("apply" :|last-access| 0 :|count| 1 :|function|
 "apply function &rest args+) => result*")
("apropos" :|last-access| 0 :|count| 0 :|function|
 "apropos string &optional package) => <no values>")
("apropos-list" :|last-access| 0 :|count| 0 :|function|
 "apropos-list string &optional package) => symbols")
("aref" :|last-access| 0 :|count| 0 :|function|
 "aref array &rest subscripts) => element")
("arithmetic-error-operands" :|last-access| 0 :|count| 0 :|function|
 "arithmetic-error-operands condition) => list")
("arithmetic-error-operation" :|last-access| 0 :|count| 0 :|function|
 "arithmetic-error-operation condition) => function")
("array-dimension" :|last-access| 0 :|count| 0 :|function|
 "array-dimension array axis-number) => dimension")
("array-dimensions" :|last-access| 0 :|count| 0 :|function|
 "array-dimensions array) => dimensions")
("array-displacement" :|last-access| 0 :|count| 0 :|function|
 "array-displacement array) => displaced-to, displaced-index-offset")
("array-element-type" :|last-access| 0 :|count| 0 :|function|
 "array-element-type array) => typespec")
("array-has-fill-pointer-p" :|last-access| 0 :|count| 0 :|function|
 "array-has-fill-pointer-p array) => generalized-boolean")
("array-in-bounds-p" :|last-access| 0 :|count| 0 :|function|
 "array-in-bounds-p array &rest subscripts) => generalized-boolean")
("array-rank" :|last-access| 0 :|count| 0 :|function|
 "array-rank array) => rank")
("array-row-major-index" :|last-access| 0 :|count| 0 :|function|
 "array-row-major-index array &rest subscripts) => index")
("array-total-size" :|last-access| 0 :|count| 0 :|function|
 "array-total-size array) => size")
("arrayp" :|last-access| 0 :|count| 0 :|function|
 "arrayp object) => generalized-boolean")
("ash" :|last-access| 0 :|count| 0 :|function|
 "ash integer count) => shifted-integer")
("asin" :|last-access| 0 :|count| 0 :|function| "asin number) => radians")
("asinh" :|last-access| 0 :|count| 0 :|function| "asinh number) => res")
("assert" :|last-access| 0 :|count| 0 :|macro|
 "assert test-form [({place}*) [datum-form {argument}*]]) => nil")
("assoc" :|last-access| 0 :|count| 0 :|function|
 "assoc item alist &key key test test-not) => entry")
("assoc-if" :|last-access| 0 :|count| 0 :|function|
 "assoc-if predicate alist &key key) => entry")
("assoc-if-not" :|last-access| 0 :|count| 0 :|function|
 "assoc-if-not predicate alist &key key) => entry")
("atan" :|last-access| 0 :|count| 0 :|function|
 "atan number1 &optional number2) => radians")
("atanh" :|last-access| 0 :|count| 0 :|function| "atanh number) => res")
("atom" :|last-access| 0 :|count| 0 :|function|
 "atom object) => generalized-boolean")
("bit" :|last-access| 0 :|count| 0 :|function|
 "bit array &rest subscripts) => bit")
("bit-and" :|last-access| 0 :|count| 0 :|function|
 "bit-and bit-array1 bit-array2 &optional opt-arg) => result-array")
("block" :|last-access| 0 :|count| 0 :|special| "block name form*) => result*")
("boundp" :|last-access| 0 :|count| 0 :|function|
 "boundp symbol) => generalized-boolean")
("break" :|last-access| 0 :|count| 0 :|function|
 "break &optional format-control &rest format-arguments) => nil")
("broadcast-stream-streams" :|last-access| 0 :|count| 0 :|function|
 "broadcast-stream-streams stream) => streams")
("built-in-class" :|last-access| 0 :|count| 0 :|class| "built-in-class")
("butlast" :|last-access| 0 :|count| 0 :|function|
 "butlast list &optional n) => result-list")
("byte" :|last-access| 0 :|count| 0 :|function|
 "byte size position) => bytespec")
("byte-position" :|last-access| 0 :|count| 0 :|function|
 "byte-position bytespec) => position")
("byte-size" :|last-access| 0 :|count| 0 :|function|
 "byte-size bytespec) => size")
("caaaar" :|last-access| 0 :|count| 0 :|function| "caaaar x) => object")
("caaadr" :|last-access| 0 :|count| 0 :|function| "caaadr x) => object")
("caaar" :|last-access| 0 :|count| 0 :|function| "caaar x) => object")
("caadar" :|last-access| 0 :|count| 0 :|function| "caadar x) => object")
("caaddr" :|last-access| 0 :|count| 0 :|function| "caaddr x) => object")
("caadr" :|last-access| 0 :|count| 0 :|function| "caadr x) => object")
("caar" :|last-access| 0 :|count| 0 :|function| "caar x) => object")
("cadaar" :|last-access| 0 :|count| 0 :|function| "cadaar x) => object")
("cadadr" :|last-access| 0 :|count| 0 :|function| "cadadr x) => object")
("cadar" :|last-access| 0 :|count| 0 :|function| "cadar x) => object")
("caddar" :|last-access| 0 :|count| 0 :|function| "caddar x) => object")
("cadddr" :|last-access| 0 :|count| 0 :|function| "cadddr x) => object")
("caddr" :|last-access| 0 :|count| 0 :|function| "caddr x) => object")
("cadr" :|last-access| 0 :|count| 0 :|function| "cadr x) => object")
("call-arguments-limit" :|last-access| 0 :|count| 0 :|constant|
 "call-arguments-limit")
("call-method" :|last-access| 0 :|count| 0 :|macro|
 "call-method method &optional next-method-list) => result*")
("call-next-method" :|last-access| 0 :|count| 0 :|function|
 "call-next-method &rest args) => result*")
("car" :|last-access| 0 :|count| 0 :|function| "car list) => object")
("case" :|last-access| 0 :|count| 0 :|macro|
 "case keyform {((key*) form*)}*) => result*")
("catch" :|last-access| 0 :|count| 0 :|special|
 "catch tag-form form*) => result*")
("ccase" :|last-access| 0 :|count| 0 :|macro|
 "ccase keyplace {((key*) form*)}*) => result*")
("cdaaar" :|last-access| 0 :|count| 0 :|function| "cdaaar x) => object")
("cdaadr" :|last-access| 0 :|count| 0 :|function| "cdaadr x) => object")
("cdaar" :|last-access| 0 :|count| 0 :|function| "cdaar x) => object")
("cdadar" :|last-access| 0 :|count| 0 :|function| "cdadar x) => object")
("cdaddr" :|last-access| 0 :|count| 0 :|function| "cdaddr x) => object")
("cdadr" :|last-access| 0 :|count| 0 :|function| "cdadr x) => object")
("cdar" :|last-access| 0 :|count| 0 :|function| "cdar x) => object")
("cddaar" :|last-access| 0 :|count| 0 :|function| "cddaar x) => object")
("cddadr" :|last-access| 0 :|count| 0 :|function| "cddadr x) => object")
("cddar" :|last-access| 0 :|count| 0 :|function| "cddar x) => object")
("cdddar" :|last-access| 0 :|count| 0 :|function| "cdddar x) => object")
("cddddr" :|last-access| 0 :|count| 0 :|function| "cddddr x) => object")
("cdddr" :|last-access| 0 :|count| 0 :|function| "cdddr x) => object")
("cddr" :|last-access| 0 :|count| 0 :|function| "cddr x) => object")
("cdr" :|last-access| 0 :|count| 0 :|function| "cdr list) => object")
("ceiling" :|last-access| 0 :|count| 0 :|function|
 "ceiling number &optional divisor) => quotient, remainder")
("cell-error-name" :|last-access| 0 :|count| 0 :|function|
 "cell-error-name condition) => name")
("cerror" :|last-access| 0 :|count| 0 :|function|
 "cerror continue-format-control datum &rest arguments) => nil")
("char" :|last-access| 0 :|count| 0 :|function|
 "char string index) => character")
("char-code" :|last-access| 0 :|count| 0 :|function|
 "char-code character) => code")
("char-code-limit" :|last-access| 0 :|count| 0 :|constant| "char-code-limit")
("char-downcase" :|last-access| 0 :|count| 0 :|function|
 "char-downcase character) => downed-char")
("char-equal" :|last-access| 0 :|count| 0 :|function|
 "char-equal &rest characters+) => generalized-boolean")
("char-greaterp" :|last-access| 0 :|count| 0 :|function|
 "char-greaterp &rest characters+) => generalized-boolean")
("char-lessp" :|last-access| 0 :|count| 0 :|function|
 "char-lessp &rest characters+) => generalized-boolean")
("char-name" :|last-access| 0 :|count| 0 :|function|
 "char-name character) => name")
("char-not-equal" :|last-access| 0 :|count| 0 :|function|
 "char-not-equal &rest characters+) => generalized-boolean")
("char-not-greaterp" :|last-access| 0 :|count| 0 :|function|
 "char-not-greaterp &rest characters+) => generalized-boolean")
("char-not-lessp" :|last-access| 0 :|count| 0 :|function|
 "char-not-lessp &rest characters+) => generalized-boolean")
("char-upcase" :|last-access| 0 :|count| 0 :|function|
 "char-upcase character) => upped-char")
("character" :|last-access| 0 :|count| 0 :|function|
 "character object) => character")
("characterp" :|last-access| 0 :|count| 0 :|function|
 "characterp object) => generalized-boolean")
("check-type" :|last-access| 0 :|count| 0 :|macro|
 "check-type place typespec [string]) => nil")
("cis" :|last-access| 0 :|count| 0 :|function| "cis radians) => number")
("class-name" :|last-access| 0 :|count| 0 :|function|
 "class-name class) => name")
("class-of" :|last-access| 0 :|count| 0 :|function| "class-of object) => class")
("clear-input" :|last-access| 0 :|count| 0 :|function|
 "clear-input &optional input-stream) => nil")
("clear-output" :|last-access| 0 :|count| 0 :|function|
 "clear-output &optional output-stream) => nil")
("close" :|last-access| 0 :|count| 0 :|function|
 "close stream &key abort) => generalized-boolean")
("clrhash" :|last-access| 0 :|count| 0 :|function|
 "clrhash hash-table) => hash-table")
("code-char" :|last-access| 0 :|count| 0 :|function|
 "code-char code) => character")
("coerce" :|last-access| 0 :|count| 0 :|function|
 "coerce object result-type) => result")
("compilation-speed" :|last-access| 0 :|count| 0 :|declaration|
 "compilation-speed")
("compile" :|last-access| 0 :|count| 0 :|function|
 "compile name &optional definition) => function, warnings-p, failure-p")
("compile-file" :|last-access| 0 :|count| 0 :|function|
 "compile-file input-file &key output-file external-format) => output-truename, warnings-p, failure-p")
("compile-file-pathname" :|last-access| 0 :|count| 0 :|function|
 "compile-file-pathname input-file &key output-file) => pathname")
("compiled-function-p" :|last-access| 0 :|count| 0 :|function|
 "compiled-function-p object) => generalized-boolean")
("compiler-macro-function" :|last-access| 0 :|count| 0 :|function|
 "compiler-macro-function name &optional env) => function")
("complement" :|last-access| 0 :|count| 0 :|function|
 "complement function) => complement-function")
("complex" :|last-access| 0 :|count| 0 :|function|
 "complex realpart &optional imagpart) => complex")
("complexp" :|last-access| 0 :|count| 0 :|function|
 "complexp object) => generalized-boolean")
("compute-restarts" :|last-access| 0 :|count| 0 :|function|
 "compute-restarts &optional condition) => restarts")
("concatenate" :|last-access| 0 :|count| 0 :|function|
 "concatenate result-type &rest sequences) => result-sequence")
("cond" :|last-access| 0 :|count| 0 :|macro| "cond {clause}*) => result*")
("condition" :|last-access| 0 :|count| 0 :|class| "condition")
("conjugate" :|last-access| 0 :|count| 0 :|function|
 "conjugate number) => complex")
("cons" :|last-access| 0 :|count| 0 :|function| "cons object-1 object-2) => pair")
("consp" :|last-access| 0 :|count| 0 :|function|
 "consp object) => generalized-boolean")
("constantly" :|last-access| 0 :|count| 0 :|function|
 "constantly value) => function")
("constantp" :|last-access| 0 :|count| 0 :|function|
 "constantp form &optional env) => generalized-boolean")
("continue" :|last-access| 0 :|count| 0 :|function|
 "continue &optional condition) => nil")
("control-error" :|last-access| 0 :|count| 0 :|class| "control-error")
("copy-alist" :|last-access| 0 :|count| 0 :|function|
 "copy-alist alist) => new-alist")
("copy-list" :|last-access| 0 :|count| 0 :|function|
 "copy-list list) => new-list")
("copy-pprint-dispatch" :|last-access| 0 :|count| 0 :|function|
 "copy-pprint-dispatch &optional table) => new-table")
("copy-readtable" :|last-access| 0 :|count| 0 :|function|
 "copy-readtable &optional from-readtable to-readtable) => readtable")
("copy-seq" :|last-access| 0 :|count| 0 :|function| "copy-seq sequence) => copy")
("copy-structure" :|last-access| 0 :|count| 0 :|function|
 "copy-structure structure) => copy")
("copy-symbol" :|last-access| 0 :|count| 0 :|function|
 "copy-symbol symbol &optional copy-props) => new-symbol")
("copy-tree" :|last-access| 0 :|count| 0 :|function|
 "copy-tree tree) => new-tree")
("cos" :|last-access| 0 :|count| 0 :|function| "cos radians) => number")
("cosh" :|last-access| 0 :|count| 0 :|function| "cosh number) => res")
("count" :|last-access| 0 :|count| 0 :|function|
 "count item sequence &key from-end start end key test test-not) => count")
("ctypecase" :|last-access| 0 :|count| 0 :|macro|
 "ctypecase keyplace {((type) form*)}*) => result*")
("debug" :|last-access| 0 :|count| 0 :|declaration| "debug")
("decf" :|last-access| 0 :|count| 0 :|macro|
 "decf place [delta-form]) => new-value")
("declaim" :|last-access| 0 :|count| 0 :|macro|
 "declaim declaration-spec*) => implementation-dependent")
("declaration" :|last-access| 0 :|count| 0 :|declaration| "declaration")
("declare" :|last-access| 0 :|count| 0 :|special|
 "declare declaration-spec*) => error")
("decode-float" :|last-access| 0 :|count| 0 :|function|
 "decode-float float) => significand, exponent, sign")
("decode-universal-time" :|last-access| 0 :|count| 0 :|function|
 "decode-universal-time universal-time &optional time-zone) => second, minute, hour, date, month, year, day, daylight-p, zone")
("defclass" :|last-access| 0 :|count| 0 :|macro|
 "defclass class-name ({superclass-name}*) ({slot-spec}*) [[option]]) => new-class")
("defconstant" :|last-access| 0 :|count| 0 :|macro|
 "defconstant name initial-value [doc]) => name")
("defgeneric" :|last-access| 0 :|count| 0 :|macro|
 "defgeneric function-name lambda-list [[option | method-desc]]) => new-generic")
("define-compiler-macro" :|last-access| 0 :|count| 0 :|macro|
 "define-compiler-macro name lambda-list [[declaration* | doc]] form*) => name")
("define-condition" :|last-access| 0 :|count| 0 :|macro|
 "define-condition name ({parent-type}*) ({slot-spec}*) [[option]]) => name")
("define-method-combination" :|last-access| 0 :|count| 0 :|macro|
 "define-method-combination name [[option]]) => name")
("define-modify-macro" :|last-access| 0 :|count| 0 :|macro|
 "define-modify-macro name lambda-list function [doc]) => name")
("define-setf-expander" :|last-access| 0 :|count| 0 :|macro|
 "define-setf-expander access-fn lambda-list [[declaration* | doc]] form*) => access-fn")
("define-symbol-macro" :|last-access| 0 :|count| 0 :|macro|
 "define-symbol-macro symbol expansion) => symbol")
("defmacro" :|last-access| 0 :|count| 0 :|macro|
 "defmacro name lambda-list [[declaration* | doc]] form*) => name")
("defmethod" :|last-access| 0 :|count| 0 :|macro|
 "defmethod name {method-qualifier}* specialized-lambda-list [[declaration* | doc]] form*) => new-method")
("defpackage" :|last-access| 0 :|count| 0 :|macro|
 "defpackage package-name [[option]]) => package")
("defparameter" :|last-access| 0 :|count| 0 :|macro|
 "defparameter name initial-value [doc]) => name")
("defsetf" :|last-access| 0 :|count| 0 :|macro|
 "defsetf access-fn update-fn [doc]) => access-fn")
("defstruct" :|last-access| 0 :|count| 0 :|macro|
 "defstruct name-and-options [doc] {slot-description}*) => name")
("deftype" :|last-access| 0 :|count| 0 :|macro|
 "deftype name lambda-list [[declaration* | doc]] form*) => name")
("defun" :|last-access| 0 :|count| 0 :|macro|
 "defun name lambda-list [[declaration* | doc]] form*) => name")
("defvar" :|last-access| 0 :|count| 0 :|macro|
 "defvar name [initial-value [doc]]) => name")
("delete" :|last-access| 0 :|count| 0 :|function|
 "delete item sequence &key from-end test test-not start end count key) => sequence")
("delete-duplicates" :|last-access| 0 :|count| 0 :|function|
 "delete-duplicates sequence &key from-end test test-not start end key) => sequence")
("delete-file" :|last-access| 0 :|count| 0 :|function|
 "delete-file filespec) => t")
("delete-package" :|last-access| 0 :|count| 0 :|function|
 "delete-package package) => generalized-boolean")
("denominator" :|last-access| 0 :|count| 0 :|function|
 "denominator rational) => denominator")
("deposit-field" :|last-access| 0 :|count| 0 :|function|
 "deposit-field newbyte bytespec integer) => result-integer")
("describe" :|last-access| 0 :|count| 0 :|function|
 "describe object &optional stream) => <no values>")
("describe-object" :|last-access| 0 :|count| 0 :|function|
 "describe-object object stream) => values")
("destructuring-bind" :|last-access| 0 :|count| 0 :|macro|
 "destructuring-bind lambda-list expression declaration* form*) => result*")
("digit-char" :|last-access| 0 :|count| 0 :|function|
 "digit-char weight &optional radix) => char")
("digit-char-p" :|last-access| 0 :|count| 0 :|function|
 "digit-char-p char &optional radix) => weight")
("directory" :|last-access| 0 :|count| 0 :|function|
 "directory pathspec &key) => pathnames")
("directory-namestring" :|last-access| 0 :|count| 0 :|function|
 "directory-namestring pathspec) => namestring")
("disassemble" :|last-access| 0 :|count| 0 :|function| "disassemble fn) => nil")
("division-by-zero" :|last-access| 0 :|count| 0 :|class| "division-by-zero")
("do" :|last-access| 0 :|count| 0 :|macro|
 "do ({var-init-step}*) (end-test-form result*) {tag | statement}*) => result*")
("do-all-symbols" :|last-access| 0 :|count| 0 :|macro|
 "do-all-symbols (var [result-form]) {tag | statement}*) => result*")
("do-external-symbols" :|last-access| 0 :|count| 0 :|macro|
 "do-external-symbols (var [package [result-form]]) {tag | statement}*) => result*")
("do-symbols" :|last-access| 0 :|count| 0 :|macro|
 "do-symbols (var [package [result-form]]) {tag | statement}*) => result*")
("documentation" :|last-access| 0 :|count| 0 :|function|
 "documentation x doc-type) => string")
("dolist" :|last-access| 0 :|count| 0 :|macro|
 "dolist (var list-form [result-form]) {tag | statement}*) => result*")
("dotimes" :|last-access| 0 :|count| 0 :|macro|
 "dotimes (var count-form [result-form]) {tag | statement}*) => result*")
("double-float" :|last-access| 0 :|count| 0 :|type| "double-float")
("double-float-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "double-float-epsilon")
("double-float-negative-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "double-float-negative-epsilon")
("dpb" :|last-access| 0 :|count| 0 :|function|
 "dpb newbyte bytespec integer) => result-integer")
("dribble" :|last-access| 0 :|count| 0 :|function|
 "dribble &optional pathname) => implementation-dependent")
("dynamic-extent" :|last-access| 0 :|count| 0 :|declaration| "dynamic-extent")
("echo-stream-input-stream" :|last-access| 0 :|count| 0 :|function|
 "echo-stream-input-stream stream) => input-stream")
("echo-stream-output-stream" :|last-access| 0 :|count| 0 :|function|
 "echo-stream-output-stream stream) => output-stream")
("ed" :|last-access| 0 :|count| 0 :|function|
 "ed &optional x) => implementation-dependent")
("elt" :|last-access| 0 :|count| 0 :|function| "elt sequence index) => object")
("encode-universal-time" :|last-access| 0 :|count| 0 :|function|
 "encode-universal-time sec min hr date mon yr &optional zone) => universal-time")
("end-of-file" :|last-access| 0 :|count| 0 :|class| "end-of-file")
("endp" :|last-access| 0 :|count| 0 :|function|
 "endp list) => generalized-boolean")
("enough-namestring" :|last-access| 0 :|count| 0 :|function|
 "enough-namestring path &optional relative-to) => namestring")
("ensure-directories-exist" :|last-access| 0 :|count| 0 :|function|
 "ensure-directories-exist pathspec &key verbose) => pathspec, created")
("ensure-generic-function" :|last-access| 0 :|count| 0 :|function|
 "ensure-generic-function function-name &key) => generic-function")
("eq" :|last-access| 0 :|count| 0 :|function| "eq x y) => generalized-boolean")
("eql" :|last-access| 0 :|count| 0 :|function| "eql x y) => generalized-boolean")
("equal" :|last-access| 0 :|count| 0 :|function|
 "equal x y) => generalized-boolean")
("equalp" :|last-access| 0 :|count| 0 :|function|
 "equalp x y) => generalized-boolean")
("error" :|last-access| 0 :|count| 0 :|function|
 "error datum &rest arguments) => |")
("etypecase" :|last-access| 0 :|count| 0 :|macro|
 "etypecase keyplace {((type) form*)}*) => result*")
("eval" :|last-access| 0 :|count| 0 :|function| "eval form) => result*")
("eval-when" :|last-access| 0 :|count| 0 :|special|
 "eval-when ({situation}*) form*) => result*")
("evenp" :|last-access| 0 :|count| 0 :|function|
 "evenp integer) => generalized-boolean")
("every" :|last-access| 0 :|count| 0 :|function|
 "every predicate &rest sequences+) => generalized-boolean")
("exp" :|last-access| 0 :|count| 0 :|function| "exp number) => result")
("export" :|last-access| 0 :|count| 0 :|function|
 "export symbols &optional package) => t")
("expt" :|last-access| 0 :|count| 0 :|function|
 "expt base-number power-number) => result")
("fboundp" :|last-access| 0 :|count| 0 :|function|
 "fboundp name) => generalized-boolean")
("fceiling" :|last-access| 0 :|count| 0 :|function|
 "fceiling number &optional divisor) => quotient, remainder")
("fdefinition" :|last-access| 0 :|count| 0 :|function|
 "fdefinition name) => definition")
("ffloor" :|last-access| 0 :|count| 0 :|function|
 "ffloor number &optional divisor) => quotient, remainder")
("fifth" :|last-access| 0 :|count| 0 :|function| "fifth list) => object")
("file-author" :|last-access| 0 :|count| 0 :|function|
 "file-author pathspec) => author")
("file-error-pathname" :|last-access| 0 :|count| 0 :|function|
 "file-error-pathname condition) => pathspec")
("file-length" :|last-access| 0 :|count| 0 :|function|
 "file-length stream) => length")
("file-namestring" :|last-access| 0 :|count| 0 :|function|
 "file-namestring pathspec) => namestring")
("file-position" :|last-access| 0 :|count| 0 :|function|
 "file-position stream &optional position-spec) => success-p")
("file-string-length" :|last-access| 0 :|count| 0 :|function|
 "file-string-length stream object) => length")
("file-write-date" :|last-access| 0 :|count| 0 :|function|
 "file-write-date pathspec) => date")
("fill" :|last-access| 0 :|count| 0 :|function|
 "fill sequence item &key start end) => sequence")
("fill-pointer" :|last-access| 0 :|count| 0 :|function|
 "fill-pointer vector) => fill-pointer")
("find" :|last-access| 0 :|count| 0 :|function|
 "find item sequence &key from-end test test-not start end key) => element")
("find-all-symbols" :|last-access| 0 :|count| 0 :|function|
 "find-all-symbols string) => symbols")
("find-class" :|last-access| 0 :|count| 0 :|function|
 "find-class symbol &optional errorp env) => class")
("find-if" :|last-access| 0 :|count| 0 :|function|
 "find-if predicate sequence &key from-end start end key) => element")
("find-if-not" :|last-access| 0 :|count| 0 :|function|
 "find-if-not predicate sequence &key from-end start end key) => element")
("find-method" :|last-access| 0 :|count| 0 :|function|
 "find-method gf qualifiers specializers &optional errorp) => method")
("find-package" :|last-access| 0 :|count| 0 :|function|
 "find-package name) => package")
("find-restart" :|last-access| 0 :|count| 0 :|function|
 "find-restart identifier &optional condition) => restart")
("find-symbol" :|last-access| 0 :|count| 0 :|function|
 "find-symbol string &optional package) => symbol, status")
("finish-output" :|last-access| 0 :|count| 0 :|function|
 "finish-output &optional stream) => nil")
("first" :|last-access| 3977806536 :|count| 1 :|function|
 "first list) => object")
("flet" :|last-access| 0 :|count| 0 :|special|
 "flet ((fn lambda-list [[decl* | doc]] form*)*) form*) => res*")
("float" :|last-access| 0 :|count| 0 :|function|
 "float number &optional prototype) => float")
("float-digits" :|last-access| 0 :|count| 0 :|function|
 "float-digits float) => digits")
("float-precision" :|last-access| 0 :|count| 0 :|function|
 "float-precision float) => precision")
("float-radix" :|last-access| 0 :|count| 0 :|function|
 "float-radix float) => radix")
("float-sign" :|last-access| 0 :|count| 0 :|function|
 "float-sign float1 &optional float2) => float")
("floatp" :|last-access| 0 :|count| 0 :|function|
 "floatp object) => generalized-boolean")
("floor" :|last-access| 0 :|count| 0 :|function|
 "floor number &optional divisor) => quotient, remainder")
("fmakunbound" :|last-access| 0 :|count| 0 :|function|
 "fmakunbound name) => name")
("force-output" :|last-access| 0 :|count| 0 :|function|
 "force-output &optional stream) => nil")
("format" :|last-access| 0 :|count| 0 :|function|
 "format destination control-string &rest args) => result")
("formatter" :|last-access| 0 :|count| 0 :|macro|
 "formatter control-string) => function")
("fourth" :|last-access| 0 :|count| 0 :|function| "fourth list) => object")
("fresh-line" :|last-access| 0 :|count| 0 :|function|
 "fresh-line &optional stream) => generalized-boolean")
("fround" :|last-access| 0 :|count| 0 :|function|
 "fround number &optional divisor) => quotient, remainder")
("ftruncate" :|last-access| 0 :|count| 0 :|function|
 "ftruncate number &optional divisor) => quotient, remainder")
("ftype" :|last-access| 0 :|count| 0 :|declaration| "ftype")
("funcall" :|last-access| 0 :|count| 0 :|function|
 "funcall function &rest args) => result*")
("function" :|last-access| 0 :|count| 0 :|special| "function name) => function")
("function-keywords" :|last-access| 0 :|count| 0 :|function|
 "function-keywords method) => keys, allow-other-keys-p")
("function-lambda-expression" :|last-access| 0 :|count| 0 :|function|
 "function-lambda-expression fn) => lambda, closure-p, name")
("functionp" :|last-access| 0 :|count| 0 :|function|
 "functionp object) => generalized-boolean")
("gcd" :|last-access| 0 :|count| 0 :|function|
 "gcd &rest integers) => common-divisor")
("gensym" :|last-access| 0 :|count| 0 :|function|
 "gensym &optional x) => new-symbol")
("gentemp" :|last-access| 0 :|count| 0 :|function|
 "gentemp &optional prefix package) => new-symbol")
("get" :|last-access| 0 :|count| 0 :|function|
 "get symbol indicator &optional default) => value")
("get-decoded-time" :|last-access| 0 :|count| 0 :|function|
 "get-decoded-time) => sec, min, hour, date, mon, yr, day, daylight-p, zone")
("get-dispatch-macro-character" :|last-access| 0 :|count| 0 :|function|
 "get-dispatch-macro-character char subchar &optional table) => function")
("get-internal-real-time" :|last-access| 0 :|count| 0 :|function|
 "get-internal-real-time) => internal-time")
("get-internal-run-time" :|last-access| 0 :|count| 0 :|function|
 "get-internal-run-time) => internal-time")
("get-macro-character" :|last-access| 0 :|count| 0 :|function|
 "get-macro-character char &optional table) => function, non-terminating-p")
("get-output-stream-string" :|last-access| 0 :|count| 0 :|function|
 "get-output-stream-string stream) => string")
("get-properties" :|last-access| 0 :|count| 0 :|function|
 "get-properties plist indicator-list) => indicator, value, tail")
("get-setf-expansion" :|last-access| 0 :|count| 0 :|function|
 "get-setf-expansion place &optional env) => vars, vals, store-vars, writer, reader")
("get-universal-time" :|last-access| 0 :|count| 0 :|function|
 "get-universal-time) => universal-time")
("getf" :|last-access| 0 :|count| 0 :|function|
 "getf plist indicator &optional default) => value")
("gethash" :|last-access| 0 :|count| 0 :|function|
 "gethash key hash-table &optional default) => value, present-p")
("go" :|last-access| 0 :|count| 0 :|special| "go tag) => |")
("graphic-char-p" :|last-access| 0 :|count| 0 :|function|
 "graphic-char-p char) => generalized-boolean")
("handler-bind" :|last-access| 0 :|count| 0 :|macro|
 "handler-bind ({typespec handler}*) form*) => result*")
("handler-case" :|last-access| 0 :|count| 0 :|macro|
 "handler-case form {clause}*) => result*")
("hash-table-count" :|last-access| 0 :|count| 0 :|function|
 "hash-table-count hash-table) => count")
("hash-table-p" :|last-access| 0 :|count| 0 :|function|
 "hash-table-p object) => generalized-boolean")
("hash-table-rehash-size" :|last-access| 0 :|count| 0 :|function|
 "hash-table-rehash-size hash-table) => rehash-size")
("hash-table-rehash-threshold" :|last-access| 0 :|count| 0 :|function|
 "hash-table-rehash-threshold hash-table) => rehash-threshold")
("hash-table-size" :|last-access| 0 :|count| 0 :|function|
 "hash-table-size hash-table) => size")
("hash-table-test" :|last-access| 0 :|count| 0 :|function|
 "hash-table-test hash-table) => test")
("host-namestring" :|last-access| 0 :|count| 0 :|function|
 "host-namestring pathspec) => namestring")
("identity" :|last-access| 0 :|count| 0 :|function| "identity object) => object")
("if" :|last-access| 0 :|count| 0 :|special| "if test then [else]) => result*")
("ignorable" :|last-access| 0 :|count| 0 :|declaration| "ignorable")
("ignore" :|last-access| 0 :|count| 0 :|declaration| "ignore")
("ignore-errors" :|last-access| 0 :|count| 0 :|macro|
 "ignore-errors form*) => results*")
("imagpart" :|last-access| 0 :|count| 0 :|function|
 "imagpart number) => imagpart")
("import" :|last-access| 0 :|count| 0 :|function|
 "import symbols &optional package) => t")
("in-package" :|last-access| 0 :|count| 0 :|macro| "in-package name) => package")
("incf" :|last-access| 0 :|count| 0 :|macro| "incf place [delta]) => new-value")
("inline" :|last-access| 0 :|count| 0 :|declaration| "inline")
("input-stream-p" :|last-access| 0 :|count| 0 :|function|
 "input-stream-p stream) => generalized-boolean")
("inspect" :|last-access| 0 :|count| 0 :|function|
 "inspect object) => implementation-dependent")
("integer-decode-float" :|last-access| 0 :|count| 0 :|function|
 "integer-decode-float float) => significand, exponent, sign")
("integer-length" :|last-access| 0 :|count| 0 :|function|
 "integer-length integer) => number-of-bits")
("integerp" :|last-access| 0 :|count| 0 :|function|
 "integerp object) => generalized-boolean")
("interactive-stream-p" :|last-access| 0 :|count| 0 :|function|
 "interactive-stream-p stream) => generalized-boolean")
("intern" :|last-access| 0 :|count| 0 :|function|
 "intern string &optional package) => symbol, status")
("intersection" :|last-access| 0 :|count| 0 :|function|
 "intersection list-1 list-2 &key key test test-not) => result-list")
("invalid-method-error" :|last-access| 0 :|count| 0 :|function|
 "invalid-method-error method format-control &rest args) => |")
("isqrt" :|last-access| 0 :|count| 0 :|function| "isqrt natural) => natural")
("keywordp" :|last-access| 0 :|count| 0 :|function|
 "keywordp object) => generalized-boolean")
("labels" :|last-access| 0 :|count| 0 :|special|
 "labels ((fn lambda-list [[decl* | doc]] form*)*) form*) => res*")
("lambda" :|last-access| 0 :|count| 0 :|macro|
 "lambda lambda-list [[declaration* | doc]] form*")
("lambda-list-keywords" :|last-access| 0 :|count| 0 :|constant|
 "lambda-list-keywords")
("lambda-parameters-limit" :|last-access| 0 :|count| 0 :|constant|
 "lambda-parameters-limit")
("last" :|last-access| 0 :|count| 0 :|function| "last list &optional n) => tail")
("lcm" :|last-access| 0 :|count| 0 :|function|
 "lcm &rest integers) => least-common-multiple")
("ldb" :|last-access| 0 :|count| 0 :|function| "ldb bytespec integer) => byte")
("ldb-test" :|last-access| 0 :|count| 0 :|function|
 "ldb-test bytespec integer) => generalized-boolean")
("ldiff" :|last-access| 0 :|count| 0 :|function|
 "ldiff list object) => result-list")
("least-negative-double-float" :|last-access| 0 :|count| 0 :|constant|
 "least-negative-double-float")
("least-negative-long-float" :|last-access| 0 :|count| 0 :|constant|
 "least-negative-long-float")
("least-negative-normalized-double-float" :|last-access| 0 :|count| 0
 :|constant| "least-negative-normalized-double-float")
("least-negative-normalized-long-float" :|last-access| 0 :|count| 0 :|constant|
 "least-negative-normalized-long-float")
("least-negative-normalized-short-float" :|last-access| 0 :|count| 0
 :|constant| "least-negative-normalized-short-float")
("least-negative-normalized-single-float" :|last-access| 0 :|count| 0
 :|constant| "least-negative-normalized-single-float")
("least-negative-short-float" :|last-access| 0 :|count| 0 :|constant|
 "least-negative-short-float")
("least-negative-single-float" :|last-access| 0 :|count| 0 :|constant|
 "least-negative-single-float")
("least-positive-double-float" :|last-access| 0 :|count| 0 :|constant|
 "least-positive-double-float")
("least-positive-long-float" :|last-access| 0 :|count| 0 :|constant|
 "least-positive-long-float")
("least-positive-normalized-double-float" :|last-access| 0 :|count| 0
 :|constant| "least-positive-normalized-double-float")
("least-positive-normalized-long-float" :|last-access| 0 :|count| 0 :|constant|
 "least-positive-normalized-long-float")
("least-positive-normalized-short-float" :|last-access| 0 :|count| 0
 :|constant| "least-positive-normalized-short-float")
("least-positive-normalized-single-float" :|last-access| 0 :|count| 0
 :|constant| "least-positive-normalized-single-float")
("least-positive-short-float" :|last-access| 0 :|count| 0 :|constant|
 "least-positive-short-float")
("least-positive-single-float" :|last-access| 0 :|count| 0 :|constant|
 "least-positive-single-float")
("length" :|last-access| 0 :|count| 0 :|function| "length sequence) => n")
("let" :|last-access| 0 :|count| 0 :|special|
 "let ({var | (var [init])}*) decl* form*) => res*")
("let*" :|last-access| 0 :|count| 0 :|special|
 "let* ({var | (var [init])}*) decl* form*) => res*")
("lisp-implementation-type" :|last-access| 0 :|count| 0 :|function|
 "lisp-implementation-type) => type")
("lisp-implementation-version" :|last-access| 0 :|count| 0 :|function|
 "lisp-implementation-version) => version")
("list" :|last-access| 0 :|count| 0 :|function| "list &rest objects) => list")
("list*" :|last-access| 0 :|count| 0 :|function|
 "list* &rest objects+) => result")
("list-all-packages" :|last-access| 0 :|count| 0 :|function|
 "list-all-packages) => packages")
("list-length" :|last-access| 0 :|count| 0 :|function|
 "list-length list) => length")
("listen" :|last-access| 0 :|count| 0 :|function|
 "listen &optional stream) => generalized-boolean")
("listp" :|last-access| 0 :|count| 0 :|function|
 "listp object) => generalized-boolean")
("load" :|last-access| 0 :|count| 0 :|function|
 "load filespec &key verbose print if-does-not-exist external-format) => success")
("load-logical-pathname-translations" :|last-access| 0 :|count| 0 :|function|
 "load-logical-pathname-translations host) => defined")
("load-time-value" :|last-access| 0 :|count| 0 :|special|
 "load-time-value form &optional read-only-p) => object")
("locally" :|last-access| 0 :|count| 0 :|special|
 "locally declaration* form*) => result*")
("log" :|last-access| 0 :|count| 0 :|function|
 "log number &optional base) => result")
("logand" :|last-access| 0 :|count| 0 :|function|
 "logand &rest integers) => result-integer")
("logandc1" :|last-access| 0 :|count| 0 :|function|
 "logandc1 integer-1 integer-2) => result-integer")
("logandc2" :|last-access| 0 :|count| 0 :|function|
 "logandc2 integer-1 integer-2) => result-integer")
("logcount" :|last-access| 0 :|count| 0 :|function|
 "logcount integer) => number-of-on-bits")
("logeqv" :|last-access| 0 :|count| 0 :|function|
 "logeqv &rest integers) => result-integer")
("logical-pathname" :|last-access| 0 :|count| 0 :|function|
 "logical-pathname pathspec) => logical-pathname")
("logical-pathname-translations" :|last-access| 0 :|count| 0 :|function|
 "logical-pathname-translations host) => translations")
("logior" :|last-access| 0 :|count| 0 :|function|
 "logior &rest integers) => result-integer")
("lognand" :|last-access| 0 :|count| 0 :|function|
 "lognand integer-1 integer-2) => result-integer")
("lognor" :|last-access| 0 :|count| 0 :|function|
 "lognor integer-1 integer-2) => result-integer")
("lognot" :|last-access| 0 :|count| 0 :|function|
 "lognot integer) => result-integer")
("logorc1" :|last-access| 0 :|count| 0 :|function|
 "logorc1 integer-1 integer-2) => result-integer")
("logorc2" :|last-access| 0 :|count| 0 :|function|
 "logorc2 integer-1 integer-2) => result-integer")
("logtest" :|last-access| 0 :|count| 0 :|function|
 "logtest integer-1 integer-2) => generalized-boolean")
("logxor" :|last-access| 0 :|count| 0 :|function|
 "logxor &rest integers) => result-integer")
("long-float" :|last-access| 0 :|count| 0 :|type| "long-float")
("long-float-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "long-float-epsilon")
("long-float-negative-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "long-float-negative-epsilon")
("long-site-name" :|last-access| 0 :|count| 0 :|function|
 "long-site-name) => name")
("loop" :|last-access| 0 :|count| 0 :|macro| "loop {form}*) => result*")
("loop-finish" :|last-access| 0 :|count| 0 :|macro| "loop-finish) => |")
("lower-case-p" :|last-access| 0 :|count| 0 :|function|
 "lower-case-p character) => generalized-boolean")
("machine-instance" :|last-access| 0 :|count| 0 :|function|
 "machine-instance) => description")
("machine-type" :|last-access| 0 :|count| 0 :|function|
 "machine-type) => description")
("machine-version" :|last-access| 0 :|count| 0 :|function|
 "machine-version) => description")
("macro-function" :|last-access| 0 :|count| 0 :|function|
 "macro-function symbol &optional env) => function")
("macroexpand" :|last-access| 0 :|count| 0 :|function|
 "macroexpand form &optional env) => expansion, expanded-p")
("macroexpand-1" :|last-access| 0 :|count| 0 :|function|
 "macroexpand-1 form &optional env) => expansion, expanded-p")
("macrolet" :|last-access| 0 :|count| 0 :|special|
 "macrolet ((name lambda-list [[decl* | doc]] form*)*) form*) => res*")
("make-array" :|last-access| 0 :|count| 0 :|function|
 "make-array dims &key element-type initial-element initial-contents adjustable fill-pointer displaced-to displaced-index-offset) => array")
("make-broadcast-stream" :|last-access| 0 :|count| 0 :|function|
 "make-broadcast-stream &rest streams) => broadcast-stream")
("make-concatenated-stream" :|last-access| 0 :|count| 0 :|function|
 "make-concatenated-stream &rest streams) => concatenated-stream")
("make-condition" :|last-access| 0 :|count| 0 :|function|
 "make-condition type &rest slot-initializations) => condition")
("make-dispatch-macro-character" :|last-access| 0 :|count| 0 :|function|
 "make-dispatch-macro-character char &optional non-term-p table) => t")
("make-echo-stream" :|last-access| 0 :|count| 0 :|function|
 "make-echo-stream input-stream output-stream) => echo-stream")
("make-hash-table" :|last-access| 0 :|count| 0 :|function|
 "make-hash-table &key test size rehash-size rehash-threshold) => hash-table")
("make-instance" :|last-access| 0 :|count| 0 :|function|
 "make-instance class &rest initargs) => instance")
("make-instances-obsolete" :|last-access| 0 :|count| 0 :|function|
 "make-instances-obsolete class) => class")
("make-list" :|last-access| 0 :|count| 0 :|function|
 "make-list size &key initial-element) => list")
("make-load-form" :|last-access| 0 :|count| 0 :|function|
 "make-load-form object &optional env) => form")
("make-load-form-saving-slots" :|last-access| 0 :|count| 0 :|function|
 "make-load-form-saving-slots object &key slot-names env) => form")
("make-method" :|last-access| 0 :|count| 0 :|macro| "make-method form")
("make-package" :|last-access| 0 :|count| 0 :|function|
 "make-package name &key nicknames use) => package")
("make-pathname" :|last-access| 0 :|count| 0 :|function|
 "make-pathname &key host device directory name type version defaults case) => pathname")
("make-random-state" :|last-access| 0 :|count| 0 :|function|
 "make-random-state &optional state) => new-state")
("make-sequence" :|last-access| 0 :|count| 0 :|function|
 "make-sequence type size &key initial-element) => sequence")
("make-string" :|last-access| 0 :|count| 0 :|function|
 "make-string size &key initial-element element-type) => string")
("make-string-input-stream" :|last-access| 0 :|count| 0 :|function|
 "make-string-input-stream string &optional start end) => string-stream")
("make-string-output-stream" :|last-access| 0 :|count| 0 :|function|
 "make-string-output-stream &key element-type) => string-stream")
("make-symbol" :|last-access| 0 :|count| 0 :|function|
 "make-symbol name) => new-symbol")
("make-synonym-stream" :|last-access| 0 :|count| 0 :|function|
 "make-synonym-stream symbol) => synonym-stream")
("make-two-way-stream" :|last-access| 0 :|count| 0 :|function|
 "make-two-way-stream input output) => two-way-stream")
("makunbound" :|last-access| 0 :|count| 0 :|function|
 "makunbound symbol) => symbol")
("map" :|last-access| 0 :|count| 0 :|function|
 "map result-type function &rest sequences+) => result")
("map-into" :|last-access| 0 :|count| 0 :|function|
 "map-into result-seq function &rest sequences+) => result-seq")
("mapc" :|last-access| 0 :|count| 0 :|function|
 "mapc function &rest lists+) => list-1")
("mapcan" :|last-access| 0 :|count| 0 :|function|
 "mapcan function &rest lists+) => concatenated-results")
("mapcar" :|last-access| 0 :|count| 0 :|function|
 "mapcar function &rest lists+) => result-list")
("mapcon" :|last-access| 0 :|count| 0 :|function|
 "mapcon function &rest lists+) => concatenated-results")
("maphash" :|last-access| 0 :|count| 0 :|function|
 "maphash function hash-table) => nil")
("mapl" :|last-access| 0 :|count| 0 :|function|
 "mapl function &rest lists+) => list-1")
("maplist" :|last-access| 0 :|count| 0 :|function|
 "maplist function &rest lists+) => result-list")
("mask-field" :|last-access| 0 :|count| 0 :|function|
 "mask-field bytespec integer) => masked-integer")
("max" :|last-access| 0 :|count| 0 :|function|
 "max &rest numbers+) => max-number")
("member" :|last-access| 0 :|count| 0 :|function|
 "member item list &key key test test-not) => tail")
("member-if" :|last-access| 0 :|count| 0 :|function|
 "member-if predicate list &key key) => tail")
("member-if-not" :|last-access| 0 :|count| 0 :|function|
 "member-if-not predicate list &key key) => tail")
("merge" :|last-access| 0 :|count| 0 :|function|
 "merge result-type seq-1 seq-2 predicate &key key) => result-sequence")
("merge-pathnames" :|last-access| 0 :|count| 0 :|function|
 "merge-pathnames pathname &optional defaults version) => pathname")
("method-combination-error" :|last-access| 0 :|count| 0 :|function|
 "method-combination-error format-control &rest args) => |")
("method-qualifiers" :|last-access| 0 :|count| 0 :|function|
 "method-qualifiers method) => qualifiers")
("min" :|last-access| 0 :|count| 0 :|function|
 "min &rest numbers+) => min-number")
("minusp" :|last-access| 0 :|count| 0 :|function|
 "minusp real) => generalized-boolean")
("mismatch" :|last-access| 0 :|count| 0 :|function|
 "mismatch seq-1 seq-2 &key from-end test test-not key start1 end1 start2 end2) => position")
("mod" :|last-access| 0 :|count| 0 :|function|
 "mod number divisor) => remainder")
("most-negative-double-float" :|last-access| 0 :|count| 0 :|constant|
 "most-negative-double-float")
("most-negative-fixnum" :|last-access| 0 :|count| 0 :|constant|
 "most-negative-fixnum")
("most-negative-long-float" :|last-access| 0 :|count| 0 :|constant|
 "most-negative-long-float")
("most-negative-short-float" :|last-access| 0 :|count| 0 :|constant|
 "most-negative-short-float")
("most-negative-single-float" :|last-access| 0 :|count| 0 :|constant|
 "most-negative-single-float")
("most-positive-double-float" :|last-access| 0 :|count| 0 :|constant|
 "most-positive-double-float")
("most-positive-fixnum" :|last-access| 0 :|count| 0 :|constant|
 "most-positive-fixnum")
("most-positive-long-float" :|last-access| 0 :|count| 0 :|constant|
 "most-positive-long-float")
("most-positive-short-float" :|last-access| 0 :|count| 0 :|constant|
 "most-positive-short-float")
("most-positive-single-float" :|last-access| 0 :|count| 0 :|constant|
 "most-positive-single-float")
("muffle-warning" :|last-access| 0 :|count| 0 :|function|
 "muffle-warning &optional condition) => |")
("multiple-value-bind" :|last-access| 0 :|count| 0 :|macro|
 "multiple-value-bind (vars*) values-form decl* form*) => res*")
("multiple-value-call" :|last-access| 0 :|count| 0 :|special|
 "multiple-value-call function form*) => result*")
("multiple-value-list" :|last-access| 0 :|count| 0 :|macro|
 "multiple-value-list form) => list")
("multiple-value-prog1" :|last-access| 0 :|count| 0 :|special|
 "multiple-value-prog1 first-form form*) => first-result")
("multiple-value-setq" :|last-access| 0 :|count| 0 :|macro|
 "multiple-value-setq (vars*) form) => result")
("multiple-values-limit" :|last-access| 0 :|count| 0 :|constant|
 "multiple-values-limit")
("name-char" :|last-access| 0 :|count| 0 :|function|
 "name-char name) => character")
("namestring" :|last-access| 0 :|count| 0 :|function|
 "namestring pathspec) => namestring")
("nbutlast" :|last-access| 0 :|count| 0 :|function|
 "nbutlast list &optional n) => result-list")
("nconc" :|last-access| 0 :|count| 0 :|function|
 "nconc &rest lists) => result-list")
("next-method-p" :|last-access| 0 :|count| 0 :|function|
 "next-method-p) => generalized-boolean")
("nil" :|last-access| 0 :|count| 0 :|constant| "nil")
("nintersection" :|last-access| 0 :|count| 0 :|function|
 "nintersection list-1 list-2 &key key test test-not) => result-list")
("ninth" :|last-access| 0 :|count| 0 :|function| "ninth list) => object")
("no-applicable-method" :|last-access| 0 :|count| 0 :|function|
 "no-applicable-method gf &rest args) => result*")
("no-next-method" :|last-access| 0 :|count| 0 :|function|
 "no-next-method gf method &rest args) => result*")
("not" :|last-access| 0 :|count| 0 :|function|
 "not object) => generalized-boolean")
("notany" :|last-access| 0 :|count| 0 :|function|
 "notany predicate &rest sequences+) => generalized-boolean")
("notevery" :|last-access| 0 :|count| 0 :|function|
 "notevery predicate &rest sequences+) => generalized-boolean")
("notinline" :|last-access| 0 :|count| 0 :|declaration| "notinline")
("nreconc" :|last-access| 0 :|count| 0 :|function|
 "nreconc list tail) => result-list")
("nreverse" :|last-access| 0 :|count| 0 :|function|
 "nreverse sequence) => reversed-sequence")
("nset-difference" :|last-access| 0 :|count| 0 :|function|
 "nset-difference list-1 list-2 &key key test test-not) => result-list")
("nset-exclusive-or" :|last-access| 0 :|count| 0 :|function|
 "nset-exclusive-or list-1 list-2 &key key test test-not) => result-list")
("nstring-capitalize" :|last-access| 0 :|count| 0 :|function|
 "nstring-capitalize string &key start end) => string")
("nstring-downcase" :|last-access| 0 :|count| 0 :|function|
 "nstring-downcase string &key start end) => string")
("nstring-upcase" :|last-access| 0 :|count| 0 :|function|
 "nstring-upcase string &key start end) => string")
("nsublis" :|last-access| 0 :|count| 0 :|function|
 "nsublis alist tree &key key test test-not) => new-tree")
("nsubst" :|last-access| 0 :|count| 0 :|function|
 "nsubst new old tree &key key test test-not) => new-tree")
("nsubst-if" :|last-access| 0 :|count| 0 :|function|
 "nsubst-if new predicate tree &key key) => new-tree")
("nsubst-if-not" :|last-access| 0 :|count| 0 :|function|
 "nsubst-if-not new predicate tree &key key) => new-tree")
("nsubstitute" :|last-access| 0 :|count| 0 :|function|
 "nsubstitute newitem seq &key from-end test test-not start end count key) => seq")
("nsubstitute-if" :|last-access| 0 :|count| 0 :|function|
 "nsubstitute-if newitem pred seq &key from-end start end count key) => seq")
("nsubstitute-if-not" :|last-access| 0 :|count| 0 :|function|
 "nsubstitute-if-not newitem pred seq &key from-end start end count key) => seq")
("nth" :|last-access| 0 :|count| 0 :|function| "nth n list) => object")
("nth-value" :|last-access| 0 :|count| 0 :|macro| "nth-value n form) => object")
("nthcdr" :|last-access| 0 :|count| 0 :|function| "nthcdr n list) => tail")
("null" :|last-access| 0 :|count| 0 :|function|
 "null object) => generalized-boolean")
("numberp" :|last-access| 0 :|count| 0 :|function|
 "numberp object) => generalized-boolean")
("numerator" :|last-access| 0 :|count| 0 :|function|
 "numerator rational) => numerator")
("nunion" :|last-access| 0 :|count| 0 :|function|
 "nunion list-1 list-2 &key key test test-not) => result-list")
("oddp" :|last-access| 0 :|count| 0 :|function|
 "oddp integer) => generalized-boolean")
("open" :|last-access| 0 :|count| 0 :|function|
 "open filespec &key direction element-type if-exists if-does-not-exist external-format) => stream")
("open-stream-p" :|last-access| 0 :|count| 0 :|function|
 "open-stream-p stream) => generalized-boolean")
("optimize" :|last-access| 0 :|count| 0 :|declaration| "optimize")
("or" :|last-access| 0 :|count| 0 :|macro| "or form*) => result*")
("otherwise" :|last-access| 0 :|count| 0 :|macro| "Clause: otherwise")
("output-stream-p" :|last-access| 0 :|count| 0 :|function|
 "output-stream-p stream) => generalized-boolean")
("package-error-package" :|last-access| 0 :|count| 0 :|function|
 "package-error-package condition) => package")
("package-name" :|last-access| 0 :|count| 0 :|function|
 "package-name package) => name")
("package-nicknames" :|last-access| 0 :|count| 0 :|function|
 "package-nicknames package) => nicknames")
("package-shadowing-symbols" :|last-access| 0 :|count| 0 :|function|
 "package-shadowing-symbols package) => symbols")
("package-use-list" :|last-access| 0 :|count| 0 :|function|
 "package-use-list package) => packages")
("package-used-by-list" :|last-access| 0 :|count| 0 :|function|
 "package-used-by-list package) => packages")
("packagep" :|last-access| 0 :|count| 0 :|function|
 "packagep object) => generalized-boolean")
("pairlis" :|last-access| 0 :|count| 0 :|function|
 "pairlis keys data &optional alist) => new-alist")
("parse-integer" :|last-access| 0 :|count| 0 :|function|
 "parse-integer string &key start end radix junk-allowed) => integer, pos")
("parse-namestring" :|last-access| 0 :|count| 0 :|function|
 "parse-namestring thing &optional host default &key start end junk-allowed) => pathname, pos")
("pathname" :|last-access| 0 :|count| 0 :|function|
 "pathname pathspec) => pathname")
("pathname-device" :|last-access| 0 :|count| 0 :|function|
 "pathname-device pathspec &key case) => device")
("pathname-directory" :|last-access| 0 :|count| 0 :|function|
 "pathname-directory pathspec &key case) => directory")
("pathname-host" :|last-access| 0 :|count| 0 :|function|
 "pathname-host pathspec &key case) => host")
("pathname-match-p" :|last-access| 0 :|count| 0 :|function|
 "pathname-match-p path wildcard) => generalized-boolean")
("pathname-name" :|last-access| 0 :|count| 0 :|function|
 "pathname-name pathspec &key case) => name")
("pathname-type" :|last-access| 0 :|count| 0 :|function|
 "pathname-type pathspec &key case) => type")
("pathname-version" :|last-access| 0 :|count| 0 :|function|
 "pathname-version pathspec) => version")
("pathnamep" :|last-access| 0 :|count| 0 :|function|
 "pathnamep object) => generalized-boolean")
("peek-char" :|last-access| 0 :|count| 0 :|function|
 "peek-char &optional type stream eof-error-p eof-value recursive-p) => char")
("phase" :|last-access| 0 :|count| 0 :|function| "phase number) => radians")
("pi" :|last-access| 0 :|count| 0 :|constant| "pi")
("plusp" :|last-access| 0 :|count| 0 :|function|
 "plusp real) => generalized-boolean")
("pop" :|last-access| 0 :|count| 0 :|macro| "pop place) => element")
("position" :|last-access| 0 :|count| 0 :|function|
 "position item sequence &key from-end test test-not start end key) => position")
("position-if" :|last-access| 0 :|count| 0 :|function|
 "position-if predicate sequence &key from-end start end key) => position")
("position-if-not" :|last-access| 0 :|count| 0 :|function|
 "position-if-not predicate sequence &key from-end start end key) => position")
("pprint" :|last-access| 0 :|count| 0 :|function|
 "pprint object &optional stream) => <no values>")
("pprint-dispatch" :|last-access| 0 :|count| 0 :|function|
 "pprint-dispatch object &optional table) => function, found-p")
("pprint-exit-if-list-exhausted" :|last-access| 0 :|count| 0 :|macro|
 "pprint-exit-if-list-exhausted) => nil")
("pprint-fill" :|last-access| 0 :|count| 0 :|function|
 "pprint-fill stream object &optional stop-p) => nil")
("pprint-indent" :|last-access| 0 :|count| 0 :|function|
 "pprint-indent relative-to n &optional stream) => nil")
("pprint-linear" :|last-access| 0 :|count| 0 :|function|
 "pprint-linear stream object &optional stop-p) => nil")
("pprint-logical-block" :|last-access| 0 :|count| 0 :|macro|
 "pprint-logical-block (stream list &key prefix per-line-prefix suffix) form*) => nil")
("pprint-newline" :|last-access| 0 :|count| 0 :|function|
 "pprint-newline kind &optional stream) => nil")
("pprint-pop" :|last-access| 0 :|count| 0 :|macro| "pprint-pop) => object")
("pprint-tab" :|last-access| 0 :|count| 0 :|function|
 "pprint-tab kind colnum colinc &optional stream) => nil")
("pprint-tabular" :|last-access| 0 :|count| 0 :|function|
 "pprint-tabular stream object &optional stop-p colinc) => nil")
("prin1" :|last-access| 0 :|count| 0 :|function|
 "prin1 object &optional stream) => object")
("prin1-to-string" :|last-access| 0 :|count| 0 :|function|
 "prin1-to-string object) => string")
("princ" :|last-access| 0 :|count| 0 :|function|
 "princ object &optional stream) => object")
("princ-to-string" :|last-access| 0 :|count| 0 :|function|
 "princ-to-string object) => string")
("print" :|last-access| 0 :|count| 0 :|function|
 "print object &optional stream) => object")
("print-not-readable-object" :|last-access| 0 :|count| 0 :|function|
 "print-not-readable-object condition) => object")
("print-object" :|last-access| 0 :|count| 0 :|function|
 "print-object object stream) => object")
("print-unreadable-object" :|last-access| 0 :|count| 0 :|macro|
 "print-unreadable-object (object stream &key type identity) form*) => nil")
("probe-file" :|last-access| 0 :|count| 0 :|function|
 "probe-file pathspec) => truename")
("proclaim" :|last-access| 0 :|count| 0 :|function|
 "proclaim declaration-spec) => implementation-dependent")
("prog" :|last-access| 0 :|count| 0 :|macro|
 "prog ({var | (var [init])}*) decl* {tag | statement}*) => res*")
("prog*" :|last-access| 0 :|count| 0 :|macro|
 "prog* ({var | (var [init])}*) decl* {tag | statement}*) => res*")
("prog1" :|last-access| 0 :|count| 0 :|macro|
 "prog1 first-form form*) => first-result")
("prog2" :|last-access| 0 :|count| 0 :|macro|
 "prog2 first-form second-form form*) => second-result")
("progn" :|last-access| 0 :|count| 0 :|special| "progn form*) => result*")
("progv" :|last-access| 0 :|count| 0 :|special|
 "progv symbols values form*) => result*")
("provide" :|last-access| 0 :|count| 0 :|function|
 "provide module-name) => implementation-dependent")
("psetf" :|last-access| 0 :|count| 0 :|macro| "psetf {place newvalue}*) => nil")
("psetq" :|last-access| 0 :|count| 0 :|macro| "psetq {var value}*) => nil")
("push" :|last-access| 3979957485 :|count| 1 :|macro|
 "push item place) => new-place-value")
("pushnew" :|last-access| 0 :|count| 0 :|macro|
 "pushnew item place &key key test test-not) => new-place-value")
("quote" :|last-access| 0 :|count| 0 :|special| "quote object) => object")
("random" :|last-access| 0 :|count| 0 :|function|
 "random limit &optional state) => random-number")
("random-state-p" :|last-access| 0 :|count| 0 :|function|
 "random-state-p object) => generalized-boolean")
("rassoc" :|last-access| 0 :|count| 0 :|function|
 "rassoc item alist &key key test test-not) => entry")
("rassoc-if" :|last-access| 0 :|count| 0 :|function|
 "rassoc-if predicate alist &key key) => entry")
("rassoc-if-not" :|last-access| 0 :|count| 0 :|function|
 "rassoc-if-not predicate alist &key key) => entry")
("rational" :|last-access| 0 :|count| 0 :|function|
 "rational number) => rational")
("rationalize" :|last-access| 0 :|count| 0 :|function|
 "rationalize number) => rational")
("rationalp" :|last-access| 0 :|count| 0 :|function|
 "rationalp object) => generalized-boolean")
("read" :|last-access| 0 :|count| 0 :|function|
 "read &optional stream eof-err eof-val recursive) => object")
("read-byte" :|last-access| 0 :|count| 0 :|function|
 "read-byte stream &optional eof-err eof-val) => byte")
("read-char" :|last-access| 0 :|count| 0 :|function|
 "read-char &optional stream eof-err eof-val recursive) => char")
("read-char-no-hang" :|last-access| 0 :|count| 0 :|function|
 "read-char-no-hang &optional stream eof-err eof-val recursive) => char")
("read-delimited-list" :|last-access| 0 :|count| 0 :|function|
 "read-delimited-list char &optional stream recursive) => list")
("read-from-string" :|last-access| 0 :|count| 0 :|function|
 "read-from-string string &optional eof-err eof-val &key start end recursive) => object, pos")
("read-line" :|last-access| 0 :|count| 0 :|function|
 "read-line &optional stream eof-err eof-val recursive) => string, missing-newline-p")
("read-preserving-whitespace" :|last-access| 0 :|count| 0 :|function|
 "read-preserving-whitespace &optional stream eof-err eof-val recursive) => object")
("read-sequence" :|last-access| 0 :|count| 0 :|function|
 "read-sequence seq stream &key start end) => pos")
("readtable-case" :|last-access| 0 :|count| 0 :|function|
 "readtable-case readtable) => mode")
("readtablep" :|last-access| 0 :|count| 0 :|function|
 "readtablep object) => generalized-boolean")
("realpart" :|last-access| 0 :|count| 0 :|function|
 "realpart number) => realpart")
("realp" :|last-access| 0 :|count| 0 :|function|
 "realp object) => generalized-boolean")
("rem" :|last-access| 0 :|count| 0 :|function|
 "rem number divisor) => remainder")
("remf" :|last-access| 0 :|count| 0 :|macro|
 "remf place indicator) => generalized-boolean")
("remhash" :|last-access| 0 :|count| 0 :|function|
 "remhash key hash-table) => generalized-boolean")
("remove" :|last-access| 0 :|count| 0 :|function|
 "remove item seq &key from-end test test-not start end count key) => seq")
("remove-duplicates" :|last-access| 0 :|count| 0 :|function|
 "remove-duplicates seq &key from-end test test-not start end key) => seq")
("remove-if" :|last-access| 0 :|count| 0 :|function|
 "remove-if predicate seq &key from-end start end key) => seq")
("remove-if-not" :|last-access| 0 :|count| 0 :|function|
 "remove-if-not predicate seq &key from-end start end key) => seq")
("remove-method" :|last-access| 0 :|count| 0 :|function|
 "remove-method gf method) => gf")
("remprop" :|last-access| 0 :|count| 0 :|function|
 "remprop symbol indicator) => generalized-boolean")
("rename-file" :|last-access| 0 :|count| 0 :|function|
 "rename-file filespec new-name) => default, old, new")
("rename-package" :|last-access| 0 :|count| 0 :|function|
 "rename-package package new-name &optional nicknames) => package")
("replace" :|last-access| 0 :|count| 0 :|function|
 "replace seq1 seq2 &key start1 end1 start2 end2) => seq1")
("require" :|last-access| 0 :|count| 0 :|function|
 "require module &optional pathname) => implementation-dependent")
("rest" :|last-access| 0 :|count| 0 :|function| "rest list) => tail")
("restart-bind" :|last-access| 0 :|count| 0 :|macro|
 "restart-bind ((name function . keys)*) form*) => result*")
("restart-case" :|last-access| 0 :|count| 0 :|macro|
 "restart-case form {clause}*) => result*")
("restart-name" :|last-access| 0 :|count| 0 :|function|
 "restart-name restart) => name")
("return" :|last-access| 0 :|count| 0 :|macro| "return [result]) => |")
("return-from" :|last-access| 0 :|count| 0 :|special|
 "return-from name [result]) => |")
("revappend" :|last-access| 0 :|count| 0 :|function|
 "revappend list tail) => result-list")
("reverse" :|last-access| 0 :|count| 0 :|function|
 "reverse sequence) => reversed-sequence")
("room" :|last-access| 0 :|count| 0 :|function|
 "room &optional x) => implementation-dependent")
("rotatef" :|last-access| 0 :|count| 0 :|macro| "rotatef {place}*) => nil")
("round" :|last-access| 0 :|count| 0 :|function|
 "round number &optional divisor) => quotient, remainder")
("row-major-aref" :|last-access| 0 :|count| 0 :|function|
 "row-major-aref array index) => element")
("rplaca" :|last-access| 0 :|count| 0 :|function| "rplaca cons object) => cons")
("rplacd" :|last-access| 0 :|count| 0 :|function| "rplacd cons object) => cons")
("safety" :|last-access| 0 :|count| 0 :|declaration| "safety")
("satisfies" :|last-access| 0 :|count| 0 :|type| "Type Selector: satisfies")
("sbit" :|last-access| 0 :|count| 0 :|function|
 "sbit simple-bit-array &rest subscripts) => bit")
("scale-float" :|last-access| 0 :|count| 0 :|function|
 "scale-float float integer) => result")
("schar" :|last-access| 0 :|count| 0 :|function|
 "schar simple-string index) => character")
("search" :|last-access| 0 :|count| 0 :|function|
 "search seq1 seq2 &key from-end test test-not key start1 end1 start2 end2) => position")
("second" :|last-access| 0 :|count| 0 :|function| "second list) => object")
("section" :|last-access| 0 :|count| 0 :|document| "Document Section")
("set" :|last-access| 0 :|count| 0 :|function| "set symbol value) => value")
("set-difference" :|last-access| 0 :|count| 0 :|function|
 "set-difference list1 list2 &key key test test-not) => result-list")
("set-dispatch-macro-character" :|last-access| 0 :|count| 0 :|function|
 "set-dispatch-macro-character char subchar fn &optional table) => t")
("set-exclusive-or" :|last-access| 0 :|count| 0 :|function|
 "set-exclusive-or list1 list2 &key key test test-not) => result-list")
("set-macro-character" :|last-access| 0 :|count| 0 :|function|
 "set-macro-character char fn &optional non-term-p table) => t")
("set-pprint-dispatch" :|last-access| 0 :|count| 0 :|function|
 "set-pprint-dispatch typespec fn &optional priority table) => nil")
("set-syntax-from-char" :|last-access| 0 :|count| 0 :|function|
 "set-syntax-from-char to-char from-char &optional to-rt from-rt) => t")
("setf" :|last-access| 0 :|count| 0 :|macro|
 "setf {place newvalue}*) => result*")
("setq" :|last-access| 0 :|count| 0 :|special| "setq {var value}*) => result")
("seventh" :|last-access| 0 :|count| 0 :|function| "seventh list) => object")
("shadow" :|last-access| 0 :|count| 0 :|function|
 "shadow symbol-names &optional package) => t")
("shadowing-import" :|last-access| 0 :|count| 0 :|function|
 "shadowing-import symbols &optional package) => t")
("shared-initialize" :|last-access| 0 :|count| 0 :|function|
 "shared-initialize instance slot-names &rest initargs) => instance")
("shiftf" :|last-access| 0 :|count| 0 :|macro|
 "shiftf {place}+ newvalue) => old-value-1")
("short-float" :|last-access| 0 :|count| 0 :|type| "short-float")
("short-float-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "short-float-epsilon")
("short-float-negative-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "short-float-negative-epsilon")
("short-site-name" :|last-access| 0 :|count| 0 :|function|
 "short-site-name) => name")
("signal" :|last-access| 0 :|count| 0 :|function|
 "signal datum &rest arguments) => nil")
("signed-byte" :|last-access| 0 :|count| 0 :|type| "signed-byte")
("signum" :|last-access| 0 :|count| 0 :|function| "signum number) => result")
("simple-array" :|last-access| 0 :|count| 0 :|type| "simple-array")
("simple-base-string" :|last-access| 0 :|count| 0 :|type| "simple-base-string")
("simple-bit-vector" :|last-access| 0 :|count| 0 :|type| "simple-bit-vector")
("simple-bit-vector-p" :|last-access| 0 :|count| 0 :|function|
 "simple-bit-vector-p object) => generalized-boolean")
("simple-condition" :|last-access| 0 :|count| 0 :|class| "simple-condition")
("simple-condition-format-arguments" :|last-access| 0 :|count| 0 :|function|
 "simple-condition-format-arguments condition) => list")
("simple-condition-format-control" :|last-access| 0 :|count| 0 :|function|
 "simple-condition-format-control condition) => format-control")
("simple-error" :|last-access| 0 :|count| 0 :|class| "simple-error")
("simple-string" :|last-access| 0 :|count| 0 :|type| "simple-string")
("simple-string-p" :|last-access| 0 :|count| 0 :|function|
 "simple-string-p object) => generalized-boolean")
("simple-type-error" :|last-access| 0 :|count| 0 :|class| "simple-type-error")
("simple-vector" :|last-access| 0 :|count| 0 :|type| "simple-vector")
("simple-vector-p" :|last-access| 0 :|count| 0 :|function|
 "simple-vector-p object) => generalized-boolean")
("simple-warning" :|last-access| 0 :|count| 0 :|class| "simple-warning")
("sin" :|last-access| 0 :|count| 0 :|function| "sin radians) => number")
("single-float" :|last-access| 0 :|count| 0 :|type| "single-float")
("single-float-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "single-float-epsilon")
("single-float-negative-epsilon" :|last-access| 0 :|count| 0 :|constant|
 "single-float-negative-epsilon")
("sinh" :|last-access| 0 :|count| 0 :|function| "sinh number) => res")
("sixth" :|last-access| 0 :|count| 0 :|function| "sixth list) => object")
("sleep" :|last-access| 0 :|count| 0 :|function| "sleep seconds) => nil")
("slot-boundp" :|last-access| 0 :|count| 0 :|function|
 "slot-boundp instance slot-name) => generalized-boolean")
("slot-exists-p" :|last-access| 0 :|count| 0 :|function|
 "slot-exists-p object slot-name) => generalized-boolean")
("slot-makunbound" :|last-access| 0 :|count| 0 :|function|
 "slot-makunbound instance slot-name) => instance")
("slot-missing" :|last-access| 0 :|count| 0 :|function|
 "slot-missing class instance slot-name operation &optional new-value) => result*")
("slot-unbound" :|last-access| 0 :|count| 0 :|function|
 "slot-unbound class instance slot-name) => result*")
("slot-value" :|last-access| 0 :|count| 0 :|function|
 "slot-value object slot-name) => value")
("software-type" :|last-access| 0 :|count| 0 :|function|
 "software-type) => type")
("software-version" :|last-access| 0 :|count| 0 :|function|
 "software-version) => version")
("some" :|last-access| 0 :|count| 0 :|function|
 "some predicate &rest sequences+) => result")
("sort" :|last-access| 0 :|count| 0 :|function|
 "sort sequence predicate &key key) => sorted-sequence")
("space" :|last-access| 0 :|count| 0 :|declaration| "space")
("special" :|last-access| 0 :|count| 0 :|declaration| "special")
("special-operator-p" :|last-access| 0 :|count| 0 :|function|
 "special-operator-p symbol) => generalized-boolean")
("speed" :|last-access| 0 :|count| 0 :|declaration| "speed")
("sqrt" :|last-access| 0 :|count| 0 :|function| "sqrt number) => result")
("stable-sort" :|last-access| 0 :|count| 0 :|function|
 "stable-sort sequence predicate &key key) => sorted-sequence")
("standard-char" :|last-access| 0 :|count| 0 :|type| "standard-char")
("standard-char-p" :|last-access| 0 :|count| 0 :|function|
 "standard-char-p character) => generalized-boolean")
("standard-class" :|last-access| 0 :|count| 0 :|class| "standard-class")
("standard-generic-function" :|last-access| 0 :|count| 0 :|class|
 "standard-generic-function")
("standard-method" :|last-access| 0 :|count| 0 :|class| "standard-method")
("standard-object" :|last-access| 0 :|count| 0 :|class| "standard-object")
("step" :|last-access| 0 :|count| 0 :|macro| "step form) => result*")
("store-value" :|last-access| 0 :|count| 0 :|function|
 "store-value value &optional condition) => nil")
("stream" :|last-access| 0 :|count| 0 :|class| "stream")
("stream-element-type" :|last-access| 0 :|count| 0 :|function|
 "stream-element-type stream) => typespec")
("stream-error" :|last-access| 0 :|count| 0 :|class| "stream-error")
("stream-error-stream" :|last-access| 0 :|count| 0 :|function|
 "stream-error-stream condition) => stream")
("stream-external-format" :|last-access| 0 :|count| 0 :|function|
 "stream-external-format stream) => format")
("streamp" :|last-access| 0 :|count| 0 :|function|
 "streamp object) => generalized-boolean")
("string" :|last-access| 0 :|count| 0 :|function| "string x) => string")
("string-capitalize" :|last-access| 0 :|count| 0 :|function|
 "string-capitalize string &key start end) => string")
("string-downcase" :|last-access| 0 :|count| 0 :|function|
 "string-downcase string &key start end) => string")
("string-equal" :|last-access| 0 :|count| 0 :|function|
 "string-equal string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-greaterp" :|last-access| 0 :|count| 0 :|function|
 "string-greaterp string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-left-trim" :|last-access| 0 :|count| 0 :|function|
 "string-left-trim character-bag string) => trimmed-string")
("string-lessp" :|last-access| 0 :|count| 0 :|function|
 "string-lessp string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-not-equal" :|last-access| 0 :|count| 0 :|function|
 "string-not-equal string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-not-greaterp" :|last-access| 0 :|count| 0 :|function|
 "string-not-greaterp string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-not-lessp" :|last-access| 0 :|count| 0 :|function|
 "string-not-lessp string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string-right-trim" :|last-access| 0 :|count| 0 :|function|
 "string-right-trim character-bag string) => trimmed-string")
("string-trim" :|last-access| 0 :|count| 0 :|function|
 "string-trim character-bag string) => trimmed-string")
("string-upcase" :|last-access| 0 :|count| 0 :|function|
 "string-upcase string &key start end) => string")
("string/=" :|last-access| 0 :|count| 0 :|function|
 "string/= string1 string2 &key start1 end1 start2 end2) => mismatch-index")
("string<" :|last-access| 0 :|count| 0 :|function|
 "string< string1 string2 &key start1 end1 start2 end2) => mismatch-index")
("string<=" :|last-access| 0 :|count| 0 :|function|
 "string<= string1 string2 &key start1 end1 start2 end2) => mismatch-index")
("string=" :|last-access| 0 :|count| 0 :|function|
 "string= string1 string2 &key start1 end1 start2 end2) => generalized-boolean")
("string>" :|last-access| 0 :|count| 0 :|function|
 "string> string1 string2 &key start1 end1 start2 end2) => mismatch-index")
("string>=" :|last-access| 0 :|count| 0 :|function|
 "string>= string1 string2 &key start1 end1 start2 end2) => mismatch-index")
("stringp" :|last-access| 0 :|count| 0 :|function|
 "stringp object) => generalized-boolean")
("structure-class" :|last-access| 0 :|count| 0 :|class| "structure-class")
("structure-object" :|last-access| 0 :|count| 0 :|class| "structure-object")
("sublis" :|last-access| 0 :|count| 0 :|function|
 "sublis alist tree &key key test test-not) => new-tree")
("subseq" :|last-access| 0 :|count| 0 :|function|
 "subseq sequence start &optional end) => subsequence")
("subsetp" :|last-access| 0 :|count| 0 :|function|
 "subsetp list1 list2 &key key test test-not) => generalized-boolean")
("subst" :|last-access| 0 :|count| 0 :|function|
 "subst new old tree &key key test test-not) => new-tree")
("subst-if" :|last-access| 0 :|count| 0 :|function|
 "subst-if new predicate tree &key key) => new-tree")
("subst-if-not" :|last-access| 0 :|count| 0 :|function|
 "subst-if-not new predicate tree &key key) => new-tree")
("substitute" :|last-access| 0 :|count| 0 :|function|
 "substitute newitem seq &key from-end test test-not start end count key) => seq")
("substitute-if" :|last-access| 0 :|count| 0 :|function|
 "substitute-if newitem pred seq &key from-end start end count key) => seq")
("substitute-if-not" :|last-access| 0 :|count| 0 :|function|
 "substitute-if-not newitem pred seq &key from-end start end count key) => seq")
("subtypep" :|last-access| 0 :|count| 0 :|function|
 "subtypep type-1 type-2 &optional env) => generalized-boolean, success-p")
("svref" :|last-access| 0 :|count| 0 :|function|
 "svref vector index) => element")
("sxhash" :|last-access| 0 :|count| 0 :|function| "sxhash object) => hash-code")
("symbol-function" :|last-access| 0 :|count| 0 :|function|
 "symbol-function symbol) => function")
("symbol-macrolet" :|last-access| 0 :|count| 0 :|special|
 "symbol-macrolet ((symbol expansion)*) form*) => result*")
("symbol-name" :|last-access| 0 :|count| 0 :|function|
 "symbol-name symbol) => name")
("symbol-package" :|last-access| 0 :|count| 0 :|function|
 "symbol-package symbol) => package")
("symbol-plist" :|last-access| 0 :|count| 0 :|function|
 "symbol-plist symbol) => plist")
("symbol-value" :|last-access| 0 :|count| 0 :|function|
 "symbol-value symbol) => value")
("symbolp" :|last-access| 0 :|count| 0 :|function|
 "symbolp object) => generalized-boolean")
("synonym-stream-symbol" :|last-access| 0 :|count| 0 :|function|
 "synonym-stream-symbol stream) => symbol")
("t" :|last-access| 0 :|count| 0 :|constant| "t")
("tagbody" :|last-access| 0 :|count| 0 :|special|
 "tagbody {tag | statement}*) => nil")
("tailp" :|last-access| 0 :|count| 0 :|function|
 "tailp object list) => generalized-boolean")
("tan" :|last-access| 0 :|count| 0 :|function| "tan radians) => number")
("tanh" :|last-access| 0 :|count| 0 :|function| "tanh number) => res")
("tenth" :|last-access| 0 :|count| 0 :|function| "tenth list) => object")
("terpri" :|last-access| 0 :|count| 0 :|function|
 "terpri &optional stream) => nil")
("the" :|last-access| 0 :|count| 0 :|special| "the value-type form) => result*")
("third" :|last-access| 0 :|count| 0 :|function| "third list) => object")
("throw" :|last-access| 0 :|count| 0 :|special|
 "throw tag-form result-form) => |")
("time" :|last-access| 3978496554 :|count| 2 :|macro| "time form) => result*")
("trace" :|last-access| 0 :|count| 0 :|macro|
 "trace function-name*) => list-of-tracees")
("translate-logical-pathname" :|last-access| 0 :|count| 0 :|function|
 "translate-logical-pathname pathname &key) => pathname")
("translate-pathname" :|last-access| 0 :|count| 0 :|function|
 "translate-pathname source from to &key) => pathname")
("tree-equal" :|last-access| 0 :|count| 0 :|function|
 "tree-equal tree1 tree2 &key test test-not) => generalized-boolean")
("truename" :|last-access| 0 :|count| 0 :|function|
 "truename pathspec) => truename")
("truncate" :|last-access| 0 :|count| 0 :|function|
 "truncate number &optional divisor) => quotient, remainder")
("two-way-stream-input-stream" :|last-access| 0 :|count| 0 :|function|
 "two-way-stream-input-stream stream) => input-stream")
("two-way-stream-output-stream" :|last-access| 0 :|count| 0 :|function|
 "two-way-stream-output-stream stream) => output-stream")
("type" :|last-access| 0 :|count| 0 :|declaration| "type")
("type-error-datum" :|last-access| 0 :|count| 0 :|function|
 "type-error-datum condition) => datum")
("type-error-expected-type" :|last-access| 0 :|count| 0 :|function|
 "type-error-expected-type condition) => expected-type")
("type-of" :|last-access| 0 :|count| 0 :|function| "type-of object) => typespec")
("typecase" :|last-access| 0 :|count| 0 :|macro|
 "typecase keyform {({type | otherwise} form*)}*) => result*")
("typep" :|last-access| 0 :|count| 0 :|function|
 "typep object typespec &optional env) => generalized-boolean")
("unbound-slot-instance" :|last-access| 0 :|count| 0 :|function|
 "unbound-slot-instance condition) => instance")
("unbound-variable" :|last-access| 0 :|count| 0 :|class| "unbound-variable")
("unexport" :|last-access| 0 :|count| 0 :|function|
 "unexport symbols &optional package) => t")
("unintern" :|last-access| 0 :|count| 0 :|function|
 "unintern symbol &optional package) => generalized-boolean")
("union" :|last-access| 0 :|count| 0 :|function|
 "union list1 list2 &key key test test-not) => result-list")
("unless" :|last-access| 0 :|count| 0 :|macro|
 "unless test-form form*) => result*")
("unread-char" :|last-access| 0 :|count| 0 :|function|
 "unread-char character &optional stream) => nil")
("unsigned-byte" :|last-access| 0 :|count| 0 :|type| "unsigned-byte")
("untrace" :|last-access| 0 :|count| 0 :|macro|
 "untrace function-name*) => list-of-untracees")
("unwind-protect" :|last-access| 0 :|count| 0 :|special|
 "unwind-protect protected-form cleanup-form*) => result*")
("update-instance-for-different-class" :|last-access| 0 :|count| 0 :|function|
 "update-instance-for-different-class old new &rest initargs) => result*")
("update-instance-for-redefined-class" :|last-access| 0 :|count| 0 :|function|
 "update-instance-for-redefined-class instance added discarded plist &rest initargs) => result*")
("upgraded-array-element-type" :|last-access| 0 :|count| 0 :|function|
 "upgraded-array-element-type typespec &optional env) => type")
("upgraded-complex-part-type" :|last-access| 0 :|count| 0 :|function|
 "upgraded-complex-part-type typespec &optional env) => type")
("upper-case-p" :|last-access| 0 :|count| 0 :|function|
 "upper-case-p character) => generalized-boolean")
("use-package" :|last-access| 0 :|count| 0 :|function|
 "use-package packages-to-use &optional package) => t")
("use-value" :|last-access| 0 :|count| 0 :|function|
 "use-value value &optional condition) => nil")
("user-homedir-pathname" :|last-access| 0 :|count| 0 :|function|
 "user-homedir-pathname &optional host) => pathname")
("values" :|last-access| 0 :|count| 0 :|function|
 "values &rest object) => result*")
("values-list" :|last-access| 0 :|count| 0 :|function|
 "values-list list) => result*")
("vector" :|last-access| 0 :|count| 0 :|function|
 "vector &rest objects) => vector")
("vector-pop" :|last-access| 0 :|count| 0 :|function|
 "vector-pop vector) => element")
("vector-push" :|last-access| 0 :|count| 0 :|function|
 "vector-push new-element vector) => index")
("vector-push-extend" :|last-access| 0 :|count| 0 :|function|
 "vector-push-extend new-element vector &optional extension) => index")
("vectorp" :|last-access| 0 :|count| 0 :|function|
 "vectorp object) => generalized-boolean")
("warn" :|last-access| 0 :|count| 0 :|function|
 "warn datum &rest arguments) => nil")
("warning" :|last-access| 0 :|count| 0 :|class| "warning")
("when" :|last-access| 0 :|count| 0 :|macro| "when test-form form*) => result*")
("wild-pathname-p" :|last-access| 0 :|count| 0 :|function|
 "wild-pathname-p pathname &optional field-key) => generalized-boolean")
("with-accessors" :|last-access| 0 :|count| 0 :|macro|
 "with-accessors (slot-entry*) instance form*) => result*")
("with-compilation-unit" :|last-access| 0 :|count| 0 :|macro|
 "with-compilation-unit (option*) form*) => result*")
("with-condition-restarts" :|last-access| 0 :|count| 0 :|macro|
 "with-condition-restarts condition-form restarts-form form*) => result*")
("with-hash-table-iterator" :|last-access| 0 :|count| 0 :|macro|
 "with-hash-table-iterator (name hash-table) form*) => result*")
("with-input-from-string" :|last-access| 0 :|count| 0 :|macro|
 "with-input-from-string (var string &key start end index) form*) => result*")
("with-open-file" :|last-access| 0 :|count| 0 :|macro|
 "with-open-file (stream filespec options*) declaration* form*) => result*")
("with-open-stream" :|last-access| 0 :|count| 0 :|macro|
 "with-open-stream (var stream) declaration* form*) => result*")
("with-output-to-string" :|last-access| 0 :|count| 0 :|macro|
 "with-output-to-string (var &optional string &key element-type) form*) => result*")
("with-package-iterator" :|last-access| 0 :|count| 0 :|macro|
 "with-package-iterator (name package-list-form &rest symbol-types) form*) => result*")
("with-simple-restart" :|last-access| 0 :|count| 0 :|macro|
 "with-simple-restart (name format-control &rest args) form*) => result*")
("with-slots" :|last-access| 0 :|count| 0 :|macro|
 "with-slots (slot-entry*) instance form*) => result*")
("with-standard-io-syntax" :|last-access| 0 :|count| 0 :|macro|
 "with-standard-io-syntax form*) => result*")
("write" :|last-access| 0 :|count| 0 :|function|
 "write object &key stream escape radix base circle pretty level length case gensym array) => object")
("write-byte" :|last-access| 0 :|count| 0 :|function|
 "write-byte byte stream) => byte")
("write-char" :|last-access| 0 :|count| 0 :|function|
 "write-char character &optional stream) => character")
("write-line" :|last-access| 0 :|count| 0 :|function|
 "write-line string &optional stream &key start end) => string")
("write-sequence" :|last-access| 0 :|count| 0 :|function|
 "write-sequence seq stream &key start end) => seq")
("write-string" :|last-access| 0 :|count| 0 :|function|
 "write-string string &optional stream &key start end) => string")
("write-to-string" :|last-access| 0 :|count| 0 :|function|
 "write-to-string object &key escape radix base circle pretty level length case gensym array) => string")
("y-or-n-p" :|last-access| 3977700676 :|count| 2 :|function|
 "y-or-n-p &optional format-control &rest args) => generalized-boolean")
("yes-or-no-p" :|last-access| 0 :|count| 0 :|function|
 "yes-or-no-p &optional format-control &rest args) => generalized-boolean")
("zerop" :|last-access| 3977805386 :|count| 2 :|function|
 "zerop number) => generalized-boolean")
