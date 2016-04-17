(use-package magit)
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

(global-set-key "\C-cm" 'magit-status)
