(require 'smartparens-config)
(smartparens-global-mode t)
(ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
(ad-activate 'delete-backward-char)
