;;sdic
(add-to-list 'load-path "~/.emacs.d/plugins/sdic/")
;;(add-to-list 'load-path "~/.emacs.d/etc/dict/")

(autoload 'sdic-describe-word
  "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)
;; (setq sdic-eiwa-dictionary-list
;;       ;;英和検索で使用する辞書
;;       '( (sdicf-client "/usr/local/share/dict/gene.sdic"))
;;       ;; 和英検索で使用する辞書
;;       sdic-waei-dictionary-list
;;       '((sdicf-client "/usr/local/share/dict/jedict.sdic")))
;; 文字色
(setq sdic-face-color "pink")
