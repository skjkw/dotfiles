(use-package ggtags
  :config
  ;; use helm
  (setq ggtags-completing-read-function nil)
  ;; use eldoc
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (add-hook 'php-mode-hook
            (lambda ()
              (when (derived-mode-p 'php-mode)
                (ggtags-mode 1))))
  )
