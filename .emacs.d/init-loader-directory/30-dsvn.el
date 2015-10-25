(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

(eval-after-load "dsvn"
  '(progn
  (define-key svn-status-mode-map "!" 'svn-update-current)
  ;; キーコンフィグ

  ;; 異なる文字コードのソースもちゃんと閲覧できるようにする
  (defadvice svn-output-filter (before my-svn-output-filter activate)
    "dsvnからのsvn出力を加工する"
    (let ((coding default-buffer-file-coding-system))
      (setq str (decode-coding-string (encode-coding-string str coding) coding))
      (setq str (replace-regexp-in-string "" "" str))))))
