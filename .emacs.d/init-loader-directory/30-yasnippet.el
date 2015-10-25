(require 'yasnippet)
(yas-global-mode 1)

(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/.emacs.d/site-lisp/Create-PHP-YASnippet.php")
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

(require 'angular-snippets)
