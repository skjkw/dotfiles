(require 'helm-config)
(require 'helm)
(helm-mode +1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-o") 'helm-resume)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x f") 'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "C-x C-b")   'helm-bookmarks)
(define-key global-map (kbd "C-x C-d")   'helm-descbinds)
(define-key helm-find-files-map (kbd "C-") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "C-TAB") 'helm-execute-persistent-action)

;;; Enable helm-gtags-mode
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'php-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "C-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-g s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "M-g b") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "M-g f") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-pop-stack)))

(setq helm-buffer-max-length 50)

