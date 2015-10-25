(require 'sql)

;; starting SQL mode loading sql-indent / sql-complete
(eval-after-load "sql"
  '(load-library "sql-indent"))

(sql-set-product "postgres")
(setq sql-indent-offset 4)
