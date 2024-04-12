;;; package --- Summary
;;; Commentary:
;;; Code:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
         "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)
(setq use-package-verbose nil)

(setq user-init-file "~/.config/emacs/init.el")
(setq user-emacs-directory (file-name-directory user-init-file))

(add-to-list 'default-frame-alist '(cursor-type . bar))

(use-package gnu-elpa-keyring-update
  :straight t)

;; エコーエリア内で入力の補完をサポートする
(use-package vertico
  :straight t
  :init
  (vertico-mode)
  (setq vertico-scroll-margin 0)
  (setq vertico-count 20)
  (setq vertico-cycle t))

;; find-file時に上のディレクトリに戻るのをサポートする
(use-package extensions/vertico-directory
  :straight (:type built-in)
  :after vertico
  :bind (:map vertico-map
              ("C-l" . vertico-directory-up)
              ("\\d" . vertico-directory-delete-char)))

(use-package vertico-truncate
  :straight (:host github :repo "jdtsmith/vertico-truncate")
  :config
  (vertico-truncate-mode +1))

;; 対話型コマンドを利用しやすくする
(use-package consult
  :straight t
  :bind
  (("C-x C-b" . consult-buffer)
   ("M-g M-g" . consult-goto-line)
   ("C-c s" . consult-line)
   ("C-c i" . consult-imenu)
   ("C-c i" . consult-imenu)
   ("C-c C-o o" . consult-org-agenda)
   ("C-x C-r" . consult-recent-file)
   ("C-c o" .   consult-outline)
   ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
   ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
   ([remap bookmark-jump] . consult-bookmark)
   ([remap project-switch-to-buffer] . consult-project-buffer)
   ("C-c r" . consult-ripgrep)))

