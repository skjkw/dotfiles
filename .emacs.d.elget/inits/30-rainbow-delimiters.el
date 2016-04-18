(use-package rainbow-delimiters)
(use-package cl-lib)
(use-package color)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
      (cl-callf color-saturate-name (face-foreground face) 30)))


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'php-mode-hook #'rainbow-delimiters-mode)
(add-hook 'js2-mode-hook #'rainbow-delimiters-mode)
