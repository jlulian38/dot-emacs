(require 'cl-lib)

(defun my-nose-project-root (dirname)
  (cl-reduce (lambda (x y) (or x y))
             (mapcar
              (lambda (f) (match-any-suffix f nose-project-root-files))
              (directory-files dirname))))

(defun match-any-suffix (string suffixes)
  (cl-some (lambda (suffix) (string-suffix-p suffix string)) suffixes))

(setq nose-project-root-test 'my-nose-project-root)
(add-to-list 'nose-project-root-files ".org")

;; ELPA version of nose.el doesn't define this minor mode? So I'll just define it
(define-minor-mode nose-mode
  "Minor mode enabling nosetests key commands."
  :keymap
  '(("\C-c.a" . nosetests-all)
    ("\C-c.m" . nosetests-module)
    ("\C-c.o" . nosetests-one)
    ("\C-c.c" . nosetests-again)
    ("\C-c.pa" . nosetests-pdb-all)
    ("\C-c.pm" . nosetests-pdb-module)
    ("\C-c.po" . nosetests-pdb-one)) )

(add-hook `python-mode-hook (lambda () (nose-mode t)))
