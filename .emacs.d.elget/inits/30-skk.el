(use-package skk
  :config
  (global-set-key (kbd "C-x C-j") 'skk-auto-fill-mode) ;良い感じに改行を自動入力してくれる機能
  (setq default-input-method "japanese-skk") ; emacs上での日本語入力にskkをつかう

  (setq skk-japanese-message-and-error nil)
  (setq skk-show-japanese-menu nil)
  (setq skk-show-annotation nil)
  (setq skk-status-indicator 'left)

  (setq skk-dcomp-activate t)           ; 動的自動補完機能
  (setq skk-auto-insert-paren t)        ; 閉じ括弧の自動入力
  (setq skk-henkan-strict-okuri-precedence t) ; 見出し語と送り仮名がマッチした候補を優先して表示
  (setq skk-hint-start-char 58)
  (setq skk-show-annotation t)
  (setq skk-show-candidates-always-pop-to-buffer t)
  (setq skk-henkan-show-candidates-rows 2)
  (setq skk-dcomp-multiple-activate t)
  (setq skk-dcomp-multiple-rows 10)

  (use-package skk-hint)
  (add-hook 'skk-load-hook              ; 自動的に入力モードを切り替え
            (lambda ()
              (use-package context-skk)))
  
  
  (use-package skk-study)
  )
