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
  (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
  (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
  (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
  (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
  (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
  (define-key ggtags-mode-map (kbd "C-c g m") 'ggtags-find-tag-dwim)
  )
