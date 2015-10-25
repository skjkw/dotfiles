(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(defun magit-expand-git-file-name (filename &optional localname)
  (setq filename
        (if (file-name-absolute-p filename)
            (if localname
                filename
              (concat (file-remote-p default-directory) filename))
          (expand-file-name
           filename
           (and localname (file-remote-p default-directory 'localname)))))
  (if (and (memq system-type '(cygwin windows-nt)) ; #1318
           (string-match "^/\\(cygdrive/\\)?\\([a-z]\\)/\\(.*\\)" filename))
      (concat (match-string 2 filename) ":/"
              (match-string 3 filename))
    filename)
  )

;; (if (eq system-type 'windows-nt)
;;     (progn
;;       (setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/Git/cmd/git.exe"))
;;       (setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;" (getenv "PATH")))))

;; (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe")
(global-set-key "\C-cm" 'magit-status)
