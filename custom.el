(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs json-jsonlist))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages '(tide))
 '(warning-suppress-types '((use-package) (defvaralias) (lexical-binding))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; tide setup
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook
          (progn
            (define-key evil-normal-state-map (kbd "M-.") #'tide-jump-to-definition)
            (define-key evil-normal-state-map (kbd "M-,") #'tide-jump-back)))

(add-hook 'go-mode-hook
          (progn
            (define-key evil-normal-state-map (kbd "C-.") #'godef-jump)
            (define-key evil-normal-state-map (kbd "C-,") #'xref-go-back)))
