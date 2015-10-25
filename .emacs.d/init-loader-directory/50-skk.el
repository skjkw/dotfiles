
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
;;; (setq skk-sticky-key ";")

(setq skk-large-jisyo "~/.emacs.d/skk/SKK-JISYO.L")
(setq skk-jisyo "~/.emacs.d/skk/jisyo")
(setq skk-record-file "~/.emacs.d/skk/record")

(setq skk-japanese-message-and-error nil)
(setq skk-show-japanese-menu nil)
(setq skk-show-annotation nil)
(setq skk-status-indicator 'left)

; 動的自動補完機能
(setq skk-dcomp-activate t)

; 閉じ括弧の自動入力
(setq skk-auto-insert-paren t)

; 見出し語と送り仮名がマッチした候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
(setq skk-hint-start-char 58)

(setq skk-show-annotation t)

(setq skk-show-candidates-always-pop-to-buffer t)
(setq skk-henkan-show-candidates-rows 2)

(setq skk-dcomp-multiple-activate t)
(setq skk-dcomp-multiple-rows 10)
;; 動的補完の複数表示群のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-face "Black")
;; (set-face-background 'skk-dcomp-multiple-face "LightGoldenrodYellow")
;; (set-face-background 'skk-dcomp-multiple-face "")
;; (set-face-bold-p 'skk-dcomp-multiple-face nil)
;; 動的補完の複数表示郡の補完部分のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-trailing-face "red")
;; (set-face-bold-p 'skk-dcomp-multiple-trailing-face nil)
;; 動的補完の複数表示郡の選択対象のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-selected-face "White")
;; (set-face-background 'skk-dcomp-multiple-selected-face "Black")
;; (set-face-bold-p 'skk-dcomp-multiple-selected-face nil)
;; 動的補完時に下で次の補完へ
;; (define-key skk-j-mode-map (kbd "<down>") 'skk-completion-wrapper)

;; (setq skk-show-annotation t)  ; Annotation
;; (setq skk-annotation-show-wikipedia-url t) ; Annotation で Wikipedia を
;; (setq skk-use-look t)   ; 英語補完

(require 'skk-hint)
(add-hook 'skk-load-hook ; 自動的に入力モードを切り替え
      (lambda ()
        (require 'context-skk)))

;;; ひらがなとカタカナのトグル
(defun skk-j-mode-and-toggle-kana ()
  (interactive)
  (cond (skk-j-mode
         (skk-toggle-kana nil))
        (t
         (skk-j-mode-on))))
