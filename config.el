;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq
 projectile-project-search-path '("~/Documents/work/")
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-css-indent-offset 2
 js-indent-level 2
 typescript-indent-level 2
 json-reformat:indent-width 2
 prettier-js-args '("--single-quote")
 dired-dwim-target t
 css-indent-offset 2
 +magit-hub-features t
 org-agenda-files (directory-files-recursively "~/Library/Mobile Documents/com~apple~CloudDocs/org/" "\.org$")
 org-super-agenda-groups '((:name "Today"
                                  :time-grid t
                                  :sheduled today)
                           (:name "Due today"
                                  :deadline today)
                           (:name "Overdue"
                                  :deadline past)
                           (:name "Doue soon"
                                  :deadline future)))

(after! org
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs json-jsonlist))))

(after! js2-mode
  (set-company-backend! 'js2-mode '(company-tide :with company-yasnippet)))

(add-hook!
  js2-mode 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(add-hook!
  web-mode-hook 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(add-hook!
  typescript-mode-hook 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'typescript-mode
    '(progn
       (add-hook 'typescript-mode-hook #'add-node-modules-path)
       (add-hook 'typescript-mode-hook #'prettier-js-mode)))

(load "~/Library/Mobile Documents/com~apple~CloudDocs/emacs.private/slack.el")
