(set-language-environment "Japanese")
(set-locale-environment "en_US.UTF-8")
(setenv "LC_ALL" "ja_JP.UTF-8")
(setenv "LANG" "ja_JP.UTF-8")
(prefer-coding-system 'utf-8-unix)

(setq set-file-name-coding-system 'utf-8-unix)
(setq set-keyboard-coding-system 'utf-8-unix)
(setq set-terminal-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq set-default-coding-systems 'utf-8-unix)
(setq set-selection-coding-system 'utf-8-unix)
(setq set-buffer-file-coding-system 'utf-8-unix)

(when (eq window-system 'darwin)
  (require 'ucs-normalize)
  (setq set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8hfs))

(when (eq window-system 'w32)
  (setq set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%5d ")
(line-number-mode t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(scroll-bar-mode 0)
(electric-pair-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq delete-auto-save-files t)
(setq backup-inhibited t)
(fset 'yes-or-no-p 'y-or-n-p)

(global-unset-key (kbd "C-x C-z"))

(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map "\M-?" 'help-for-help)

(setq completion-ignore-case t)
(global-auto-revert-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(global-set-key (kbd "C-\'") 'other-window-or-split)

(setq x-select-enable-clipboard t)

(if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 90) ;透明度

    (defun font-set-ricty-hook ()
        (set-face-attribute 'default nil
                            :family "Ricty"
                            :height 135)
        (set-fontset-font
            nil 'japanese-jisx0208
            (font-spec :family "Ricty"))
        (tool-bar-mode 0)
        (toggle-scroll-bar nil)
        (set-frame-parameter nil 'fullscreen 'maximized)
      )

    (add-hook 'emacs-startup-hook 'font-set-ricty-hook)
    ))

(defun set-alpha (alpha-num)
"set frame parameter 'alpha"
(interactive "nAlpha: ")
(set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;;; メニューのBuffersを階層に分ける
(msb-mode 1)

;;; C-vでスクロールした際，カーソルを一番上(下)に移動しない．
(setq scroll-preserve-screen-position t)

;;; GCを減らして軽くする(デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)

;;; 大きいファイルを開こうとしたときに警告
;;; デフォルトは10MBなので25MBに拡張
(setq large-file-warning-threshold (* 25 1024 1024))

;;; 補完候補から外す拡張子
(setq completion-ignored-extensions
      (append completion-ignored-extensions
	      '(".exe" ".aux" ".log" ".dvi" ".pdf")))

;;; diff モードは最初は read-only にする
(setq diff-default-read-only t)

;;; ediff で新規ウィンドウを表示しない
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; 最初から縦分割
(setq ediff-split-window-function 'split-window-Horizontally)

;;; カーソル位置に応じた find-file
(ffap-bindings)

;;; fill-paragraph のエラーを防止
(setq kinsoku-limit 4)

;;; 内部での日付/時間表記は英語で行う
(setq system-time-locale "C")

;;; 長いリストも全て出力する
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

;;; 警告音の代わりにウィンドウの上下1行ずつが反転
(setq visible-bell t)
(setq w32-visible-bell-type 'x)

;;; Emacsの終了時に必ず確認する
(setq confirm-kill-emacs 'y-or-n-p)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;; 行間
(setq-default line-spacing 0)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;; -------------------------------------------------------------------------
;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
	(isearch-update-ring (buffer-substring-no-properties (mark) (point)))
	(deactivate-mark)
	ad-do-it
	(if (not forward)
	    (isearch-repeat-backward)
	  (goto-char (mark))
	  (isearch-repeat-forward)))
    ad-do-it))

(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)

;; 動的略語展開
(global-set-key (kbd "C-W") 'hippie-expand)
(define-key minibuffer-local-map (kbd "C-W") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill))

;; M-<DEL>をkillringの中へ入れない
(defun delete-word (arg)
    "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
    (interactive "p")
    (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
    "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
    (interactive "p")
    (delete-word (- arg)))

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;; 開いているバッファのフルパスをミニバッファに表示
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; 開いているバッファのフルパスをミニバッファに表示し、コピーする
(defun copy-file-path ()
  "show the full path file name in the minibuffer and copy to kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))
    (message (buffer-file-name))))

(setq diff-switches '("-u" "-p" "-N"))

(setq kill-ring-max 500)

(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; Scroll window on a line-by-line basis
(setq scroll-conservatively 1000)
(setq scroll-step 1)
(setq scroll-margin 5) ; default=0

(global-set-key (kbd "<f11>") 'bs-cycle-previous)
(global-set-key (kbd "<C-f11>") 'bs-cycle-next)
(setq bs-cycle-configuration-name "files-and-scratch")

(display-battery-mode t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

(setq isearch-case-fold-search t)
