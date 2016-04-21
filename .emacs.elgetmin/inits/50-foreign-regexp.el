(use-package foreign-regexp)
(custom-set-variables
 '(foreign-regexp/regexp-type 'perl) ;; perlの正規表現を利用する
 '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.
