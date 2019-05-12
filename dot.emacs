(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			))
(package-initialize)

;; macOS ls doesn't support --dired otpion
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; load conda.el from clone repo
(add-to-list 'load-path "~/devvy/conda.el")
(require 'conda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(conda-anaconda-home "~/miniconda3/")
 '(conda-env-home-directory "~/miniconda3/")
 '(cua-mode t nil (cua-base))
 '(desktop-save-mode t)
 '(dired-sidebar-follow-file-at-point-on-toggle-open t)
 '(dired-sidebar-open-file-in-most-recently-used-window t)
 '(dired-sidebar-theme (quote nerd))
 '(dired-sidebar-use-term-integration t)
 '(direnv-mode t nil (direnv))
 '(display-battery-mode t)
 '(display-line-numbers-type nil)
 '(display-time-mode t)
 '(exec-path-from-shell-variables (quote ("PATH" "MANPATH" "PYTHONPATH")))
 '(fci-rule-color "#ECEFF1")
 '(global-display-line-numbers-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag nil)
 '(global-linenum-mode t)
 '(global-linum-mode t)
 '(global-undo-tree-mode t)
 '(helm-buffers-truncate-lines nil)
 '(hl-sexp-background-color "#efebe9")
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point (quote guess))
 '(inhibit-startup-screen t)
 '(magit-log-section-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(menu-bar-mode nil)
 '(org-directory "~/Dropbox/org")
 '(package-selected-packages
   (quote
    (flycheck auto-complete-rst direnv conda helm-company projectile-direnv dockerfile-mode markdown-mode realgud cmake-mode osx-lib exec-path-from-shell org-bullets htmlize ace-window dired-sidebar yaml-mode undo-tree magit-svn helm-projectile osx-trash helm shell-pop rust-playground rustic rust-mode material-theme magit)))
 '(projectile-mode t nil (projectile))
 '(projectile-project-search-path (quote ("~/Documents/dev" "~/Documents/devvy")))
 '(safe-local-variable-values (quote ((checkdoc-minor-mode . t))))
 '(shell-pop-autocd-to-working-dir nil)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 40)
 '(show-paren-mode t)
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(exec-path-from-shell-initialize)


(set-keyboard-coding-system nil)
(set-terminal-coding-system nil)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Custom Key-Binding
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-n") 'dired-sidebar-toggle-sidebar)
(global-set-key (kbd "M-o") 'ace-window)


;; Windows management
(add-to-list 'display-buffer-alist
	     `(,(rx bos "*helm" (* not-newline) "*" eos)
	       display-buffer-in-side-window (side . right) (slot . 1) (window-width . 0.3) (window-height . 1)))
(setq helm-buffer-details-flag nil)

;; Clean up whitespace on a save
;; (add-hook 'before-save-hook 'whitespace-cleanup)

(add-to-list 'load-path "~/Documents/dev/midas/etc/SMIME")
(require 'smime)

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <Dropbox root directory>/MobileOrg
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load "rst" '(auto-complete-rst-init))
