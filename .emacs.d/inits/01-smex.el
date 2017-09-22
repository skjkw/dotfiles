(require 'smex)
(smex-initialize)
; (global-set-key (kbd "M-x") 'smex)
; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'ivy-smex)
(global-set-key (kbd "M-x") 'ivy-smex)
