(setq sql-postgres-login-params
      '((user :default "sw2_user")
        (password :default "sw2_pwd")
        (database :default "sw2_kajikawa")
        (server :default "192.168.24.130")
        (port :default 5432)))

(setq sql-connection-alist
      '((server1 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "192.168.24.130")
                  (sql-user "sw2_user")
                  (sql-password "sw2_pwd")
                  (sql-database "sw2_kajikawa"))
        (server2 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db2"))))

(defun my-sql-server1 ()
  (interactive)
  (my-sql-connect 'postgres 'server1))

(defun my-sql-server2 ()
  (interactive)
  (my-sql-connect 'postgres 'server2))

(defun my-sql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))
