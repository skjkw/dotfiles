(require 'multiple-cursors)
(require 'mc-extras)
(require 'region-bindings-mode)

;; region-bindings-modeを発動させないメジャーモードを設定
;; (setq region-bindings-mode-disabled-modes '(foo-mode bar-mode))

(region-bindings-mode-enable)
(define-key region-bindings-mode-map (kbd "a") 'mc/mark-all-like-this-dwim)
(define-key region-bindings-mode-map (kbd "p") 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map (kbd "n") 'mc/mark-next-like-this)
(define-key region-bindings-mode-map (kbd "u") 'mc/remove-current-cursor)
(define-key region-bindings-mode-map (kbd "<tab>") 'mc/cycle-forward)
(define-key region-bindings-mode-map (kbd "<backtab>") 'mc/cycle-backward)
(define-key region-bindings-mode-map (kbd "C-;") 'multiple-cursors-mode)
(global-set-key (kbd "C-;") 'mc/mark-all-dwim)

(define-key region-bindings-mode-map (kbd "C-W") 'kill-region)

;; (defun mc/mark-all-dwim-or-mark-sexp (arg)
;;   "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
;;   (interactive "p")
;;   (cl-case arg
;;     (16 (mc/mark-all-dwim t))
;;     (4 (mc/mark-all-dwim nil))
;;     (1 (mark-sexp 1))))
;; (global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-mark-sexp)
