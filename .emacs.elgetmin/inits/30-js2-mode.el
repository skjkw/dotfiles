(use-package js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(defun js2-mode-hooks()
  (tern-mode t)
  (eval-after-load 'tern
    '(progn
       (use-package auto-complete)
       (auto-complete-mode t)
       (use-package tern-auto-complete)
       (tern-ac-setup))))

(add-hook 'js2-mode-hook 'js2-mode-hooks)
(add-hook 'js2-mode-hook 'helm-gtags-mode)