;; 最近開いたファイルを参照
(use-package recentf
  :config
  (setq recentf-max-saved-items 15)              ;; consult-bufferに表示する最近使ったファイルの最大表示数
  (setq recentf-exclude '(".recentf" "^/ssh:" "^/tmp\\.*" "bookmarks" "\\.gpg"))  ;; recentfの履歴に含ませないファイルリスト
  (setq recentf-auto-cleanup 'never)             ;; recentfの履歴を削除しない

  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list)) ;; バッファを開いて30秒以上したら履歴に登録
  (recentf-mode 1)
  ;; recentf の メッセージをエコーエリア(ミニバッファ)に表示しない
  ;; (*Messages* バッファには出力される)
  (defun recentf-save-list-inhibit-message:around (orig-func &rest args)
    (setq inhibit-message t)
    (apply orig-func args)
    (setq inhibit-message nil)
    'around)
  (advice-add 'recentf-cleanup   :around 'recentf-save-list-inhibit-message:around)
  (advice-add 'recentf-save-list :around 'recentf-save-list-inhibit-message:around)
  )

;; verticoの絞り込みにあいまい検索を追加
;; (use-package orderless
;;   :straight t
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package orderless
  :straight t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides nil)

  (with-eval-after-load 'migemo
    ;; orderlessをmigemo対応
    (defun orderless-migemo (component)
      (let ((pattern (downcase (migemo-get-pattern component))))
        (condition-case nil
            (progn (string-match-p pattern "") pattern)
          (invalid-regexp nil))))
    (add-to-list 'orderless-matching-styles 'orderless-migemo))

  (with-eval-after-load 'corfu
    (defun orderless-fast-dispatch (word index total)
      (and (= index 0) (= total 1) (length< word 4)
           'orderless-literal-prefix))

    (orderless-define-completion-style orderless-fast
      (orderless-style-dispatchers '(orderless-fast-dispatch))
      (orderless-matching-styles '(orderless-flex)))

    (defun my/setup-corfu-for-orderless ()
      (setq-local corfu-auto-delay 0
                  corfu-auto-prefix 1
                  completion-styles '(orderless-fast)))

    (add-hook 'corfu-mode-hook #'my/setup-corfu-for-orderless)))

;; consultのリストなどにメタ情報を表示する
(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

(use-package affe
  :straight t)

(use-package corfu
  :straight t
  :custom
  (corfu-cycle t)
  (corfu-count 16)
  (corfu-auto t)
  (corfu-separator ?\s)
  (corfu-preselect 'prompt)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0)
  :init
  (global-corfu-mode))

(use-package corfu-terminal
  :straight t
  :after corfu
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))

(use-package corfu-popupinfo
  :after corfu
  :straight (:type built-in)
  :hook (corfu-mode . corfu-popupinfo-mode))

;; (use-package corfu-info
;;  :after corfu
;;  :straight (:file (:defaults "extensions/*"))
;;  :hook (corfu-mode . corfu-info-mode))

(use-package prescient
  :straight t
  :config
  (prescient-persist-mode +1))

(use-package vertico-prescient
  :straight t
  :config
  (setq vertico-prescient-enable-filtering nil)
  (vertico-prescient-mode +1))

(use-package corfu-prescient
  :straight t
  :config
  (setq corfu-prescient-enable-filtering nil)
  (corfu-prescient-mode +1))

(use-package flx
  :straight t
  :config
  (with-eval-after-load 'prescient
    ;; 入力文字を抽出
    (defvar-local my/input-query nil)
    (defun my/store-input-query (string &rest _args)
      "store the current completion query in `my/input-query'."
      (setq my/input-query (replace-regexp-in-string " " "" string)))
    (advice-add 'completion-all-completions :before #'my/store-input-query)

    ;; ローカル変数を使用できるように再定義
    (defvar vertico--total nil)
    (defvar corfu--total nil)

    (defun my/flx-tiebreaker (c1 c2)
      (if (and (and (< vertico--total 3000)
                    (< corfu--total 3000))
               (> (length my/input-query) 0)
               (< (length c1) 100)
               (< (length c2) 100))
          (let ((query my/input-query))
            (let ((score1 (car (flx-score c1 query flx-file-cache)))
                  (score2 (car (flx-score c2 query flx-file-cache))))
              (if (and (integerp score1) (integerp score2))
                  (cond ((> score1 score2) -1)
                        ((< score1 score2) 1)
                        (t (- (length c1) (length c2))))
                0)))
        (- (length c1) (length c2))))

    (setq prescient-tiebreaker #'my/flx-tiebreaker)))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  ;; Other useful Dabbrev configurations.
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package cape
  :straight t
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c e p" . completion-at-point) ;; capf
         ("C-c e t" . complete-tag)        ;; etags
         ("C-c e d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c e h" . cape-history)
         ("C-c e f" . cape-file)
         ("C-c e k" . cape-keyword)
         ("C-c e s" . cape-elisp-symbol)
         ("C-c e e" . cape-elisp-block)
         ("C-c e a" . cape-abbrev)
         ("C-c e l" . cape-line)
         ("C-c e w" . cape-dict)
         ("C-c e :" . cape-emoji)
         ("C-c e \\" . cape-tex)
         ("C-c e _" . cape-tex)
         ("C-c e ^" . cape-tex)
         ("C-c e &" . cape-sgml)
         ("C-c e r" . cape-rfc1345))
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

(use-package embark
  :straight t
  :bind
  ("C-c ." . embark-act)
  ("C-c ;" . embark-dwim)
  ("C-h B" . embark-bindings)
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :straight t
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package svg-lib
  :straight t
  :after corfu)

(use-package kind-icon
  :straight t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package doom-themes
  :disabled
  :config
  (load-theme 'doom-challenger-deep t))

(use-package monokai-theme
  :straight t
  :config
  (load-theme 'monokai t))

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-bar-with 3)
  (setq doom-modeline-height 25)
  (setq doom-modeline-icon t)
  (setq doom-modeline-vcs-max-length 30)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-minor-modes t))

(use-package nerd-icons
  :straight t)

(use-package nerd-icons-dired
  :straight t
  :hook (dired-mode-hook . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :straight t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook (marginalia-mode-hook . #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :straight t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nyan-mode
  :straight t
  :custom
  (nyan-animate-nyancat t)
  :init
  (nyan-mode))

(use-package rainbow-delimiters
  :straight t
  :delight rainbow-mode
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package php-mode
  :straight t
  :init
  (defun my/php-mode-hook ()
    (subword-mode 1)
    (setq-local show-trailing-whitespace t)
    (setq-local ac-disable-faces '(font-lock-comment-face font-lock-string-face))
    (add-hook 'hack-local-variables-hook 'php-ide-turn-on nil t))
  :hook ((php-mode . my/php-mode-hook)
         (php-mode . eglot-ensure))
  :custom
  (php-manual-url 'ja)
  (php-mode-coding-style 'psr2)
  (php-model-template-compatibility nil)
  (php-imenu-generic-expression 'php-imenu-generic-expression-simple)
  (when (require 'flycheck nil)
    (add-to-list 'flycheck-disabled-checkers 'php-phpmd)
    (add-to-list 'flycheck-disabled-checkers 'php-phpcs)))

(use-package smartparens
  :straight t
  :delight
  :hook ((after-init-hook       . smartparens-global-strict-mode))
  :requires smartparens-config
  :custom ((electric-pair-mode . nil)))

(use-package highlight-indent-guides
  :straight t
  :delight
  :init
  (custom-set-variables '(highlight-indent-guides-method 'character))
  (custom-set-variables '(highlight-indent-guides-auto-enabled t))
  (custom-set-variables '(highlight-indent-guides-responsive t))
  :hook (prog-mode . highlight-indent-guides-mode))

(use-package eglot
  :bind (nil
         :map eglot-mode-map
         ("C-c a" . eglot-code-actions)
         ("C-c h"))
  :config
  (add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
  (add-to-list 'eglot-server-programs '(vue-mode . ("vue-language-server" "--stdio"
                                                    :initializationOptions
                                                    (:typescript (:tsdk "node_modules/typescript/lib")))))
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       #'tempel-complete
                       #'eglot-completion-at-point)
                      #'cape-keyword
                      #'cape-dabbrev
                      #'cape-file)
                ))
  (add-hook 'eglot-managed-mode-hook #'my/eglot-capf))

(use-package smart-jump
  :straight t
  :commands (smart-jump-go smart-jump-back smart-jump-references)
  :bind (("C-c g g" . smart-jump-go)
         ("C-c g b" . smart-jump-back)
         ("C-c g r" . smart-jump-references)))

(use-package git-complete
  :straight (:host github :repo "zk-phi/git-complete" :branch "master")
  :bind (("C-c C-g" . git-complete)))

(use-package tree-sitter
  :straight t)

(use-package tree-sitter-langs
  :straight t)

(use-package treesit-auto
  :straight t
  :config
  (setq treesit-auto-install 'prompt)
  (setq treesit-font-lock-level 4)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package web-mode
  :straight t
  :config
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[jt]sx" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.htm[l]" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-comment-style 2)
  (web-mode-style-padding 1)
  (web-mode-script-padding 1)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-pairing t)
  (web-mode-auto-close-style 2)
  (web-mode-tag-auto-close-style 2)
  (indent-tabs-mode nil)
  (tab-width 2)
  :hook ((web-mode . (lambda ()
                            (setq-local tab-width 2)))
         (css-mode . (lambda ()
                            (setq-local tab-width 2)))))

(use-package emmet-mode
  :straight t
  :hook ((html-mode
          web-mode
          css-mode
          js-mode
          typescript-mode) . emmet-mode))

(use-package css-mode
  :straight t
  :config
  (setq css-indent-offset 2))

(use-package rainbow-mode
  :straight t
  :hook ((css-mode . rainbow-mode)
         (less-mode . rainbow-mode)))

(use-package sass-mode
  :straight t
  :mode "\\.sass\\'")

(use-package tramp
  :custom
  (tramp-default-method "ssh")
  (tramp-copy-size-limit nil))

(use-package ddskk
  :straight t
  :custom
  (skk-show-annotation nil)
  (skk-latin-mode-string "[_A]")
  (skk-hiragana-mode-string "[あ]")
  (skk-katakana-mode-string "[ア]")
  (skk-jisx0208-latin-mode-string "[Ａ]")
  (skk-jisx0201-mode-string "[_ｱ]")
  (skk-abbrev-mode-string "[aA]")
  (skk-indicator-use-cursor-color nil)
  (skk-use-jisx0201-input-method t)
  (skk-auto-insertparen t)
  (skk-henkan-strict-okuri-precedence t)
  (skk-share-private-jisyo t)
  :config
  (global-set-key (kbd "C-x C-j") 'skk-auto-fill-mode)
  (global-set-key (kbd "C-\\")  'skk-auto-fill-mode)
  (setq default-input-method "japanese-skk")
  (setq skk-sticky-key ";")
  (use-package skk-study
    :straight (:type built-in))
  (setq skk-server-host "localhost")
  (setq skk-server-portnum 1178))

(use-package migemo
  :straight t
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init))

(use-package anzu
  :straight t
  :delight anzu-mode
  :config
  (global-anzu-mode +1))

(use-package git-modes :straight t)

(use-package magit
  :straight t
  :custom
  (magit-wip-mode t)
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)))

(use-package forge
  :straight t
  :after magit)

(use-package diff-hl
  :straight t
  :demand t
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  :hook ((magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
         (magit-post-refresh-hook . diff-hl-magit-post-refresh)
         (dired-mode-hook . diff-hl-dired-mode)))

(use-package mwim
  :straight t
  :bind (("C-a" . mwim-beginning-of-code-or-line)
         ("C-e" . mwim-end-of-code-or-line)))

(use-package git-gutter
  :straight t
  :delight
  :custom-face
  (git-gutter:modified ((t (:background "#f1fa8c"))))
  (git-gutter:added    ((t (:background "#50fa7b"))))
  (git-gutter:deleted  ((t (:background "#ff79c6"))))
  :config
  (global-git-gutter-mode +1))

(use-package whitespace
  :delight
  :config
  (setq whitespace-style '(face
                         trailing
                         tabs
                         spaces
                         empty
                         space-mark
                         tab-mark))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  (setq whitespace-trailing-regexp "\\([ \u00A0]+\\)$")
  (setq whitespace-action '(auto-cleanup))
  (global-whitespace-mode 1))

(use-package sh-script
  :hook (bash-ts-mode-hook . eglot-ensure))

(use-package nix-mode
  :straight t
  :mode "\\.nix\\'")

(use-package python
  :custom
  (python-indent-guess-indent-offset-verbose . nil)
  (flycheck-python-ruff-config '("ruff.toml" ".ruff.toml"))
  :hook (python-ts-mode-hook . eglot-ensure))

(use-package reformatter
  :straight t
  :hook (python-ts-mode-hook . ruff-format-on-save-mode)
  :config
  (reformatter-define ruff-format
    :program "ruff"
    :args `("format" "--stdin-filename" ,buffer-file-name "-")))

(use-package ruff-fix
  :straight (:host github :repo "mkt3/ruff-fix.el" :branch "main")
  :hook (before-save-hook . ruff-fix-before-save))

;; (use-package js2-mode
;;   :disabled
;;   :straight t
;;   :init
;;   (defun my/js2-mode-hook ()
;;     (flycheck-mode 1)
;;     (setq flycheck-disabled-checkers '(javascript-standard javascript-jshint))
;;     (setq js2-basic-offset 2))
;;   :hook (js2-mode . my/js2-mode-hook))

(use-package flycheck
  :straight t
  :delight flycheck-mode
  :custom ((flycheck-display-erros-delay 0.3)
           (flycheck-indication-mode 'left-margin)
           (flycheck-textlint-plugin-alist ()))
  :init
  (global-flycheck-mode)
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode))

(use-package flycheck-posframe
  :straight t
  :after flycheck
  :if window-system
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))

(use-package flycheck-inline
  :straight t
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(use-package flycheck-color-mode-line
  :straight t
  :hook (flycheck-mode . flycheck-color-mode-line-mode))

(use-package flycheck-popup-tip
  :straight t)

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :custom (flycheck-eglot-exclusive nil)
  :config
  (global-flycheck-eglot-mode 1))

(use-package markdown-mode
  :straight t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         (("README\\.md\\'" . gfm-mode)))
  :custom
  (markdown-fontify-code-blocks-natively t)
  (markdown-indent-on-enter 'indent-and-new-item)
  :hook (markdown-mode-hook . (lambda ()
                                 (setq tab-width 2)
                                 (turn-on-orgtbl)
                                 (add-to-list 'eglot-server-programs '(markdown-mode . ("marksman")))
                                 (eglot-ensure))))

(use-package yaml-mode
  :straight t
  :mode (("\\.yml\\'" . yaml-ts-mode)
         ("\\.yaml\\'" . yaml-ts-mode))
  :commands (yaml-ts-mode))

(use-package toml-mode
  :straight t
  :mode (("\\.toml\\'" . toml-ts-mode))
  :commands (toml-ts-mode))

(use-package json-mode
  :straight t
  :mode (("\\.json\\'" . json-ts-mode))
  :commands (json-ts-mode)
  :hook (json-ts-mode-hook . eglot-ensure))

(use-package json-reformat
  :straight t
  :after (json-ts-mode))

(use-package typescript-mode
  :straight t
  :config
  (setq typescript-indent-level 2))

(use-package popwin
  :straight t)

(use-package autorevert
  :delight auto-revert-mode
  :custom
  (auto-revert-interval 0.1)
  :config
  (global-auto-revert-mode t))

(use-package ace-window
  :straight t
  :bind (("C-x o" . ace-window)))

(use-package uniquify
  :straight (:type built-in)
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

(use-package exec-path-from-shell
  :ensure t
  :if (display-graphic-p)
  :custom
  (exec-path-from-shell-check-startup-files nil)
  :config
  (setq exec-path-from-shell-arguments  "") ;; Since the UI is set to interactive in .zshrc.
  (setq exec-path-from-shell-variables  '("PATH" "GOPATH" "NAME" "ORG_HUGO" "RUSTUP_HOME" "CARGO_HOME" "SSH_AUTH_SOCK" "SSH_AGENT_PID" "GNUPGHOME" "PASSWORD_STORE_DIR" "GPG_KEY_ID" "RECOLL_CONFDIR"))
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package which-key
  :straight t
  :diminish which-key-mode
  :config
  (which-key-mode t))

(use-package vterm
  :straight t
  :custom
  (vterm-max-scrollback 10000)
  (vterm-buffer-name-string "vterm: %s")
  :config
  (setq vterm-keymap-exceptions '("<f1>" "<f2>" "C-c" "C-x" "C-u" "C-g" "C-l" "M-x" "M-o" "C-v" "M-v" "C-y" "M-y")))

(use-package vterm-toggle
  :straight t
  :bind ("<f2>" . vterm-toggle))

(use-package projectile
  :straight t
  :delight
  :config
  (setq projectile-mode-line-prefix " Prj")
  (setq projectile-project-search-path '(("~/work/" . 5)))
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-sort-order 'recentf)
  (setq projectile-enable-caching nil)
  (setq projectile-file-exists-local-cache-expire (* 5 60))
  (setq projectile-auto-discover nil)
  (setq projectile-completion-system 'auto)
  (setq projectile-switch-project-action #'projectile-dired)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (add-to-list 'projectile-globally-ignored-directories "tmp")
  (add-to-list 'projectile-globally-ignored-directories ".tmp")
  (add-to-list 'projectile-globally-ignored-directories "vendor")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "coverage")
  (add-to-list 'projectile-globally-ignored-directories "cache")
  (add-to-list 'projectile-globally-ignored-directories "log")
  (projectile-global-mode))

(use-package posframe
  :straight t
  :if window-system)

(use-package org
  :straight t
  :bind (("C-c C-o c" . org-capture)
         ("C-c C-o a" . org-agenda)
         ("C-c C-o j" . org-journal-new-entry))
  :hook ((org-mode-hook . org-indent-mode)
         (org-mode-hook . evil-org-mode))
  :custom
  (org-startup-indent nil)
  (org-hide-leading-stars t)
  (org-return-follows-link t)
  (org-startup-truncated nil)
  (org-use-speed-commands t)
  (org-startup-with-latex-preview nil)
  (org-log-done 'time)
  (org-adapt-indentation t)
  (org-confirm-babel-evaluate nil)
  (org-id-link-to-org-use-id t)
  (org-list-allow-alphabetical t)
  (org-return-follows-link t)
  (org-mouse-1-follows-link t)
  (org-use-sub-superscripts '{})
  (org-export-with-sub-superscripts nil)
  (org-journal-date-format "%A, %d %B %Y")
  (org-todo-keywords
   '((sequence "TODO" "EXAMINATION(e)" "READY(r)" "DOING(!)" "WAIT" "|" "DONE(!)" "SOMEDAY(s)")))
  :config
  (setq org-directory "~/Google Drive/My Drive/Org")
  (setq org-default-notes-file "notes.org")
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "/mnt/c/Users/shunk/Dropbox/Org/notes.org" "Notes")
           "** MEMO %(format-time-string org-journal-time-format)%?")
          ("t" "Task" entry (file+headline "/mnt/c/Users/shunk/Dropbox/Org/tasks.org" "Tasks")
           "** TODO %U\n%^{Title}\n  %?\n  %a")
          ))
  )

(use-package org-agenda
  :straight nil
  :after org
  :config
  (setq org-agenda-files (file-expand-wildcards (concat "~/Google Drive/My Drive/Org/" "/*.org"))))

(use-package org-indent
  :straight nil
  :hook (org-mode . org-indent-mode))

(use-package org-modern
  :straight t
  :after org
  :init
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")

  :config
  (global-org-modern-mode +1))

(use-package org-modern-indent
  :straight (:host github :repo "jdtsmith/org-modern-indent")
  :config
  (add-hook 'org-mode-hook #'org-modern-indent-mode 90))

(use-package org-contrib
  :straight t)

(use-package org-roam
  :straight t)

(use-package org-roam-ui
  :straight t)

(use-package org-super-agenda
  :straight t
  :config
  (org-super-agenda-mode 1))

(use-package org-cliplink
  :straight t
  :bind (("C-c C-o l" . org-cliplink)))

(use-package japanese-holidays
  :straight t)

(use-package htmlize
  :straight t)

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-search-vim-style-regexp t)
  (setq evil-toggle-key "C-c C-q")
  :config
  (evil-mode t)
  (defun evil-swap-key (map key1 key2)
    (let ((def1 (lookup-key map key1))
          (def2 (lookup-key map key2)))
      (define-key map key1 def2)
      (define-key map key2 def1)))
  (evil-swap-key evil-motion-state-map "j" "gj")
  (evil-swap-key evil-motion-state-map "k" "gk")
  (evil-swap-key evil-motion-state-map ";" ":"))

(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :straight t
  :config
  (evil-commentary-mode +1))

(use-package evil-surround
  :straight t
  :config
  (global-evil-surround-mode +1))

(use-package evil-matchit
  :straight t
  :config
  (global-evil-matchit-mode +1))

(use-package evil-org
  :straight t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-goggles
  :straight t
  :config
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))

(use-package savehist
  :init
  (savehist-mode))

(use-package dabbrev)

(use-package lsp-treemacs
  :straight t
  :config
  (lsp-treemacs-sync-mode 1))

(use-package tempel
  :straight t
  :init
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-complete
                      completion-at-point-functions)))
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  (add-hook 'org-mode-hook 'tempel-setup-capf)
  :bind (("M-+" . tempel-complete)
         ("M-*" . tempel-insert)))

(use-package eglot-tempel
  :straight t
  :after (eglot tempel)
  :hook (eglot-managed-mode . eglot-tempel-mode))

(use-package flymake
  :straight t
  :bind (nil
         :map flymake-mode-map
         ("C-c C-p" . flymake-goto-prev-error)
         ("C-c C-n" . flymake-goto-next-error))
  :config
  (set-face-background 'flymake-errline "red4")
  (set-face-background 'flymake-warnline "DarkOrange"))

(use-package flymake-diagnostic-at-point
  :straight t
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode)
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

(use-package gcmh
  :straight t
  :diminish gcmh-mode
  :custom
  (gcmh-verbose t)
  (gcmh-idle-delay 120)
  (gcmh-high-cons-threshold (* 128 1024 1024))
  (garbage-collection-messages t)
  :config
  (gcmh-mode 1))

(use-package alert
  :straight t
  :init
  (if (or (eq window-system 'ns) (eq window-system 'mac))
    (setq alert-default-style 'notifier)
    (setq alert-default-style 'libnotify)))

(use-package alert-toast
  :disabled
  :straight t)

(use-package valign
  :straight t
  :hook ((org-mode-hook . valign-mode)
         (markdown-mode-hook . valign-mode)))

(use-package rg
  :straight t)

(use-package w3m
  :straight t)

(use-package dimmer
  :ensure t
  :custom
  (dimmer-fraction  0.5)
  (dimmer-exclusion-regexp-list  '(".*Minibuf.*" ".*which-key.*" ".*NeoTree.*"
                                   ".*Messages.*" ".*Async.*" ".*Warnings.*" ".*LV.*"
                                   ".*Ilist.*"))
  (dimmer-mode t))

(use-package volatile-highlights
  :straight t
  :delight VHI
  :config
  (volatile-highlights-mode t))

(use-package avy
  :straight t
  :bind
  ("M-s" . avy-goto-char))

(use-package beacon
  :disabled
  :straight t
  :diminish beacon-mode
  :custom
  (beacon-color "yellow")
  :config
  (beacon-mode 1))

(use-package color-identifiers-mode
  :straight t)

;; (use-package auto-package-update
;;   :defer nil
;;   :straight t
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

(use-package diminish
  :straight t)

(use-package async
  :straight t
  :init
  (dired-async-mode 1))

(use-package eldoc
  :diminish eldoc-mode
  :config
  (eldoc-mode t))

;; (use-package abbrev
;;   :diminish abbrev-mode)

(use-package sql-indent
  :straight t)

(use-package sqlformat
  :straight t)

(use-package paren
  :custom
  (show-paren-delay 0.0)
  (show-paren-mode t))

(use-package saveplace
  :custom
  (save-place-mode t))

(use-package epg
  :custom
  (epg-pinentry-mdoe 'loopback))

(use-package epa
  :after epg
  :config
  (require 'epa-file)
  (epa-file-enable))

(use-package password-store
  :straight t)

(use-package plstore
  :mode (("\\.plist\\'" . plstore-mode))
  :custom
  (plstore-encrypt-to (getenv "GPG_KEY_ID")))

(use-package auth-source
  :custom
  (auth-source-gpg-encrypt-to (getenv "GPG_KEY_ID")))

(use-package espy
  :straight t
  :bind (("C-c C-p u" . espy-get-user)
         ("C-c C-p p" . espy-get-pass))
  :config
  (setq espy-password-file "~/skjkw-passwords.org.gpg"))

(use-package pass
  :straight t
  :config
  (setq epa-pinentry-mode 'loopback))

(use-package dired
  :straight (:type built-in)
  :custom
  (dired-dwim-target t)
  (dired-recursive-copies 'always))

(use-package dirvish
  :straight t
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("b" "~/Nextcloud/book"            "Books")
     ("t" "~/.local/share/Trash/files/" "TrashCan")))
  :config
  (dirvish-override-dired-mode)
  ;; (dirvish-peek-mode) ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes
        '(file-time file-size collapse subtree-state vc-state git-msg))
  (setq dirvish-subtree-state-style 'nerd)
  (setq dirvish-path-separators (list
                                 (format "  %s " (nerd-icons-codicon "nf-cod-home"))
                                 (format "  %s " (nerd-icons-codicon "nf-cod-root_folder"))
                                 (format " %s " (nerd-icons-faicon "nf-fa-angle_right"))))
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches
        "-l --human-readable --group-directories-first --no-group")
  (defun my:project-find-dir-dirvish (dir)
    "Use dirvish instead of dired in `project-find-dir'."
    (dirvish dir))
  (advice-add 'project-find-dir :around
              (lambda (orig-fun &rest args)
                (cl-letf (((symbol-function 'dired) #'my:project-find-dir-dirvish))
                  (apply orig-fun args))))
  :bind ; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish-fd)
   ("C-x d" . dirvish)
   :map dirvish-mode-map ; Dirvish inherits `dired-mode-map'
   ("q"   . dirvish-quit)
   ("a"   . dirvish-quick-access)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("h"   . dirvish-history-jump) ; remapped `describe-mode'
   ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
   ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-t" . dirvish-layout-toggle)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))

(use-package eww
  :demand t
  :bind (("<f3>" . eww)
         :map eww-mode-map
         ("h" . eww-back-url)
         ("l" . eww-forward-url)
         ("&" . eww-browse-with-external-browser)
         ("o" . eww)
         ("r" . eww-reload)
         ("y" . eww-copy-page-down)
         ("j" . scroll-up-line)
         ("k" . scroll-down-line)
         ("g" . beginning-of-buffer)
         (";" . quit-window)
         ("/" . isearch-forward)
         ("?" . isearch-backward)
         ("n" . isearch-next)
         ("N" . isearch-previous)
         ("G" . end-of-buffer))
  :custom
  (browse-url-browser-function 'eww-browse-url)
  (eww-search-prefix "https://www.google.com/search?q=")
  ;; (browse-url-browser-function 'eww)
  :config
  (defun eww-disable-images ()
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image-alt)
    (eww-reload))
  (defun eww-enable-images ()
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image)
    (eww-reload))
  (defun shr-put-image-alt (spec alt &optional flags)
    (insert alt)))

(use-package ace-link
  :straight t
  :bind (nil
         :map eww-mode-map
         ("f" . ace-link-eww))
  :config
  (ace-link-setup-default))

(use-package elfeed
  :after eww
  :straight t
  :bind (("C-x w" . elfeed)
         :map elfeed-search-mode-map
         ("u" . elfeed-search-fetch)
         ("r" . elfeed-search-update--force)
         ("o" . elfeed-search-browse-url)
         (";" . elfeed-search-quit-window)
         ("m" . elfeed-search-show-entry)
         ("," . elfeed-search-first-entry)
         ("." . elfeed-search-last-entry)
         :map elfeed-show-mode-map
         ("r" . elfeed-search-update--force)
         ("u" . elfeed-search-fetch)
         ("o" . elfeed-show-visit)
         ("C-c C-o" . my:elfeed-show-default-browser)
         (";" . elfeed-kill-buffer))
  :custom
  (elfeed-db-directory (locate-user-emacs-file "elfeed"))
  :config
  (advice-add 'elfeed-search-fetch :after (lambda (&rest _) (message "RSS fetch completed.")))
  (defun my:elfeed-show-default-browser ()
           (interactive)
           (let ((browse-url-browser-function 'browse-url-default-browser))
             (elfeed-show-visit))))

(use-package elfeed-protocol
  :straight t
  :after elfeed
  :config
  (elfeed-protocol-enable)
  :custom
  (elfeed-use-curl t)
  (elfeed-set-timeout 36000)
  (elfeed-log-level 'debug)
  (elfeed-protocol-fever-update-unread-only t)
  :config
  (setq elfeed-protocol-feeds
        (list (let ((auth-info (nth 0 (auth-source-search :host "freshrss" :max 1))))
                (list (plist-get auth-info :feed-url)
                      :api-url (plist-get auth-info :api-url)
                      :password (plist-get auth-info :password))))))

(use-package elfeed-webkit
  :straight t
  :after elfeed
  :config
  :bind (nil
         :map elfeed-webkit-map
         ("k" . (lambda () (interactive) (xwidget-webkit-scroll-down 20)))
         ("j" . (lambda () (interactive) (xwidget-webkit-scroll-up 20)))
         :map elfeed-show-mode-map
         ("i" . elfeed-webkit-toggle)))

(use-package eshell
  :custom
  (eshell-cmpl-ignore-case t)
  (eshell-cmpl-cycle-completions t)
  (shell-cmpl-cycle-cutoff-length 5)
  (eshell-ask-to-save-history (quote always))
  (eshell-hist-ignoredups t)
  (eshell-list-files-after-cd t)
  :bind (nil
         :map eshell-mode-map
         ("C-r" . consult-history))
  :config
  (add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-256color")))
  (defun corfu-send-shell (&rest _)
    "Send completion candidate when inside comint/eshell."
    (cond
     ((and (derived-mode-p 'eshell-mode) (fboundp 'eshell-send-input))
      (eshell-send-input))
     ((and (derived-mode-p 'comint-mode)  (fboundp 'comint-send-input))
      (comint-send-input))))
  (advice-add #'corfu-insert :after #'corfu-send-shell))

(use-package eshell-prompt-extras
  :straight t
  :after esh-opt
  :defines eshell-highlight-prompt
  :commands (epe-theme-lambda epe-theme-dakrone epe-theme-multiline-with-status)
  :init (setq eshell-highlight-prompt nil
              epe-path-style 'full
              eshell-prompt-function 'epe-theme-multiline-with-status))

(use-package eat
  :straight t
  :hook (eshell-load-hook . eat-eshell-mode))

(use-package go-translate
  :straight t
  :bind (("C-c t" . gts-do-translate))
  :config
  (set-face-attribute 'gts-render-buffer-me-header-backgroud-face nil :foreground "black")
  (setq gts-translate-list '(("ja" "en") ("en" "ja")))
  (setq engine-list (list
                     (gts-google-engine)
                     (gts-bing-engine)))
  (when (file-directory-p my:d:password-store)
    (let ((deeplapi-key (plist-get (nth 0 (auth-source-search :app "deepl" :max 1)) :api-key)))
      (setq engine-list (append (list (gts-deepl-engine :auth-key deeplapi-key :pro nil)) engine-list))))
  (setq gts-default-translator
        (gts-translator
         :picker
         (gts-prompt-picker)
         :engines
         engine-list
         :render
         (gts-buffer-render)))
  (setq gts-buffer-follow-p t))

(use-package consult-recoll
  :disabled
  :straight t
  :demand t
  :if (executable-find "recoll")
  :bind (("C-c n s" . consult-recoll))
  :config
  (if (eq system-type 'darwin)
      (setq exec-path (append '("/usr/local/Cellar/recoll/1.35.0/recoll.app/Contents/MacOS") exec-path)))
  (when (display-graphic-p)
    (run-at-time 0 (* 5 60)
                 (lambda ()
                   (start-process "recollindex" nil "recollindex" "-c" (getenv "RECOLL_CONFDIR"))))))

(use-package docker
  :straight t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :straight (:host github :repo "spotify/dockerfile-mode" :branch "master"))

(use-package docker-compose-mode
  :straight t)

(use-package atomic-chrome
  :straight t
  :hook (after-init-hook . atomic-chrome-start-server)
  :custom (atomic-chrome-buffer-open-style . 'full))

(use-package vue-mode
  :straight t
  :init
  (defun my/vue-mode-hook ()
    (flycheck-mode 1))
  :hook ((vue-mode . my/vue-mode-hook))
  :config
  (setq mmm-submode-decoration-level 0))

(use-package minions
  :straight t
  :init
  (minions-mode +1))

(use-package delsel
  :straight t
  :config
  (delete-selection-mode +1))

(use-package tempel-collection
  :straight t
  :after tempel)

(use-package undo-fu
  :straight t
  :config
  (with-eval-after-load 'evil
    (setq evil-undo-system 'undo-fu)))

(use-package undo-fu-session
  :straight t
  :config
  (undo-fu-session-global-mode +1))

(use-package lin
  :init
  (global-hl-line-mode t)
  (setq lin-face 'lin-red)
  (lin-global-mode +1))

(use-package aggressive-indent
  :straight t
  :hook (emacs-lisp-mode . aggressive-indent-mode))

(use-package dashboard
  :straight t
  :config
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))

(use-package breadcrumb
  :straight (:host github :repo "joaotavora/breadcrumb")
  :config
  (breadcrumb-mode +1))

(use-package consult-eglot
  :straight t
  :after eglot
  :bind (:map eglot-mode-map
              ("C-c y" . consult-eglot-symbols)))

(use-package symbol-overlay
  :straight t
  :hook (prog-mode . symbol-overlay-mode))

(use-package highlight-defined
  :straight t
  :hook (emacs-list-mode . highlight-defined-mode))

(use-package highlight-quoted
  :straight t
  :hook (emacs-lisp-mode . highlight-quoted-mode))

(use-package web-beautify
  :straight t
  :defer t)

(use-package rust-mode
  :straight t
  :hook (rust-mode . (lambda ()
                       (setq-local tab-width 4))))

(use-package cargo
  :straight t
  :hook (rust-mode . cargo-minor-mode))

(use-package plantuml-mode
  :straight t)

(use-package ssh-config-mode
  :straight t)

(use-package emacs
  :delight
  :init
  (set-locale-environment "en_US.UTF-8")
  (prefer-coding-system 'utf-8-unix)
  (setq set-file-name-coding-system 'utf-8-unix)
  (setq set-keyboard-coding-system 'utf-8-unix)
  (setq set-terminal-coding-system 'utf-8-unix)
  (setq default-buffer-file-coding-system 'utf-8-unix)
  (setq set-default-coding-systems 'utf-8-unix)
  (setq set-selection-coding-system 'utf-8-unix)
  (setq set-buffer-file-coding-system 'utf-8-unix)
  (column-number-mode t)
  ;; (global-linum-mode t)
  ;; (setq linum-format "%5d ")
  ;; (line-number-mode t)

  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)

  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode 0)
  (setq electric-pair-pairs '(
                              (?\{ . ?\})
                              (?\( . ?\))
                              (?\[ . ?\])
                              (?\" . ?\")
                              ))
  (electric-pair-mode 1)
  (setq inhibit-startup-screen t)
  (setq inhibit-startup-message t)
  (setq initial-scratch-message "")
  (setq delete-auto-save-files t)
  (setq backup-inhibited t)
  (fset 'yes-or-no-p 'y-or-n-p)

  (set-frame-parameter (window-frame) 'cursor-type 'box)

  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq mac-control-modifier 'control))

  (if window-system (progn
                      (let* ((size 10)
                             (asciifont "UDEV Gothic 35NF")
                             (jpfont "UDEV Gothic 35NF")
                             (h (* size 10))
                             (fontspec (font-spec :family asciifont))
                             (jp-fontspec (font-spec :family jpfont)))
                        (set-face-attribute 'default nil :family asciifont :height h)
                        (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
                        (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
                        (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
                        (set-fontset-font nil '(#x0080 . #x024F) fontspec)
                        (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
                      ))

  (setq backup-directory-alist '((".*" . "~/.ehist")))

  (global-unset-key (kbd "C-x C-z"))

  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
  (define-key global-map "\M-?" 'help-for-help)

  (setq completion-ignore-case t)
  (global-auto-revert-mode 1)

  (defun other-window-or-split ()
    (interactive)
    (when (one-window-p)
      (split-window-horizontally))
    (other-window 1))
  (global-set-key (kbd "C-\'") 'other-window-or-split)

  (setq x-select-enable-clipboard t)

  (msb-mode 1)

  (setq scroll-preserve-screen-position t)

  (setq gc-cons-threshold (* 10 gc-cons-threshold))

  (setq enable-recursive-minibuffers t)

  (setq echo-keystrokes 0.1)

  (setq large-file-warning-threshold (* 25 1024 1024))

  (setq completion-ignored-extensions
        (append completion-ignored-extensions
                '(".exe" ".aux" ".log" ".dvi" ".pef")))

  (setq diff-default-read-only t)

  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  (setq ediff-split-window-function 'split-window-Horizontally)

  (ffap-bindings)

  (setq kinsoku-limit 4)

  (setq system-time-locale "C")

  (setq eval-expression-print-length nil)
  (setq eval-expression-print-level nil)

  (setq visible-bell t)
  (setq w32-visible-bell-type 'x)

  (setq confirm-kill-emacs 'y-or-n-p)

  (savehist-mode 1)

  (setq history-length 3000)

  (setq-default line-spacing 0)

  (setq scroll-conservatively 35
        scroll-margin 0
        scroll-step 1)
  (setq comint-scroll-show-maximum-output t)

  (setq desktop-globals-to-save '(extended-command-history))
  (setq desktop-files-not-to-save "")
  (desktop-save-mode 1)

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

  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally)

  (defun show-file-name ()
    "Show the full path file name in the minibuffer."
    (interactive)
    (message (buffer-file-name)))

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

  (setq scroll-conservatively 1000)
  (setq scroll-step 1)
  (setq scroll-margin 5)

  (global-set-key (kbd "<f11>") 'bs-cycle-previous)
  (global-set-key (kbd "<C-f11>") 'bs-cycle-next)
  (setq bs-cycle-configuration-name "files-and-scratch")

  (display-battery-mode t)

  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)
  (setq indent-line-function 'insert-tab)

  (setq isearch-case-fold-search t)

  (setq create-lockfiles nil)
  (setq make-backup-files nil)

  (display-time)
  (setq display-time-string-forms
        '((format "[%s/%s/%s(%s) %s:%s]" year month day dayname 24-hours minutes)))
  (setq display-time-kawakami-form t)
  (setq display-time-24hr-format t)

  (global-visual-line-mode)

  (setq frame-title-format
        (format "%%f - Emacs@%s" (system-name)))

  (which-function-mode t)

  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
          (cdr args)))

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (global-unset-key (kbd "C-c C-c"))

  (setq use-default-font-for-symbols nil)

  (if (eq window-system 'ns)
      (progn
        (setq ns-alternate-modifier (quote super))
        (setq ns-command-modifier (quote meta))))

  (defun ab/enable-line-numbers ()
    "Enable relative line numbers"
    (interactive)
    (display-line-numbers-mode)
    (setq display-line-numbers 'relative))
  (add-hook 'prog-mode-hook #'ab/enable-line-numbers)

  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (setq enable-recursive-minibuffers t)

  (global-prettify-symbols-mode t)

  (setq indicate-empty-lines t)

  (add-hook 'focus-in-hook
            '(lambda ()
               (when (fboundp 'mac-change-language-to-us)
                 (mac-change-language-to-us))
               (when (fboundp 'mac-auto-ascii-setup-input-source)
                 (mac-auto-ascii-setup-input-source))
               ))

  (if window-system
      (defun xsel-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xcel" nil 0 nil "--clipbord" "--input")))
    (defun xsel-paste-function()
      (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
        (unless (string= (car kill-ring) xsel-output)
          xsel-output)))
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function))

  )
(provide 'init)
