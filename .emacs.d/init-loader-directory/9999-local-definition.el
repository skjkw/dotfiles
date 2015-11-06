;;; 基本設定
(setq migemo-command "c:/kajikawa/dotfiles/cmigemo-win64/cmigemo.exe")

;;; migemo-dict のパスを指定
(setq migemo-dictionary "c:/kajikawa/dotfiles/cmigemo-win64/dict/utf-8/migemo-dict")

(when window-system
  (set-face-attribute 'default nil
                    :family "Ricty"
                    :height 135)
  (set-fontset-font
    nil 'japanese-jisx0208
    (font-spec :family "Ricty"))
  (tool-bar-mode 0)
 (toggle-scroll-bar nil))
