(use-package php-mode
  :config
  (setq php-serch-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/")
  (use-package php-extras)
  ; (use-package php-auto-yasnippets
  ;   :config
  ;   (setq php-auto-yasnippet-php-program (format "%s/php-auto-yasnippets/Create-PHP-YASnippet.php" el-get-dir))
  ;   )
  )

(defun php-indent-hook ()
  (yas-global-mode 1)
  (define-key php-mode-map (kbd "C-c C-c C-f") 'php-search-documentation)
  (define-key php-mode-map (kbd "C-c C-f") 'fiplr-find-file)
  (define-key php-mode-map (kbd "C-c C-d") 'fiplr-find-directory)
  (define-key php-mode-map (kbd "C-c r") 'vr/replace)
  (define-key php-mode-map (kbd "C-c q") 'vr/query-replace)
  (define-key php-mode-map (kbd "C-c e") 'vr/mc-mark)
  (define-key php-mode-map (kbd "C-c ]") 'ac-php-find-symbol-at-point) ;goto define
  (define-key php-mode-map (kbd "C-c t") 'ac-php-location-stack-back   ) ;go back
  (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
  (payas/ac-setup)

  ;; flycheck
  (flycheck-mode t)

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'eldoc-mode)
(add-hook 'php-mode-hook 'ggtags-mode)
(add-hook 'php-mode-hook 'php-indent-hook)
