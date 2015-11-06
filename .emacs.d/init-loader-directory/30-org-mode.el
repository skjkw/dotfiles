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

;; capture templates
(setq org-capture-templates
      '(("p" "Project Task" entry (file+headline (expand-file-name "~/project/project.org") "Inbox")
             "** TODO %?\n    %i\n    %a\n    %T")
        ("m" "memo" entry (file (expand-file-name "~/memo.org"))
             "* %?\n    %i\n    %a\n    %T")))

;; agenda
(setq org-agenda-files (list (expand-file-name "~/project")))
