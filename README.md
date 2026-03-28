Common Lispで記述したCommon Lisp用のreadlineパッケージ。

以下のファイルをホーム・ディレクトリ下の~/.config/line-editに置き、それ以外のファイルを例えば~/Lisp/line-editに置いて、そのディレクトリでmakeします。

 WordMaster-mode-function.lisp
 WordMaster-mode.help
 WordMaster-mode.lisp
 cursor-info.lisp
 emacs-mode.help
 emacs-mode.lisp
 init-repl-prompt.lisp
 line-edit-init.lisp
 set-editor-mode.lisp
 syntax-info-list.lisp
 syntax-info-list.lisp.backup
 user-info-list.lisp
 user-info-list.lisp.backup
 vi-mode-function.lisp
 vi-mode.help
 vi-mode.lisp

makeファイルの引数として
  make lisp=sbcl
  make lisp=clisp
とすることでsbclでのコンパイル、clispでのコンパイルが行われます。ファイル名から想像できる通り行編集コマンドとしてemacs, vi, そして古（いにしえ）のCP/M用エディタとして有名だったWordMaster互換の各編集コマンドが選択できます。

emacs同様にキーと編集用関数をバインドする構造なので定義さえすれば多種のエディタ・コマンドに対応できます。

history-pkg.lispという履歴機能を実現するパッケージと連携してbash風、およびcsh風の履歴機能を利用できます。

また履歴機能の一環としてプロンプトを直感的に指定できるようにしています。history-pkg:set-prompt-elementという関数に、表示したい内容を表示したい順序で記述します。途中に色指定も可能です。

;; > (documentation 'history-pkg:set-prompt-element 'function)
;;  指定できるプロンプト構成指示子は以下の通り。
;; 
;;  :current-package		カレント・パッケージ名(ニックネームがあれば、最短のニックネームを返す)。
;;  :original-package-name	カレント・パッケージ名を返す。ニックネームがあってもオリジナル名を返す。
;;  :not-cl-user		cl-userパッケージでない場合のみオリジナル・パッケージ名を返す。
;;  :date			今日のISOフォーマットでの日付(YYYY-MM-DD)。
;;  :time			24時間フォーマットでの現在の時刻(HH:MM:DD)。
;;  :time12			12時間フォーマットでの現在の時刻(HH:MM{am,pm})。
;;  :absolute-dir		カレント・ディレクトリ(絶対パス)。
;;  :working-dir		カレント・ディレクトリ(相対パス)。
;;  :working-dir-name		カレント・ディレクトリ名のみ。
;;  :history-number		履歴番号。
;;  :os-type			OSの種類。
;;  :host-name			ホスト名/マシン名。
;;  :machine-type		CPUタイプ。
;;  :lisp-type			処理系名。
;;  :lisp-version		処理系のバージョン番号。
;;  "string"			文字列。
;;  #'func			関数funcの返す結果。
;;
(history-pkg:set-prompt-element
"["					      ;; "["を表示。
:lisp-type				;; 処理系名。
":"					      ;; ":"を表示。
#'print-color-string:change-to-green		;; ここ以降は緑色。
:not-cl-user			;; カレント・パッケージが[:cl-user]でない場合のみ
        					  ;; パッケージ名を表示。表示色は緑色。
;; カレント・パッケージが[:cl-user]以外の場合は外部シンボル数を表示。
#'(lambda () (format nil "~a" (px:number-of-external-symbols *package* "=" "")))
#'print-color-string:change-to-blue		;; ここ以降は再び青色。
#+sbcl "("				  ;; sbclの場合は"("を表示。
#+sbcl #'print-color-string:change-to-red	;; ここ以降は赤色。
#+sbcl :heap-size		;; sbclの場合はヒープ・サイズを表示。
#+sbcl #'print-color-string:change-to-blue	;; ここ以降は青色。
#+sbcl ")"			  	;; sbclの場合は")"を表示。
" "					        ;; 空白(" ")を表示。
;;date					      ;; ISOフォーマットでの日付(YYYY-MM-DD)
;;" "					        ;; 空白(" ")を表示。
:time					      ;; 時刻を24時間制(HH:MM:SS)で表示。
" #"
:history-number "]> "			;; 文字の色や属性指定はここでリセットされる。
) ;; end history-pkg:set-prompt-element


行編集機能を担当するline-edit-pkg.lispには約800種のCommon Lisp関数とその引数情報を登録済みのコマンド補完機能を実装しています。「(cons」などと入力した段階でTabキーをタイプすると先頭が「cons」に一致する候補がTabキーをタイプする毎に切り替わりながら表示されます。

sbclとclispから実行する際は以下のようなalias設定を行っておくと便利です。

alias clisp='clisp -ansi --silent -disable-readline -i load-repl.lisp -repl -on-error abort

alias sbcl='sbcl --noinform --load load-repl.lisp

開発はUbuntu上のsbclとclispで行っています。

