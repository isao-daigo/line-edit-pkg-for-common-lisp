;;;; last updated : 2026-03-24 11:30:23(JST)

;;;
;;; Emacs互換コマンド用のコマンドを定義(emacs-mode。
;;;
;;; "\C-x" と言う記法は global-set-key用の記法。"\C-a"と"\C-A"は同じ。
;;; "\C-"はControlキーを表す接頭辞。"\M-"はMetaキー(通常はAltキー、またはEscキー)、
;;; "\S-"はSuperキーを表す接頭辞。通常のキーボードにはないのでEsc+EscをSuperキーとして扱っている。
;;;

(use-package :line-edit-pkg)
(in-package :line-edit-pkg)

(clear-global-set-key)

;;(trace global-set-key)

(define-key "[Backspace]"	"\\C-h")
(define-key "[Enter]"		"\\C-j") ;; 処理系依存。
(define-key "[Return]"		"\\C-m")
(define-key "[Delete]"		"\\C-?")
(define-key "[Tab]"             "\\C-i")
(define-key "\\S-"		"#\^[ #\^[") ;; SuperキーをESC+ESCと定義。

(global-set-key "\\C-@"		#'set-mark-command)
(global-set-key "\\C-_"		#'set-mark-command)
(global-set-key "\\C-^"		#'scroll-down)
(global-set-key "\\C-a"		#'beginning-of-line)
(global-set-key "\\C-b"		#'backward-char)
(global-set-key "\\M-\\[\D"	#'backward-char) ;;left-arrow
(global-set-key "\\C-d"		#'delete-char)
(global-set-key "[Delete]"	#'delete-char)
(global-set-key "\\C-e"		#'end-of-line)
(global-set-key "\\C-f"		#'forward-char)
(global-set-key "\\M-\\[\C"	#'forward-char) ;;right-arrow
(global-set-key "\\C-h"		#'delete-backward-char)

(global-set-key "[Tab]"		#'complete-symbol)
(global-set-key "[Enter]"	#'end-input)
(global-set-key "\\C-k"		#'kill-line)
(global-set-key "\\C-l"		#'redraw)
(global-set-key "[Return]"	#'end-input)
(global-set-key "\\C-o"		#'set-mark-command)
(global-set-key "\\C-q"		#'quoted-insert)
(global-set-key "\\C-s"		#'isearch-forward)
(global-set-key "\\C-t"		#'transpose-chars)
(global-set-key "\\C-u"		#'universal-argument)
(global-set-key "\\C-v"		#'scroll-up)
(global-set-key "\\C-w"		#'kill-region)
(global-set-key "\\C-y"		#'yank)
(global-set-key "\\M-("		#'insert-parenthesis)
(global-set-key "\\M-,"		#'advertised-undo)
(global-set-key "\\M-."		#'advertised-redo)
(global-set-key "\\M-/"		#'mark-word)
(global-set-key "\\M-@"		#'mark-word)
(global-set-key "\\M-\\\\"	#'delete-horizontal-space)
(global-set-key "\\M-a"		#'beginning-of-text)
(global-set-key "\\M-b"		#'backward-word)
(global-set-key "\\M-c"		#'capitalize-word)
(global-set-key "\\M-d"		#'kill-word)
(global-set-key "\\M-e"		#'end-of-text)
(global-set-key "\\M-f"		#'forward-word)
(global-set-key "\\M-i"		#'inspect-keycode)
(global-set-key "\\M-k"		#'kill-text)
(global-set-key "\\M-l"		#'downcase-word)
(global-set-key "\\M-n"		#'next-word)
(global-set-key "\\M-o"		#'mark-sexp)
(global-set-key "\\M-p"		#'move-to-matching-paren)
(global-set-key "\\M-s"		#'just-one-space)
(global-set-key "\\M-t"		#'transpose-words)
(global-set-key "\\M-u"		#'upcase-word)
(global-set-key "\\M-v"		#'scroll-down)
(global-set-key "\\M-w"		#'kill-ring-save)
(global-set-key "\\M-y"		#'yank-pop)
(global-set-key "\\M-z"		#'zap-to-char)
(global-set-key "\\M-\\C-@"	#'mark-sexp)
(global-set-key "\\M-\\C-_"	#'mark-sexp)
(global-set-key "\\M-\\C-o"	#'mark-sexp)
(global-set-key "\\M-\\C-b"	#'backward-sexp)
(global-set-key "\\M-\\C-c"	#'line-edit-break)
(global-set-key "\\M-\\C-d"	#'down-list)
(global-set-key "\\M-\\C-e"	#'end-command-trace)
(global-set-key "\\M-\\C-f"	#'forward-sexp)
(global-set-key "\\M-\\C-h"	#'backward-kill-word)
(global-set-key "\\M-\\C-k"	#'kill-sexp)
(global-set-key "\\M-\\C-n"	#'forward-list)
(global-set-key "\\M-\\C-p"	#'backward-list)
(global-set-key "\\M-\\C-s"	#'start-command-trace)
(global-set-key "\\M-\\C-t"	#'transpose-sexps)
(global-set-key "\\M-\\C-u"	#'backward-up-list)
(global-set-key "\\M-\\C-w"	#'append-next-kill)
(global-set-key "\\C-x ("	#'start-kbd-macro)
(global-set-key "\\C-x )"	#'end-kbd-macro)
(global-set-key "\\C-x <"	#'scroll-left)
(global-set-key "\\C-x ="	#'what-cursor-position)
(global-set-key "\\C-x >"	#'scroll-right)
(global-set-key "\\C-x \\C-f"	#'find-file)
(global-set-key "\\C-x \\C-k"	#'edit-kbd-macro)
(global-set-key "\\C-x \\C-s"	#'save-buffer)
(global-set-key "\\C-x \\C-u"	#'up-list)
(global-set-key "\\C-x \\C-w"	#'write-file)
(global-set-key "\\C-x \\C-x"	#'exchange-point-and-mark)
(global-set-key "\\C-x e"	#'call-last-kbd-macro)
(global-set-key "\\C-x \\C-e"	#'call-last-kbd-macro)	;; [Ctrl]キーを押したまま[e]をタイプする場合のガード。
(global-set-key "\\C-x i"	#'insert-file)
(global-set-key "\\C-x \\C-i"	#'insert-file)		;; 同上。
(global-set-key "\\C-x q"	#'kbd-macro-query)
(global-set-key "\\C-x \\C-q"	#'kbd-macro-query)	;; 同上。
(global-set-key "\\C-x u"	#'advertised-undo)
(global-set-key "\\C-x U"	#'advertised-redo)
(global-set-key "\\C-x r R"	#'restore-registers)
(global-set-key "\\C-x \\C-r R"	#'restore-registers)	;; 同上。
(global-set-key "\\C-x r S"	#'save-registers)
(global-set-key "\\C-x \\C-r S"	#'save-registers)	;; 同上。
(global-set-key "\\C-x r i"	#'insert-register)
(global-set-key "\\C-x \\C-r i"	#'insert-register)	;; 同上。
(global-set-key "\\C-x r s"	#'copy-to-register)
(global-set-key "\\C-x \\C-r s"	#'copy-to-register)	;; 同上。

#+ :use-history-pkg
  (progn
    (format t "history-pkg commands available.~%")
    (global-set-key "\\C-p"		#'previous-line)
    (global-set-key "\\M-\\[A"		#'previous-line) ;; [Fn]+[
    (global-set-key "\\C-n"		#'next-line)
    (global-set-key "\\M-\\[\B"		#'next-line) ;; [Fn]+/
    (global-set-key "\\M-<"		#'beginning-of-history)
    (global-set-key "\\M->"		#'end-of-history)
    (global-set-key "\\M-m"		#'set-global-mark)
    (global-set-key "\\M-g"		#'goto-global-mark)
    ) ;; end progn

(global-set-key "\\S-t"	#'transpose-sexps)

(global-set-key nil #'self-insert)	;otherwise self-insert it.

(in-package :cl-user)
