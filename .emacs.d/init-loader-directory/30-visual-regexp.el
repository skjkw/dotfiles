(require 'visual-regexp)

(define-key global-map (kbd"C-c r") 'vr/replace)
(define-key global-map (kbd"C-c q") 'vr/query-replace)
(define-key global-map (kbd"C-c e") 'vr/mc-mark)
