x(server-start)

(require 'package)
(require 'cl-lib)

;; Require packages
(setq my-pkgs '(cider better-defaults idle-highlight-mode
		      ido-ubiquitous magit smex zenburn-theme rainbow-delimiters smartparens))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq pkgs-to-install (cl-remove-if 'package-installed-p my-pkgs))

(when (> (length pkgs-to-install) 0)
  (package-refresh-contents)
  (dolist (pkg pkgs-to-install)
      (package-install pkg)))

;; Configuration

(load-theme `zenburn t)

(add-hook `prog-mode-hook #'rainbow-delimiters-mode)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(mapc 'load (directory-files "~/.emacs.d/lib" t "^[^#].*el$"))

