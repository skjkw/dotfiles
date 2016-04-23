(use-package php-mode
  :config
  (setq php-serch-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/")
  (use-package php-auto-yasnippets
    :config
    (setq php-auto-yasnippet-php-program (format "%s/php-auto-yasnippets/Create-PHP-YASnippet.php" el-get-dir))
    )
  )

(defun php-indent-hook ()
  (yas-global-mode 1)
  (define-key php-mode-map (kbd "C-c C-f") 'php-search-documentation)
  (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
  (payas/ac-setup)

  ;; flycheck
  (use-package flycheck
    :config
    (flycheck-mode t)
    )

  (use-package ac-php
    :config
    (setq ac-sources '(ac-source-filename
                       ac-source-functions
                       ac-source-variables
                       ac-source-symbols
                       ac-source-abbrev
                       ac-source-words-in-same-mode-buffers
                       ac-source-dictionary
                       ac-source-php))
    (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point) ;goto define
    (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
    )

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'eldoc-mode)
(add-hook 'php-mode-hook 'php-indent-hook)
