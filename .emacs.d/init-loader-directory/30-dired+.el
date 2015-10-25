(require 'dired+)

;; diredでWindowsに関連付けられたアプリを起動する
(defun uenox-dired-winstart ()
"Type '[uenox-dired-winstart]': win-start the current line's file."
(interactive)
(if (eq major-mode 'dired-mode)
(let ((fname (dired-get-filename)))
(w32-shell-execute "open" fname)
(message "win-started %s" fname))))
;;; dired のｷｰ割り当て追加
(add-hook 'dired-mode-hook
(lambda ()
  (define-key dired-mode-map "z" 'uenox-dired-winstart))) ;; キーバインド

;; ファイルを other window にコピー
(defun dired-copy-to-other-window (arg)
  "In dired, copy selected file(s) to the other window."
  (interactive "P")
  (let ((dired-dwim-target t))
    (dired-do-copy arg)))

;; ファイルを other window に移動
(defun dired-move-to-other-window (arg)
  "In dired, rename selected file(s) to the other window."
  (interactive "P")
  (let ((dired-dwim-target t))
    (dired-do-rename arg)))

(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
(define-key dired-mode-map "c" 'dired-ranger-copy)
(define-key dired-mode-map "p" 'dired-ranger-paste)
(define-key dired-mode-map "m" 'dired-ranger-move)

;; (require 'ls-lisp)

;; ls-lisp を使う
(setq ls-lisp-use-insert-directory-program nil)

;; dired の並び順を explorer と同じにする
(setq ls-lisp-ignore-case t)         ; ファイル名の大文字小文字無視でソート
(setq ls-lisp-dirs-first t)          ; ディレクトリとファイルを分けて表示
(setq dired-listing-switches "-alG") ; グループ表示なし

;; OSタイプ を調べる
(defun os-type ()
  (let ((os-type (shell-command-to-string "uname")))
    (cond ((string-match "CYGWIN" os-type)
           "win")
          ((string-match "Linux" os-type)
           "linux")
          ((string-match "Darwin" os-type)
           "mac"))))

;; OS でファイル、ディレクトリ、URL を直接開くためのコマンドを決定する
(defun os-open-command-name ()
  (let ((os-type (os-type)))
    (if os-type
        (let ((command-name-list
               (cond ((string= "win" os-type)
                      '("cygstart"))
                     ((string= "linux" os-type)
                      '("xdg-open" "gnome-open"))
                     ((string= "mac" os-type)
                      '("open")))))
          (catch 'loop
            (dolist (command-name command-name-list)
              (unless (string=  (shell-command-to-string
                                 (concat "which " command-name " 2> /dev/null"))
                                "")
                (throw 'loop command-name))))))))

;; OS で直接、ファイル、ディレクトリ、URL を開く
(defun os-open-command (filename)
  (interactive)
  (let* ((default-directory (if (file-regular-p filename)
                                (file-name-directory filename)
                              default-directory))
         (localname (if (file-remote-p filename)
                        (tramp-file-name-localname
                         (tramp-dissect-file-name filename))
                      filename))
         (os-open-command-name (os-open-command-name)))
    (when os-open-command-name
      (cond ((and (string= os-open-command-name "xdg-open")
                  (not (file-remote-p default-directory)))
             ;; 以下の URL の対策を行う
             ;; http://d.hatena.ne.jp/mooz/20100915/p1
             ;; http://i-yt.info/?date=20090829#p01
             (let (process-connection-type)
               (start-process "os-open-command" nil os-open-command-name localname)))
            (t
             ;; リモートでもコマンドを実行できるように、start-process ではなく shell-command系を使う
             (shell-command-to-string (concat os-open-command-name " "
                                              (shell-quote-argument localname) " &"))))
      (message "%s" (concat os-open-command-name " " localname)))))

;; dired で W 押下時に、カーソル位置のファイルを OS で直接起動する
(define-key dired-mode-map (kbd "W")
  (lambda ()
    (interactive)
    (let ((file (dired-get-filename nil t)))
      (recentf-push file) ; recentf に追加する
      (os-open-command file))))

;; dired で E 押下時に、開いているディレクトリを OS で直接開く
(define-key dired-mode-map (kbd "R")
  (lambda ()
    (interactive)
    (os-open-command (dired-current-directory))))

;; OS で起動したいファイルの拡張子一覧
(setq os-open-file-suffixes '("doc" "docx"
                              "xls" "xlsx"
                              "ppt" "pptx"
                              "mdb" "mdbx"
                              "vsd" "vdx" "vsdx"
                              "mpp"
                              "pdf"
                              "bmp" "jpg" "png"
                              "odt" "ott"
                              "odg" "otg"
                              "odp" "otp"
                              "ods" "ots"
                              "odf"
                              ))

;; OS で直接開きたいファイルかどうかを判定する
(defun os-open-file-p (file)
  (if (file-regular-p file)
      (let ((ext (file-name-extension file)))
        (if (and ext
                 (member (downcase ext) os-open-file-suffixes)
                 (os-open-command-name))
            t))))

;; dired でファイルを f で開く際に os-open-file-suffixes リストに指定してあるサフィックスのファイルは、
;; OS で直接起動する
(defadvice find-file (around ad-find-file-os-open-command-setup activate)
  (let ((file (ad-get-arg 0)))
    (cond ((os-open-file-p file)
           (recentf-push file) ; recentf に追加する
           (os-open-command file))
          (t
           ad-do-it))))
