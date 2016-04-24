(use-package neotree
  :config
  (setq neo-theme 'ascii)
  (global-set-key [f8] 'neotree-toggle)
  ;; 隠しファイルをデフォルトで表示
  (setq neo-show-hidden-files t)

  ;; NEOTREE でファイルを新規作成した後、自動的にファイルを開く
  (setq neo-create-file-auto-open t)
  )
