(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(let ((versioned-dir (locate-user-emacs-file emacs-version)))
  (setq el-get-dir (expand-file-name "el-get" versioned-dir)
	        package-user-dir (expand-file-name "elpa" versioned-dir)))

(add-to-list 'load-path (expand-file-name (format "%s/el-get" el-get-dir)))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; ------------------------------
;; Packages
;; ------------------------------
(el-get-bundle! use-package)
(el-get-bundle! with-eval-after-load-feature in tarao/with-eval-after-load-feature-el)
(el-get-bundle! auto-install)
(el-get-bundle dired+)
(el-get-bundle auto-complete)
(el-get-bundle color-theme)
(el-get-bundle helm)
(el-get-bundle js2-mode)
(el-get-bundle monokai-theme)
(el-get-bundle open-junk-file)
(el-get-bundle suzuki/php-completion :branch "develop")
(el-get-bundle php-eldoc)
(el-get-bundle php-mode)
(el-get-bundle php-auto-yasnippets)
(el-get-bundle rainbow-delimiters)
(el-get-bundle recentf-ext)
(el-get-bundle undo-tree)
(el-get-bundle web-mode)
(el-get-bundle yasnippet)
(el-get-bundle paredit)
(el-get-bundle ace-link)
(el-get-bundle elscreen)
(el-get-bundle init-loader)
(el-get-bundle which-key)
(el-get-bundle skk in ddskk)
(el-get-bundle evil)
(el-get-bundle evil-elscreen)
(el-get-bundle foreign-regexp)

(use-package init-loader
  :config
  (with-eval-after-load-feature 'init-loader
    (setq init-loader-show-log-after-init 'error-only)
    (setq init-loader-byte-compile t)
    (init-loader-load "~/.emacs.d/inits"))
  )
