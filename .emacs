(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(require 'helm)
(require 'helm-projectile)
(require 'org)
(require 'org-ref)
(require 'bibtex)
(require 'magit)
(require 'ht)

(setq org-todo-keywords
      '((sequence "TODO" "In Progress" "In Review" "Handed Off" "Deploying" "DONE")))

(defconst org-jira-progress-issue-flow
  '(("TODO" . "In Progress")
    ("In Progress" . "In Review")
    ("In Progress" . "In Review")
    ("In Review" . "Handed Off")
    ("Handed Off" . "Deploying")    
    ("Deploying" . "Done")
    ))

(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") #'helm-select-action)

(setq helm-M-x-fuzzy-match                  t
      helm-bookmark-show-location           t
      helm-buffers-fuzzy-matching           t
      helm-completion-in-region-fuzzy-match t
      helm-file-cache-fuzzy-match           t
      helm-imenu-fuzzy-match                t
      helm-mode-fuzzy-match                 t
      helm-locate-fuzzy-match               t 
      helm-quick-update                     t
      helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match             t)

(setq helm-completion-style 'helm-fuzzy)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'org-jira)
(setq jiralib-url "https://jira01.corp.linkedin.com:8443")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/school/indepdendentResearch/Related_Work_Papers/related_work.org")))
 '(package-selected-packages
   (quote
    (ripgrep deadgrep hydandata-light-theme org-jira yapfify yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox org-ref org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode markdown-toc macrostep lsp-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu emmet-mode elisp-slime-nav dumb-jump diminish define-word cython-mode csv-mode column-enforce-mode coffee-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu cargo auto-highlight-symbol auto-compile anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'pdf-tools)
(require 'deadgrep)
(add-to-list 'package-selected-packages 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (setenv "SHELL" "/bin/zsh")
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(load-theme 'manoj-dark t)
(set-face-attribute 'default nil :height 150)

