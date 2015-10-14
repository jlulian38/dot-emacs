(server-start)

(require 'package)
(require 'cl-lib)

;; Install these packages
(setq my-pkgs '(cider better-defaults idle-highlight-mode auctex
		      python-mode nose pep8 pylint ido-ubiquitous
		      magit smex zenburn-theme rainbow-delimiters
		      smartparens exec-path-from-shell company))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq pkgs-to-install (cl-remove-if 'package-installed-p my-pkgs))

(when (> (length pkgs-to-install) 0)
  (package-refresh-contents)
  (dolist (pkg pkgs-to-install)
      (package-install pkg)))

;; Configuration
(exec-path-from-shell-initialize)

;; Theme
(load-theme `zenburn t)

;; Global programming mode configuration
(defun my-prog-hook ()
  (rainbow-delimiters-mode t)
  (idle-highlight-mode t))

(add-hook `prog-mode-hook 'my-prog-hook)

;; Python mode
(require 'nose)
(require 'pep8)
(require 'pylint)

(add-hook `before-save-hook `delete-trailing-whitespace)


;; Magit setup
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; VisualLineMode
(global-visual-line-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; Load all from .emacs.d/lib/*.el
(mapc 'load (directory-files "~/.emacs.d/lib" t "^[^#].*el$"))

(require 'tex-site)
(put 'erase-buffer 'disabled nil)
