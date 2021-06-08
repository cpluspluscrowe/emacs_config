(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (package-initialize)
  (when (require 'helm-fish-completion nil 'noerror)
    (define-key shell-mode-map (kbd "<tab>") 'helm-fish-completion)
    (setq helm-esh-pcomplete-build-source-fn #'helm-fish-completion-make-eshell-source))
  (setq org-log-done 'time)
  (define-key global-map (kbd "C-c s") 'ace-jump-mode)
  (define-key global-map (kbd "C-c m") 'toggle-frame-maximized)
  (define-key global-map (kbd "C-c g") 'god-mode)
  (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
  (require 'eaf)(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
  (require 'eaf)
  (setq show-paren-delay 0)
  (global-set-key "\C-s" 'swiper-helm)
  (global-set-key "\C-c\C-j" 'org-journal-new-entry)
  (global-set-key "\C-c\C-o" 'org-journal-open-current-journal-file)
  (load-file "/Users/ccrowe/github/mini_journal_notes/journal_adder.el")
  (require 'org-capture)
  (global-set-key (kbd "C-c c c") 'org-capture)
  (add-to-list 'org-capture-templates
               '("c" "Review Note"  entry
                 (file "~/org/notes/capture.org")
                 "* %?" :empty-lines 0))
  (while (disable-theme (car custom-enabled-themes)))
  ;(load-theme (intern-soft "misterioso") t)
  (load-theme (intern-soft "doom-outrun-electric") t)
  (flyspell-mode t)
  (flyspell-popup-auto-correct-mode t)
  (guru-global-mode +1)
  (require 'ido-completing-read+)
  (ido-ubiquitous-mode 1)
  (require 'linum-relative)
  (linum-on)
  (eros-mode 1)
  (define-key global-map (kbd "C-c +") 'spacemacs/scale-up-font)
  (define-key global-map (kbd "C-=") 'spacemacs/scale-up-font)
  (define-key global-map (kbd "C--") 'spacemacs/scale-down-font)

  ; enables fish-completion
  (when (and (executable-find "fish")
             (require 'fish-completion nil t))
    (global-fish-completion-mode))
  )
