;; emacs configuration

(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")

(set-frame-font "Meslo LG M DZ-14")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized-light t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'ruby-mode-hook `set-newline-and-indent)
