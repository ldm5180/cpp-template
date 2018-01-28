(setq-default indent-tabs-mode nil)
(set-face-foreground 'font-lock-comment-face "Red" )
(set-variable font-lock-comment-face 'font-lock-comment-face)

(add-to-list 'load-path "/root/.emacs-files")
(require 'cl-lib)

(load "/usr/share/emacs/site-lisp/clang-format-5.0/clang-format.el")
;;(global-set-key [M-x i] 'clang-format-region)
(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "C-i") #'clang-format-region)))
;; Linux/Windows  style
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)

(require 'gtest-cpp-font-lock)
(gtest-c++-font-lock-global-mode t)

(set-face-foreground 'minibuffer-prompt "brightblue")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "Turquoise"))))
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(font-lock-constant-face ((((class color) (background dark)) (:bold t :foreground "DarkOrchid"))))
 '(font-lock-doc-string-face ((t (:foreground "green2"))))
 '(font-lock-function-name-face ((t (:foreground "CornflowerBlue"))))
 '(font-lock-keyword-face ((t (:foreground "color-139"))))
 '(font-lock-negation-char-face ((t (:foreground "brightred"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "brightblack" :weight bold))))
 '(font-lock-reference-face ((t (:foreground "DodgerBlue"))))
 '(font-lock-string-face ((t (:foreground "LimeGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "yellow" :weight light))))
 '(org-table ((t (:foreground "LimeGreen")))))

(define-key global-map [select] 'end-of-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
