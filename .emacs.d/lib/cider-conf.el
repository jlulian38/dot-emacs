(require 'smartparens-config)
(require 'company)

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-auto-mode nil)
(setq nrepl-log-messages nil)
(setq nrepl-hide-special-buffers nil)

;(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)


;; company setup
(setq company-idle-delay nil) ; never start completions automatically
(global-set-key (kbd "M-TAB") #'company-complete-common) ; use meta+tab, aka C-M-i, as manual trigger
;(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
