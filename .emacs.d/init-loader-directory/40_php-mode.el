(when (require 'php-mode nil t)
  (setq php-serch-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/"))

(defun php-indent-hook ()
  ;; (php-enable-psr2-coding-style)
  ;; (gtags-mode)
  ;; (php-eldoc-enable)
  ;; (require 'ac-php)
  ;; (setq ac-sources  '(ac-source-php ) )
  (yas-global-mode 1)
  (define-key php-mode-map (kbd "C-c C-c C-f") 'php-search-documentation)
  (define-key php-mode-map (kbd "C-c C-f") 'fiplr-find-file)
  (define-key php-mode-map (kbd "C-c C-d") 'fiplr-find-directory)
  (define-key php-mode-map (kbd"C-c r") 'vr/replace)
  (define-key php-mode-map (kbd"C-c q") 'vr/query-replace)
  (define-key php-mode-map (kbd"C-c e") 'vr/mc-mark)
  (define-key php-mode-map (kbd "C-c ]") 'ac-php-find-symbol-at-point)   ;goto define
  (define-key php-mode-map (kbd "C-c t") 'ac-php-location-stack-back   ) ;go back

  ;; flycheck
  (flycheck-mode t)

  ;; php-mode で削除されるので再定義
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'php-mode-hook 'php-indent-hook)

(when (require 'php-extras nil t))
