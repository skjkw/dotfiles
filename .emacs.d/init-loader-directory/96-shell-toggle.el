(require 'shell-toggle)
;; eshell をつかう.
(setq shell-toggle-launch-shell 'shell-toggle-eshell)

;; フルスクリーンで切り替え
(setq shell-toggle-full-screen-window-only t)

(global-set-key [M-f1] 'shell-toggle)
(global-set-key [C-f1] 'shell-toggle-cd)
