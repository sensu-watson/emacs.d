(when load-file-name
	(setq user-emacs-directory (file-name-directory load-file-name)))

;;el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
	(with-current-buffer
		(url-retrieve-synchronously
		"https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
	(goto-char (point-max))
	(eval-print-last-sexp)))

(el-get-bundle auto-complete)
(el-get-bundle helm)
(el-get-bundle markdown-mode)
(el-get-bundle rainbow-delimiters)
(el-get-bundle cl-lib)
(el-get-bundle smooth-scroll)
(el-get-bundle web-mode)
(el-get-bundle php-mode)
(el-get-bundle yasnippet)
(el-get-bundle yasnippet-snippets)
(el-get-bundle tom-tan/hlinum-mode)
(require 'color)

;; hlinum-mode
(hlinum-activate)
(global-linum-mode 1)

;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 200))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)

;; markdown-mode
(custom-set-variables
 '(markdown-command "/usr/local/bin/markdown"))

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/mySnippets"
        "~/.emacs.d/el-get/yasnippet-snippets"
        ))
(yas-global-mode 1)

;; theme
(load-theme 'deeper-blue t)

;; common
(setq backup-inhibited t)
(setq-default tab-width 4 indent-tabs-mode nil)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq scroll-step 1)
(setq default-directory "~/Desktop/") 
(setq command-line-default-directory "~/Desktop/")
