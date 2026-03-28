;;;; last updated : 2026-03-24 11:29:54(JST)

;;;
;;; WordMasterのビデオ・モードのコマンドを定義。
;;;

(use-package :line-edit-pkg)
(in-package :line-edit-pkg)

(clear-global-set-key)

;;
;; カレント・ディレクトリ→ホーム・ディレクトリにWordMasterモード用キーバインドに必要な定義を収めた
;; [WordMaster-mode-function]のオブジェクトファイルがあればオブジェクト・ファイルを、オブジェクト
;; ファイルがなく、ソース・ファイルがあればソース・ファイルを読み込む。
;;
(let ((fname nil))
  (setf fname (external-command:config-file-abs-path "WordMaster-mode-function"))
  (cond
    ((identity fname)
     (load fname)
     (format t "~s loaded.~%" fname))
    (t (error "WordMaster-mode-function.~s can not find.~%" *lisp-extension*) )
    ) ;; end cond
  )

(define-key "[Backspace]"	"\\C-h")
(define-key "[Enter]"		"\\C-j") ;; 処理系依存。
(define-key "[Return]"		"\\C-m")
(define-key "[Delete]"		"\\C-?")
(define-key "[Tab]"             "\\C-i")
(define-key "\\S-"		"#\^[ #\^[") ;; SuperキーをESC+ESCと定義。

(global-set-key "\\M-/"		#'universal-argument)
(global-set-key "\\C-d"		#'forward-char)
(global-set-key "\\C-f"		#'forward-word)
(global-set-key "\\C-q d"	#'end-of-line)
(global-set-key "\\C-q\\C-d"	#'end-of-line)
(global-set-key "\\C-s"		#'backward-char)
(global-set-key "\\C-a"		#'backward-word)
(global-set-key "\\C-q s"	#'beginning-of-line)
(global-set-key "\\C-q\\C-s"	#'beginning-of-line)
(global-set-key "\\C-w"		#'scroll-up)
(global-set-key "\\C-z"		#'scroll-down)
(global-set-key "\\C-h"		#'delete-backward-char)
(global-set-key "\\C-g"		#'delete-char)
(global-set-key "\\C-t"		#'kill-word)
(global-set-key "\\C-u"		#'delete-line-from-beginning-of-line) ;; ポイント位置から行頭までを削除。
(global-set-key "\\C-y"		#'delete-text) ;; 行全体を削除。
(global-set-key "\\C-q y"	#'kill-line) ;; ポイント位置から行末までを削除。
(global-set-key "\\C-q\\C-y"	#'kill-line) ;; [Ctrl]キー押しっぱなしによるご操作のガード。
(global-set-key "\\C-i"		#'complete-symbol) ;; [Tab]挿入はQuoted insertで行う。
(global-set-key "\\C-p"		#'quoted-insert)
(global-set-key "\\C-v"		#'wm-start-overwrite-mode)
(global-set-key "\\C-l"		#'redraw)
(global-set-key "[Enter]"	#'end-input)
(global-set-key "[Return]"	#'end-input)

(global-set-key "\\M-\\C-w"	#'append-next-kill)
(global-set-key "\\M-\\C-d"	#'down-list)
(global-set-key "\\M-\\C-n"	#'forward-list)
(global-set-key "\\M-\\C-f"	#'forward-sexp)

(global-set-key "\\M-\\C-u"	#'backward-up-list)
(global-set-key "\\M-\\C-p"	#'backward-list)

(global-set-key "\\M-\\C-b"	#'backward-sexp)
(global-set-key "\\M-\\C-p"	#'backward-list)

(global-set-key "\\C-x <"	#'scroll-left)
(global-set-key "\\C-x >"	#'scroll-right)

(global-set-key "\\C-s"		#'isearch-forward)

(global-set-key "\\M-\\C-k"	#'kill-sexp)

(global-set-key "\\M-z"		#'zap-to-char)
(global-set-key "\\M-\\\\"	#'delete-horizontal-space)
(global-set-key "\\M-s"		#'just-one-space)

(global-set-key "\\M-t"		#'transpose-words)
(global-set-key "\\M-\\C-t"	#'transpose-sexps)

(global-set-key "\\C-@"		#'set-mark-command)
(global-set-key "\\C-_"		#'set-mark-command)
(global-set-key "\\M-/"		#'mark-word)
(global-set-key "\\M-@"		#'mark-word)
(global-set-key "\\M-\\C-@"	#'mark-sexp)
(global-set-key "\\M-\\C-_"	#'mark-sexp)
(global-set-key "\\M-\\C-o"	#'mark-sexp)
(global-set-key "\\C-x\\C-x"	#'exchange-point-and-mark)

(global-set-key "\\C-w"		#'kill-region)
(global-set-key "\\M-w"		#'kill-ring-save)
(global-set-key "\\M-\\C-w"	#'append-next-kill)

(global-set-key "\\C-y"		#'yank)
(global-set-key "\\M-y"		#'yank-pop)

(global-set-key "\\C-x r s"	#'copy-to-register)
(global-set-key "\\C-x\\C-r s"	#'copy-to-register)
(global-set-key "\\C-x r S"	#'save-registers)
(global-set-key "\\C-x\\C-r S"	#'save-registers)
(global-set-key "\\C-x r R"	#'restore-registers)
(global-set-key "\\C-x\\C-r R"	#'restore-registers)
(global-set-key "\\C-x r i"	#'insert-register)
(global-set-key "\\C-x\\C-r i"	#'insert-register)

(global-set-key "\\C-x u"	#'advertised-undo)
(global-set-key "\\C-x U"	#'advertised-redo)

(global-set-key "\\C-x ("	#'start-kbd-macro)
(global-set-key "\\C-x )"	#'end-kbd-macro)
(global-set-key "\\C-x e"	#'call-last-kbd-macro)
(global-set-key "\\C-x q"	#'kbd-macro-query)
(global-set-key "\\C-x\\C-k"	#'edit-kbd-macro)

(global-set-key "\\M-i"		#'inspect-keycode)

(global-set-key "\\M-l"		#'downcase-word)
(global-set-key "\\M-u"		#'upcase-word)
(global-set-key "\\M-p"		#'move-to-matching-paren)
(global-set-key "\\C-x ="	#'what-cursor-position)
(global-set-key nil		#'self-insert)

#+ :use-history-pkg
  (progn
    (format t "history-pkg commands available.~%")
    (global-set-key "\\C-e"		#'previous-line) ;; history-pkg使用時。
    (global-set-key "\\M-\\[A"		#'previous-line) ;; [Fn]+[
    (global-set-key "\\C-x"		#'next-line) ;; history-pkg使用時。
    (global-set-key "\\M-\\[\B"		#'next-line) ;; [Fn]+/
    (global-set-key "\\M-<"		#'beginning-of-history)	;; 拡張機能。
    (global-set-key "\\M->"		#'end-of-history)	;; 拡張機能。
    ) ;; end progn

;;
;; 挿入モード時にカーソルの色を変える機能の有無を記述したファイルを確認する。
;; 機能があると記載されていれば、挿入モード時のカーソル色も記載されている。
;;
(let ((fname nil))
  (setf fname (external-command:config-file-abs-path (cursor-info-file-name)))
  (when (identity fname)
    (load fname)
    (format t "~s loaded.~%" fname)
    ) ;; end when
  ) ;; end let

(in-package :cl-user)
