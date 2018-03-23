(require 'package)

;; Emacs JP を始めとして、package-archives の後ろに追加する例が多いので従った。
;; http://emacs-jp.github.io/packages/package-management/package-el.html
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; init.el で package-install() せず、M-x package-list-packages から
;; インストールする場合、これらは不要。package-install() が良しなに
;; 初期化してくれるため。
(package-initialize)
(package-refresh-contents)

;; すでにインストール済みかを package-installed-p() でチェックする
;; 必要はない。package-install() から呼ばれる
;; package-compute-transaction() でチェックしているため。
(package-install 'use-package)
(package-install 'ivy)
(package-install 'swiper)
(package-install 'monokai-theme)
(package-install 'company)
(package-install 'yasnippet)
(package-install 'yasnippet-snippets)
(package-install 'find-file-in-project)
(package-install 'recentf-ext)
(package-install 'dumb-jump)
(package-install 'neotree)
(package-install 'php-mode)
(package-install 'phan)
(package-install 'company-php)
(package-install 'ac-php)
(package-install 'web-mode)
(package-install 'smex)
(package-install 'ddskk)
(package-install 'wanderlust)
(package-install 'migemo)
(package-install 'js2-mode)
(package-install 'smartparens)
(package-install 'ace-link)
(package-install 'elscreen)
(package-install 'which-key)
(package-install 'foreign-regexp)
(package-install 'sql-indent)
(package-install 'smart-newline)
(package-install 'auto-highlight-symbol)
(package-install 'projectile)
(package-install 'counsel-projectile)
(package-install 'diminish)
(package-install 'anzu)
(package-install 'comment-dwim-2)
(package-install 'expand-region)
(package-install 'undohist)
(package-install 'ggtags)
(package-install 'json-mode)
(package-install 'magit)
(package-install 'volatile-highlights)
(package-install 'symbol-overlay)
(package-install 'elfeed)
(package-install 'quelpa)
(package-install 'shell-pop)

(use-package quelpa)
(quelpa '(git-complete :repo "zk-phi/git-complete" :fetcher github))
(quelpa '(git-complete :repo "emacsmirror/dired-plus" :fetcher github))
(quelpa '(sql :fetcher url  :url "https://www.emacswiki.org/emacs/download/sql.el"))
(quelpa '(sql-indent :fetcher url :url "http://www.emacswiki.org/emacs/download/sql-indent.el"))
(quelpa '(sql-complete :fetcher url :url "https://www.emacswiki.org/emacs/download/sql-complete.el"))
(quelpa '(sql-transform :fetcher url :url "https://www.emacswiki.org/emacs/download/sql-transform.el"))
(quelpa '(eldoc-extension :fetcher url :url "https://www.emacswiki.org/emacs/download/eldoc-extension.el"))

;; ivy設定
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30)
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

;; counsel設定
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
(global-set-key "\C-s" 'swiper)

;; (set-language-environment "Japanese")
(set-locale-environment "en_US.UTF-8")
;; (setenv "LC_ALL" "ja_JP.UTF-8")
;; (setenv "LANG" "ja_JP.UTF-8")
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

(use-package uniquify)
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

                    (when (eq window-system 'darwin)
                    (defun font-set-ricty-hook ()
                      (set-face-attribute 'default nil
                                          :family "Ricty Diminished"
                                          :height 135)
                      (set-fontset-font
                       nil 'japanese-jisx0208
                       (font-spec :family "Ricty Diminished"))
                      (tool-bar-mode 0)
                      (toggle-scroll-bar nil)
                      (set-frame-parameter nil 'fullscreen 'maximized)
                      ))

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
;; (global-set-key (kbd "C-W") 'hippie-expand)
;; (define-key minibuffer-local-map (kbd "C-W") 'hippie-expand)
;; (setq hippie-expand-try-functions-list
;;       '(try-complete-file-name-partially
;;      try-complete-file-name
;;      try-expand-dabbrev
;;      try-expand-dabbrev-all-buffers
;;      try-expand-dabbrev-from-kill))
;;
;; ;; M-<DEL>をkillringの中へ入れない
;; (defun delete-word (arg)
;;   "Delete characters forward until encountering the end of a word.
;; With argument, do this that many times."
;;   (interactive "p")
;;   (delete-region (point) (progn (forward-word arg) (point))))
;;
;; (defun backward-delete-word (arg)
;;   "Delete characters backward until encountering the end of a word.
;; With argument, do this that many times."
;;   (interactive "p")
;;   (delete-word (- arg)))
;;
;; (global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)
;;
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

;; .#で始まるファイルは作成しない
(setq create-lockfiles nil)
;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; 現在行ハイライト
(use-package hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))

(display-time)
;; 以下の書式に従ってモードラインに日付・時刻を表示する
(setq display-time-string-forms
      '((format "[%s/%s/%s(%s) %s:%s]" year month day dayname 24-hours minutes)))
;; 時刻表示の左隣に日付を追加。
(setq display-time-kawakami-form t)
;; 24時間制
(setq display-time-24hr-format t)

(global-visual-line-mode)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
            (format "%%f - Emacs@%s" (system-name)))

(which-function-mode t)

; (add-to-list 'Info-directory-list "~/.emacs.d/info/mew/info")


(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
(define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map (kbd "C-f") 'company-complete-selection) ;; C-fで候補を設定
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う

(require 'yasnippet)
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(setq yas-snippet-dirs
    '("~/.emacs.d/yasnippets"
    "~/.emacs.d/mysnippets"))
(yas-global-mode 1)

;; yasnippetとの連携
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(global-unset-key (kbd "C-c C-c")) ;; 一応unbindしておきましょう
(global-set-key (kbd "C-c C-c") 'git-complete)
(add-to-list 'load-path '("~/clipho/mocom/www" "~/clipho/famu/www")) ;; お好きなように
(setq git-complete-enable-autopair t)

(require 'find-file-in-project)
(global-set-key (kbd "C-c C-f") 'find-file-in-project)
(setq ffip-project-root "/media/sf_src/mocom_www")

(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 200)             ;; recentf に保存するファイルの数
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 'never)             ;; 保存する内容を整理
(run-with-idle-timer 30 t '(lambda () (with-suppressed-message (recentf-save-list))))
(require 'recentf-ext)

(global-set-key (kbd "C-x C-r") 'counsel-recentf) ;; counselにおまかせ！

(use-package dumb-jump)
(setq dumb-jump-default-project "")
(setq dumb-jump-mode t)
(setq dumb-jump-selector 'ivy) ;; 候補選択をivyに任せます
(setq dumb-jump-use-visible-window nil)
(setq dumb-jump-force-searcher 'rg)
(global-set-key (kbd "C-c C-d") 'dumb-jump-go) ;; go-to-definition!
(global-set-key (kbd "C-c C-S-d") 'dumb-jump-back)

(setq neo-theme 'ascii) ;; icon, classic等もあるよ！
(setq neo-persist-show t) ;; delete-other-window で neotree ウィンドウを消さない
(setq neo-smart-open t) ;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)
(global-set-key "\C-o" 'neotree-toggle)

(require 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)
(add-hook 'markdown-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(define-key symbol-overlay-map (kbd "p") 'symbol-overlay-jump-prev) ;; 次のシンボルへ
(define-key symbol-overlay-map (kbd "n") 'symbol-overlay-jump-next) ;; 前のシンボルへ
(define-key symbol-overlay-map (kbd "C-g") 'symbol-overlay-remove-all) ;; ハイライトキャンセル

(add-to-list 'auto-mode-alist '("\\.inc" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl" . web-mode))

(cond (window-system
  (setq x-select-enable-clipboard t)
  ))

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl" "Write draft with Wanderlust." t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (shell-pop ddskk wanderlust))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#587F35"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#DFCF44"))))
 '(web-mode-css-property-name-face ((t (:foreground "#87CEEB"))))
 '(web-mode-css-pseudo-class ((t (:foreground "#DFCF44"))))
 '(web-mode-css-selector-face ((t (:foreground "#DFCF44"))))
 '(web-mode-css-string-face ((t (:foreground "#D78181"))))
 '(web-mode-doctype-face ((t (:foreground "#4A8ACA"))))
 '(web-mode-html-attr-equal-face ((t (:foreground "#FFFFFF"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#87CEEB"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#D78181"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#4A8ACA"))))
 '(web-mode-html-tag-face ((t (:foreground "#4A8ACA"))))
 '(web-mode-server-comment-face ((t (:foreground "#587F35")))))

(setq elfeed-feeds
      '(
("https://aws.amazon.com/jp/new/feed/")
("http://uxmilk.jp/feed")
("https://geechs-magazine.com/feed")
("https://seleck.cc/rss.xml")
("https://frasco.io/feed/")
("http://stormauction.s3-website-us-west-2.amazonaws.com/rss/github_trends_javascript_daily.rss")
("http://stormauction.s3-website-us-west-2.amazonaws.com/rss/github_trends_php_daily.rss")
("http://stormauction.s3-website-us-west-2.amazonaws.com/rss/github_trends_vim-script_daily.rss")
("http://techlog.voyagegroup.com/feed")
("http://b.hatena.ne.jp/t/react?sort=hot&amp;threshold=&amp;mode=rss")
("http://www.techscore.com/blog/feed/")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=vim&amp;users=1&amp;mode=rss")
("http://githubengineering.com/atom.xml")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=aws&amp;mode=rss")
("http://blog.cybozu.io/feed")
("http://qiita.com/tags/JavaScript/feed.atom")
("http://dev.classmethod.jp/feed/")
("http://feed43.com/pinterest-blog.xml")
("http://developers.mobage.jp/blog?format=rss")
("http://qiita.com/tags/React/feed.atom?")
("http://qiita.com/tags/mongodb/feed.atom")
("https://medium.com/feed/square-corner-blog")
("http://feeds.feedburner.com/daichifive/blog")
("http://blog.qiita.com/rss")
("http://feeds2.feedburner.com/wacth")
("http://b.hatena.ne.jp/t/javascript?sort=hot&amp;threshold=&amp;mode=rss")
("http://qiita.com/tags/redis/feed.atom")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=emacs&amp;mode=rss")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=PostgreSQL&amp;users=1&amp;mode=rss")
("http://labs.gree.jp/blog/feed/")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=linux&amp;users=1&amp;mode=rss")
("http://tech.mercari.com/feed")
("http://qiita.com/tags/aws/feed.atom")
("http://tech.vasily.jp/feed")
("http://qiita.com/tags/Emacs/feed.atom")
("http://developer.hatenastaff.com/feed")
("http://www.tellme.tokyo/feed")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=mongodb&amp;mode=rss")
("http://tech.gmo-media.jp/rss")
("http://b.hatena.ne.jp/t/angular?sort=hot&amp;threshold=&amp;mode=rss")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=php&amp;users=1&amp;mode=rss")
("http://tsuchinoko.dmmlabs.com/?feed=rss2")
("http://b.hatena.ne.jp/t/emacs?sort=hot&amp;threshold=&amp;mode=rss")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=redis&amp;mode=rss")
("http://qiita.com/tags/Python/feed.atom")
("http://kidachi.kazuhi.to/blog/index.rdf")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=ruby&amp;users=1&amp;mode=rss")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=perl&amp;mode=rss")
("http://www.webcreatorbox.com/feed/")
("http://b.hatena.ne.jp/search/tag?safe=on&amp;q=perl6&amp;mode=rss")
("http://www.buildinsider.net/rss")
("http://stocker.jp/diary/feed/")
("http://www.webcyou.com/?feed=rss2")
("http://twee.jp/_rss/rss20.xml")
("http://plus.appgiga.jp/feed/user")
("http://feeds.feedburner.com/WebDesignerWall")
("http://blog.livedoor.jp/ld_directors/index.rdf")
("http://feeds.feedburner.com/PhpJavascriptRoom")
("http://lopan.jp/feed/")
("http://postd.cc/feed/")
("http://feeds.feedburner.com/webimemo/jERU")
("http://coliss.com/feed")
("http://feeds.feedburner.com/webdesignrecipes")
("http://katoshun.com/blog/feed")
("http://techlife.cookpad.com/feed/")
("http://feeds.feedburner.com/moongift")
("http://www.yasuhisa.com/could/feed/")
("http://knowledge.sakura.ad.jp/feed/")
("http://html5experts.jp/feed")
("http://www.webdesignlibrary.jp/atom.xml")
("http://www.sem-r.com/index.rdf")
("http://feeds.feedburner.com/webdesigntutsplus")
("http://jp.techcrunch.com/feed/")
("http://terkel.jp/feed/")
("http://rss.rssad.jp/rss/codezine/new/20/index.xml")
("https://codeiq.jp/magazine/feed/")
("http://feeds.feedburner.com/WebDesignLedger?format=xml")
("http://qiita.com/tags/Ruby/feed.atom")
("http://qiita.com/tags/Docker/feed.atom")
("http://cssnite.jp/atom.xml")
("http://qiita.com/tags/Vim/feed.atom")
("http://kachibito.net/feed")
("http://nelog.jp/feed")
("http://e0166.blog89.fc2.com/?xml")
("http://webya.opdsgn.com/feed/")
("http://design-develop.net/feed")
("http://dx.24-7.co.jp/?feed=rss2")
("http://unitopi.com/feed/")
("http://feeds.feedburner.com/position-absolute/nyJv")
("http://blog.btrax.com/jp/feed/")
("http://creive.me/?feed=rss2")
("http://blog.petitboys.com/feed/")
("http://feeds.feedburner.com/screamo")
("http://www.coromos.com/feed/")
("http://feeds.feedburner.com/css-lecture")
("http://blog.creamu.com/mt/atom.xml")
("http://photoshopvip.net/feed")
("http://feeds.feedburner.com/webtan-blog")
("http://www.anotherbookmark.com/ab.xml")
("http://scrmble.jp/feed.rss")
("http://ebisu.com/feed/")
("http://akabeko.me/blog/feed/")
("http://qiita.com/tags/PHP/feed.atom")
("http://veadardiary.blog29.fc2.com/?xml")
))


;; .js, .jsx を web-mode で開く
(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))

;; 拡張子 .js でもJSX編集モードに
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; インデント
(add-hook 'web-mode-hook
          '(lambda ()
             (setq web-mode-attr-indent-offset nil)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-sql-indent-offset 2)
             (setq indent-tabs-mode nil)
             (setq tab-width 2)
          ))

;; 色



;;; elscreenの設定
;;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))

;; キーバインド
(global-set-key (kbd "<f9>") 'elscreen-toggle)

(diminish 'ivy-mode)
(diminish 'company-mode)
(diminish 'yas-minor-mode)
(diminish 'abbrev-mode)
(diminish 'auto-fill-function)

(use-package projectile)
(use-package counsel-projectile)

;; eshell + shell-pop
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-c o") 'shell-pop)
