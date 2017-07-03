(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacsbackups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence should end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "welcome in emacs") ; print a default message in the empty scratch buffer opened at startup
(setq package-enable-at-startup nil)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package)
(custom-set-variables
 ;; custom-set-variables was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 )

(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
(setq ivy-initial-inputs-alist nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "c-c c-r") 'ivy-resume)
(global-set-key (kbd "m-x") 'counsel-m-x)
(global-set-key (kbd "c-x c-f") 'counsel-find-file)
(global-set-key (kbd "c-c g") 'counsel-git)
(require 'evil-leader)
(require 'evil)
(require 'recentf)
(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "g" 'counsel-git
  "rf" 'counsel-recentf
  "<SPC>" 'counsel-M-x
 )
(evil-commentary-mode)
(setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

