(use-package elscreen)
(global-set-key (kbd "M-z") nil)
;;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "M-z"))
(elscreen-start)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
