(require 'fiplr)

(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(global-set-key (kbd "C-c C-f") 'fiplr-find-file)
(global-set-key (kbd "C-c C-d") 'fiplr-find-directory)
