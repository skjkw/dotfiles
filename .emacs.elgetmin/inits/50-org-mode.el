(use-package org-install)
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

;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO" "WAIT" "SOMEDAY" "|" "DONE")))
;; [DONE]の時現在タイムスタンプが挿入される
(setq org-log-done 'time)

(use-package org-bullets
  :config
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("b" "Bug" entry (file+headline nil "Inbox")
         "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("m" "Meeting" entry (file+headline nil "Meeting")
         "** %?\n %U\n %a\n %i\n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ("i" "Idea" entry (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %t")))
(setq org-agenda-files (list org-default-notes-file ))
