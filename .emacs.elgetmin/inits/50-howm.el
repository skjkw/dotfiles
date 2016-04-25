(require 'howm-mode)
;; org-mode
(add-hook 'org-mode-hook 'howm-mode)
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(global-unset-key (kbd "C-x ,"))
(setq howm-prefix (kbd "C-x ,"))
(eval-after-load "howm-mode"
  '(progn
    (define-key howm-mode-map (kbd "C-c C-c") nil)))
(setq howm-use-color nil)

;; howm
(setq howm-menu-lang 'ja)
(setq howm-file-name-format "%Y/%m/%d/%Y%m%d-%H%M%S.howm")
(global-set-key "\C-x,," 'howm-menu)
(setq howm-home-directory "~/howm/")
(setq howm-keyword-file (concat howm-home-directory ".howm-keys"))
(setq howm-menu-file (concat howm-home-directory "menu.txt"))
(setq howm-history-file (concat howm-home-directory ".howm-history"))
