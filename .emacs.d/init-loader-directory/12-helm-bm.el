;;; bm.el初期設定
(setq-default bm-buffer-persistence nil)
(require 'bm)
;; マークのセーブ
(setq-default bm-buffer-persistence t)
;; セーブファイル名の設定
(setq bm-repository-file "~/.emacs.d/.bm-repository")
;; 起動時に設定のロード
;; 設定ファイルのセーブ
(setq bm-restore-repository-on-load t)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

;;; helm-bm.el設定
(require 'helm-bm)
;; migemoくらいつけようね
(push '(migemo) helm-source-bm)
;; annotationはあまり使わないので仕切り線で表示件数減るの嫌
(setq helm-source-bm (delete '(multiline) helm-source-bm))

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "<f10>") 'bm-toggle-or-helm)

;;; これがないとemacs -Qでエラーになる。おそらくバグ。
(require 'compile)
