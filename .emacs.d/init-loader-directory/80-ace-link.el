(require 'ace-link)
(eval-after-load 'eww '(define-key eww-mode-map "f" 'ace-link-eww))
(ace-link-setup-default)
