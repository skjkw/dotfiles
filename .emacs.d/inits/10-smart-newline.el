;;; http://ainame.hateblo.jp/entry/2013/12/08/162032
(use-package smart-newline
    :config
    (add-hook 'ruby-mode-hook
        (lambda ()
        (smart-newline-mode t)))
    (add-hook 'php-mode-hook
        (lambda ()
        (smart-newline-mode t)))
    )

