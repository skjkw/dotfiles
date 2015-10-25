;; dired-filter.elが依存している
(require 'cl-lib)
(require 'dired-filter)

;; dired-modeでonにする
(defun dired-mode-hooks()
    (dired-filter-mode))
(add-hook 'dired-mode-hook 'dired-mode-hooks)
