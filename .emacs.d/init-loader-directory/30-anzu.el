(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
    :foreground "yellow" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))

;;; migemo を利用
(setq anzu-use-migemo t)
;;; これ以上マッチする語数を数え上げない
(setq anzu-search-threshold 300)
;;; この文字以上入力したときに数え上げを行う
(setq anzu-minimum-input-length 3)
