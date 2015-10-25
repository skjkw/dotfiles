(require 'guide-key)
;;; guilde-keyを発動させるプレフィクスキー
(setq guide-key/guide-key-sequence
      '("C-x r" "C-x 4" "C-c p" "C-x v" ;global
        ;; org-modeではC-c C-xも対象にする
        (org-mode "C-c C-x")
        ;; outline-minor-modeではC-c @も対象にする
        (outline-minor-mode "C-c @")))
(defun guide-key/my-hook-function-for-org-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-x")
  (guide-key/add-local-highlight-command-regexp "org-"))
(add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

;;; コマンド名にこれらが含まれている場合はハイライトされる
(setq guide-key/highlight-command-regexp "rectangle\\|register\\|org-clock")
;;; 1秒後にポップアップされる(デフォルト)
;;; つまり1秒以内に操作すればポップアップされずに実行される
(setq guide-key/idle-delay 1.0)
;;; 下部にキー一覧を表示させる(デフォルトはright)
(setq guide-key/popup-window-position 'bottom)
;;; 文字の大きさを変更する(正の数で大きく、負の数で小さく)
;; (setq guide-key/text-scale-amount -2)
;;; 有効にする
(guide-key-mode 1)

;; (require 'guide-key-tip)
;; (setq guide-key-tip/enabled t)
