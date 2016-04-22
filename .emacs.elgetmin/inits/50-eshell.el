(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun shk-eshell-prompt ()
  (let ((header-bg "#000"))
    (concat
     (with-face (concat (eshell/pwd) " ") :background header-bg)
     (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#888")
     (with-face
      (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
      :background header-bg)
     (with-face "\n" :background header-bg)
     (with-face user-login-name :foreground "blue")
     "@"
     (with-face "localhost" :foreground "green")
     (if (= (user-uid) 0)
         (with-face " #" :foreground "red")
       " $")
     " ")))
(setq eshell-prompt-function 'shk-eshell-prompt)
(setq eshell-highlight-prompt nil)

(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\t" 'pcomplete-list)))

(setq eshell-cmpl-cycle-completions nil)

;; eshell での補完に auto-complete.el を使う
(use-package pcomplete)
(add-to-list 'ac-modes 'eshell-mode)
(ac-define-source pcomplete
  '((candidates . pcomplete-completions)))
(defun my-ac-eshell-mode ()
  (setq ac-sources
        '(ac-source-pcomplete
          ac-source-filename
          ac-source-files-in-current-dir
          ac-source-words-in-buffer
          ac-source-dictionary)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (my-ac-eshell-mode)
            (define-key eshell-mode-map (kbd "C-i") 'auto-complete)
            (define-key eshell-mode-map [(tab)] 'auto-complete)))

;; helm で履歴から入力
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                (kbd "M-p")
                'helm-eshell-history)))

;; helm で補完
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                (kbd "M-n")
                'helm-esh-pcomplete)))

;; eshell
;; (eshell-ls-executable ((t (:background ,"#色" :foreground ,"#色"))))
;; (eshell-prompt ((t (:background ,"#色" :foreground ,"#色"))))

;; eshell/bmk - version 0.1.3

(defun pcomplete/eshell-mode/bmk ()
  "Completion for `bmk'"
  (pcomplete-here (bookmark-all-names)))

(defun eshell/bmk (&rest args)
  "Integration between EShell and bookmarks.
For usage, execute without arguments."
  (setq args (eshell-flatten-list args))
  (let ((bookmark (car args))
        filename name)
    (cond
     ((eq nil args)
      (format "Usage:
* bmk BOOKMARK to
** either change directory pointed to by BOOKMARK
** or bookmark-jump to the BOOKMARK if it is not a directory.
* bmk . BOOKMARK to bookmark current directory in BOOKMARK.
Completion is available."))
     ((string= "." bookmark)
      ;; Store current path in EShell as a bookmark
      (if (setq name (car (cdr args)))
          (progn
            (bookmark-set name)
            (bookmark-set-filename name (eshell/pwd))
            (format "Saved current directory in bookmark %s" name))
        (error "You must enter a bookmark name")))
     (t
      ;; Check whether an existing bookmark has been specified
      (if (setq filename (bookmark-get-filename bookmark))
          ;; If it points to a directory, change to it.
          (if (file-directory-p filename)
              (eshell/cd filename)
            ;; otherwise, just jump to the bookmark
            (bookmark-jump bookmark))
        (error "%s is not a bookmark" bookmark))))))

;; written by Stefan Reichoer <reichoer@web.de>
(defun eshell/less (&rest args)
   "Invoke `view-file' on the file.
\"less +42 foo\" also goes to line 42 in the buffer."
   (while args
     (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
         (let* ((line (string-to-number (match-string 1 (pop args))))
                (file (pop args)))
           (view-file file)
           (goto-line line))
       (view-file (pop args)))))

(setq eshell-command-aliases-list
      (append
       (list
        (list "ll" "ls -ltr")
        (list "la" "ls -a")
        (list "o" "xdg-open")
        (list "emacs" "find-file $1")
        (list "m" "find-file $1")
        (list "mc" "find-file $1")
        (list "d" "dired .")
        (list "l" "eshell/less $1"))))

(add-hook 'eshell-mode-hook
          '(lambda ()
             (progn
               (define-key eshell-mode-map "\C-a" 'eshell-bol)
               (define-key eshell-mode-map "\C-p" 'eshell-previous-matching-input-from-input)
               (define-key eshell-mode-map "\C-n" 'eshell-next-matching-input-from-input)
               )
             ))

(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(setq eshell-visual-commands
  '("vi"                                ; what is going on??
    "screen" "top"                      ; ok, a valid program...
    "less" "more"                       ; M-x view-file
    "lynx" "ncftp"                      ; w3.el, ange-ftp
    "pine" "tin" "trn" "elm")           ; GNUS!!
   )
