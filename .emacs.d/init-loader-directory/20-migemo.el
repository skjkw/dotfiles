(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

;;; 基本設定
;; (setq migemo-command "c:/kajikawa/dotfiles/cmigemo-win64/cmigemo.exe")

;;; migemo-dict のパスを指定
;; (setq migemo-dictionary "c:/kajikawa/dotfiles/cmigemo-win64/dict/utf-8/migemo-dict")
