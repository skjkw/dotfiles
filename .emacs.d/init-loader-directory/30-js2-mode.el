;;; JavaScript 用の設定

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(defun js2-mode-hooks()
   (tern-mode t)
   (eval-after-load 'tern
     '(progn
        (require 'auto-complete)
        (auto-complete-mode t)
        (require 'tern-auto-complete)
        (tern-ac-setup))))

(add-hook 'js2-mode-hook 'js2-mode-hooks)
(add-hook 'js2-mode-hook 'helm-gtags-mode)
