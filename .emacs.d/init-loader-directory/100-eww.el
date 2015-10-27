(require 'eww)
(defvar eww-data)
(defun eww-current-url ()
  "バージョン間の非互換を吸収する。"
  (if (boundp 'eww-current-url)
      eww-current-url                   ;emacs24.4
    (plist-get eww-data :url)))         ;emacs25

(defun eww-set-start-at (url-regexp search-regexp)
  "URL-REGEXPにマッチするURLにて、SEARCH-REGEXPの行から表示させる"
  (when (string-match url-regexp (eww-current-url))
    (goto-char (point-min))
    (when (re-search-forward search-regexp nil t)
      (recenter 0))))

(defun region-or-read-string (prompt &optional initial history default inherit)
  "regionが指定されているときはその文字列を取得し、それ以外では`read-string'を呼ぶ。"
  (if (not (region-active-p))
      (read-string prompt initial history default inherit)
    (prog1
        (buffer-substring-no-properties (region-beginning) (region-end))
      (deactivate-mark)
      (message ""))))

(defun eww-render--after (&rest _)
  (eww-set-start-at "ejje.weblio.jp" "^ *Weblio 辞書")
  (eww-set-start-at "eow.alc.co.jp" "^ *英辞郎on the WEB")
  ;; 他のサイトの設定も同様に追加できる
  )
(advice-add 'eww-render :after 'eww-render--after)

;;; weblio
(defun weblio (str)
  (interactive (list
                (region-or-read-string "Weblio: ")))
  (eww-browse-url (format "http://ejje.weblio.jp/content/%s"
                      (upcase (url-hexify-string str)))))
;;; wikipedia
(defun wikipedia (str)
  (interactive (list
                (region-or-read-string "Wikipedia: ")))
  (eww-browse-url (format "http://ja.wikipedia.org/wiki/%s"
                          (upcase (url-hexify-string str)))))

;;; 英辞郎 on the WEB
(defun eijiro (str)
  (interactive (list
                (region-or-read-string "英辞郎: ")))
  (eww-browse-url (format "http://eow.alc.co.jp/search?q=%s&ref=sa"
                      (upcase (url-hexify-string str)))))


(global-set-key (kbd "C-c C-c w") 'weblio)
(global-set-key (kbd "C-c C-c e") 'eijiro)