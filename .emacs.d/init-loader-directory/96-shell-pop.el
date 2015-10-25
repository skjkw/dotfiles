(require 'shell-pop)

(custom-set-variables
 '(shell-pop-default-directory "~/")
 ;; '(shell-pop-shell-type (quote ("eshell" "*eshell*"
 ;; (lambda nil (eshell shell-pop-term-shell)))))
 ''(shell-pop-universal-key "C-M-t")
 '(shell-pop-window-height 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))

(setq shell-pop-shell-type '("ansi-term" "*ansi-term*" (lambda () (ansi-term shell-pop-term-shell))))
