(use-package sql)

;; starting SQL mode loading sql-indent / sql-complete
(eval-after-load "sql"
  '(progn
     (load-library "sql-indent")
     (load-library "sql-complete")
     (load-library "sql-transform")))

(sql-set-product "postgres")
(setq sql-indent-offset 4)
(setq sql-database "postgres")
