(require 'term-run)

(defun term-run-alsamixer ()
  (interactive)
  (term-run-shell-command "alsamixer"))
