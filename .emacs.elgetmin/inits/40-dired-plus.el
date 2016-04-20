(use-package dired+)

;; ファイル名をまとめて編集可能なWDiredモードに入る
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)

(add-hook 'dired-load-hook
          '(lambda ()
             ;; ディレクトリを再帰的にコピー可能にする
             (setq dired-recursive-copies 'always)
             ;; ディレクトリを再帰的に対象の最上位ディレクトリごとに確認
             (setq dired-recursive-deletes 'top)
             )
          )
