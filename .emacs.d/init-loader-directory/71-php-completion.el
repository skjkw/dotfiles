;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-x C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
            (make-local-variable 'ac-sources)))
