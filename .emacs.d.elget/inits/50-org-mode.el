(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-hide-leading-stars t)

(setq org-startup-truncated nil)

(setq org-startup-folded nil)

(setq org-return-follows-link t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(transient-mark-mode 1)
