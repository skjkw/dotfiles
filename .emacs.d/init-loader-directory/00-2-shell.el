;; より下に記述した物が PATH の先頭に追加されます
;; (dolist (dir (list
;;               "/sbin"
;;               "/usr/sbin"
;;               "/bin"
;;               "/usr/bin"
;;               "/opt/local/bin"
;;               "/sw/bin"
;;               "/usr/local/bin"
;;               ))
 ;; PATH と exec-path に同じ物を追加します
;;  (when (and (file-exists-p dir) (not (member dir exec-path)))
;;    (setenv "PATH" (concat dir ":" (getenv "PATH")))
;;    (setq exec-path (append (list dir) exec-path))))

;; (setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))

;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "f_zsh")
      (executable-find "zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      (executable-find "bash")
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

;; Emacs が保持する terminfo を利用する
(setq system-uses-terminfo nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ;; (global-set-key (kbd "C-c t") '(lambda ()
;; ;;                                 (interactive)
;; ;;                                 (term shell-file-name)))

;; Shell Mode
(setq shell-mode-hook
      (function (lambda()
                  (set-buffer-process-coding-system 'utf-8-unix
                                                    'utf-8-unix))))
