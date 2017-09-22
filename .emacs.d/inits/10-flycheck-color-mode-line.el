;;;; flycheck における色設定

(use-package flycheck-color-mode-line
  :config
  (eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

  ;;; モードラインのフェイス変更
  (set-face-foreground 'flycheck-color-mode-line-error-face "red")
  (set-face-foreground 'flycheck-color-mode-line-warning-face "yellow")
  )
