(use-package projectile
  :ensure projectile)
(projectile-global-mode)

;;; ファイル選択に helm を使用する
(setq projectile-completion-system 'helm)

(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
