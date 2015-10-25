(require 'multi-term)

(add-hook 'term-mode-hook
          '(lambda ()
             ;; C-h を term 内文字削除にする
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             ;; C-y を term 内ペーストにする
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             ))

(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (multi-term)))

(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)
