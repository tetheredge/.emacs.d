(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq package-enable-at-startup nil)
(package-initialize)

;;(require 'evil)
;;(evil-mode 1)

;;(require 'go-mode-autoloads)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq column-number-mode t)

;;;; Environment Variables
(setenv "PAGER" (executable-find "cat"))

(global-set-key
 (kbd "C-c r")
      (lambda ()
	(interactive) (revert-buffer t t)
	(message "Refreshed file.")))

(load-theme 'solarized-dark t)

;;;; Global settings
(show-paren-mode 1)
(eldoc-mode 1)

;;;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)

;;;; Ruby

(defun ruby-insert-whatever (type name)
  (newline)
  (delete-blank-lines)
  (previous-line 1)
  (move-beginning-of-line 1)
  (if (looking-at "[ \t\n]*end")
      (progn
        (move-end-of-line 1)
        (delete-blank-lines)
        (newline 2))
    (next-line 1))
  (insert type " " name)
  (indent-for-tab-command)
  (newline 2)
  (insert "end # " type " " name)
  (indent-for-tab-command)
  (newline)
  (if (not (looking-at "[ \t\n]*end"))
      (progn (delete-blank-lines)
             (newline 1)
             (previous-line 1))
    (delete-blank-lines))
  (previous-line 2)
  (indent-for-tab-command))

(defun ruby-insert-class (name)
  (interactive "sClass name: ") (ruby-insert-whatever "class" name))
(defun ruby-insert-module (name)
  (interactive "sModule name: ") (ruby-insert-whatever "module" name))
(defun ruby-insert-def (name)
  (interactive "sMethod name: ") (ruby-insert-whatever "def" name))
