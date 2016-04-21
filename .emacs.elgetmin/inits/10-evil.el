(use-package evil
  :config
  (evil-mode 1)
  )

(with-eval-after-load-feature-el 'evil
  (defun evil-swap-key (map key1 key2)
    ;; MAP中のKEY1とKEY2を入れ替え
    "Swap KEY1 and KEY2 in MAP."
    (let ((def1 (lookup-key map key1))
          (def2 (lookup-key map key2)))
      (define-key map key1 def2)
      (define-key map key2 def1)))

  ;; 物理行移動と論理行移動を入れ替え
  (evil-swap-key evil-motion-state-map "j" "gj")
  (evil-swap-key evil-motion-state-map "k" "gk")

  ;; C-n, C-pの直前が貼り付けコマンドでないときに上下移動になるようにする
  (defadvice evil-paste-pop (around evil-paste-or-move-line activate)
    ;; evil-paste-popできなかったらprevious-lineする
    "If there is no just-yanked stretch of killed text, just move
   to previous line."
    (condition-case err
        ad-do-it
      (error (if (eq this-command 'evil-paste-pop)
                 (call-interactively 'previous-line)
               (signal (car err) (cdr err))))))
  (defadvice evil-paste-pop-next (around evil-paste-or-move-line activate)
    ;; evil-paste-pop-nextできなかったらnext-lineする
    "If there is no just-yanked stretch of killed text, just move
   to next line."
    (condition-case err
        ad-do-it
      (error (if (eq this-command 'evil-paste-pop-next)
                 (call-interactively 'next-line)
               (signal (car err) (cdr err))))))

  (evil-swap-key evil-motion-state-map ";" ":")

  (define-key evil-normal-state-map (kbd "C-t") nil)
  (define-key evil-normal-state-map (kbd "s") nil)
  (define-key evil-insert-state-map (kbd "C-y") nil)
  (define-key evil-motion-state-map (kbd "C-u") #'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "sh") 'evil-first-non-blank)
  (define-key evil-motion-state-map (kbd "sl") 'evil-end-of-line)
  (define-key evil-motion-state-map (kbd "sm") 'evil-jump-item)
  (define-key evil-motion-state-map (kbd "ss") 'evil-substitute)
  )

