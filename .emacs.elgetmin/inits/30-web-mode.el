(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-engines-alist
        '(("php"    . "\\.php\\'")
          ))

  (setq web-mode-content-types-alist
        '(("php" . "/fuel/app/views/**/*\\.php\\'")))
  )

(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-hook 'web-mode-hook
          (lambda ()
            (tern-mode t)))

(use-package tern
  :config
  (eval-after-load 'tern
    '(progn
       (use-package tern-auto-complete)
       (tern-ac-setup)))
  )
