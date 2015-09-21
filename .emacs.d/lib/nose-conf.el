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
