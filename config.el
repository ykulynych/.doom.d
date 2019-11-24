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
 +magit-hub-features t)

(add-hook!
  js2-mode 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(add-hook!
  web-mode-hook 'prettier-js-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))
