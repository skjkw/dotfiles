(setq auto-mode-alist
  (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-level 4)
(setq cssm-indent-function 'cssm-c-style-indenter)
