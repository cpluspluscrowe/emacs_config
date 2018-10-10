N(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell atom-one-dark-theme go-autocomplete flymake-go auto-complete neotree go-mode lsp-go ensime slack org-jira ox-jira magit ## dash))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
			     "/Users/ccrowe/.org-jira/ADS.org"
                             "~/org/school.org" 
                             "~/org/home.org"))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)



    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)

(add-to-list 'exec-path "/usr/local/bin")


(add-hook 'go-mode-hook #'lsp-go-enable)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


(require 'go-autocomplete)
(require 'auto-complete-config)
(setenv "GOPATH" "/Users/ccrowe/go/src")
(add-to-list 'exec-path "/Users/ccrowe/go/bin")


