;; fix key M S C in mac
(set-keyboard-coding-system nil)
;; do not show help
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; fix the PATH variable
;;(defun set-exec-path-from-shell-PATH ()
;;  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
;;    (setenv "PATH" path-from-shell)
;;    (setq exec-path (split-string path-from-shell path-separator))))
;;(when window-system (set-exec-path-from-shell-PATH))
;;(let ((path (shell-command-to-string ". ~/.profile; ~/.bash_profile; echo -n $PATH")))
;; set $PATH for shells
(when (display-graphic-p)
  (let '(path "/Users/sstvn/Dev/Applications/groovy-2.1.9/bin:/Users/sstvn/springsource/spring-roo-1.2.4.RELEASE/bin:/Users/sstvn/Dev/Applications/mongodb-osx-x86_64-2.4.8/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/sstvn/Dev/Applications/vert.x-2.0.2-final/bin:/Users/sstvn/Dev/Applications/apache-maven-3.1.1/bin:/usr/local/mysql/bin:/Users/sstvn/Dev/ShellScript:/Users/sstvn/clojure")
    (setenv "PATH" path)
    (setq exec-path
          (append
           (split-string-and-unquote path ":")
           exec-path)))
  (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home")
)
;; shells with different buffer names
(defun bash (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (term "/bin/bash")
  (rename-buffer buffer-name t))
(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer buffer-name t))
(defun fish (buffer-name)
  "Start a terminal with BUFFER-NAME."
  (interactive "sbuffer name:")
  (term "/usr/local/bin/fish")
  (rename-buffer buffer-name t))
;; monospace font for better drawing
(when (display-graphic-p)
  (add-to-list 'default-frame-alist
               '(font . "monofur-16"))
  (set-face-attribute 'default nil
                      :family "monofur" :height 160)
  (set-face-attribute 'fixed-pitch nil :font "monofur-16")
  (set-face-attribute 'variable-pitch nil :font "monofur-16")
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.0))))
 '(org-level-2 ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.0))))
 '(org-level-3 ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.0))))
 '(org-level-4 ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.0))))
 '(org-level-5 ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.0)))))
;;(global-font-lock-mode 1)
;; disable all dialog
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice message-box (around prevent-dialog activate)
  "Prevent message-box from activating a dialog"
  (apply #'message (ad-get-args 0)))
;; melpa package repository
(require 'package)
;;(add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
;(package-refresh-contents)
(package-initialize)
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))
;;(unless (package-installed-p 'icicles)
;;  (package-install 'icicles))
;;(unless (package-installed-p 'icomplete+)
;;  (package-install 'icomplete+))
(unless (package-installed-p 'cider)
  (package-install 'cider))
(unless (package-installed-p 'org)
  (package-install 'org))
;(unless (package-installed-p 'org-plus-contrib)
;  (package-install 'org-plus-contrib))
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
;;(unless (package-installed-p 'company)
;;  (package-install 'company))
(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))
(unless (package-installed-p 'ac-cider)
  (package-install 'ac-cider))
(unless (package-installed-p 'ac-nrepl)
  (package-install 'ac-nrepl))
(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))
(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))
(unless (package-installed-p 'inkpot-theme)
  (package-install 'inkpot-theme))
(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))
(unless (package-installed-p 'rainbow-mode)
  (package-install 'rainbow-mode))
(unless (package-installed-p 'rainbow-blocks)
  (package-install 'rainbow-blocks))
(unless (package-installed-p 'scala-mode2)
  (package-install 'scala-mode2))
(unless (package-installed-p 'obsidian-theme)
  (package-install 'obsidian-theme))
(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'powerline)
  (package-install 'powerline))
(unless (package-installed-p 'powerline-evil)
  (package-install 'powerline-evil))
;;(unless (package-installed-p 'adoc-mode)
;;  (package-install 'adoc-mode))
;;(unless (package-installed-p 'zone-matrix)
;;  (package-install 'zone-matrix))
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
;; matrix like idle
;;(setq zone-programs [zone-matrix])
;;(require 'zone)
;;(zone-when-idle 60)
;; RET auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)
;; spaces for tabs
(setq-default indent-tabs-mode nil)
;; enable navigate with arrows
(defun disable-guru-mode ()
  (guru-mode -1))
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)
;;(setq visible-bell t)
(setq visible-bell 'top-bottom)
;;load color theme
;;(package-initialize)
;;(color-theme-initialize)
;;(color-theme-matrix)
;;(load-theme 'solarized-dark t)
;;(setq solarized-use-terminal-theme t)
;; Enable mouse support
;(unless (display-graphic-p) ;;window-system
;  (require 'mouse)
;  (xterm-mouse-mode t)
;  (global-set-key [mouse-4] '(lambda ()
;                               (interactive)
;                               (scroll-down 1)))
;  (global-set-key [mouse-5] '(lambda ()
;                               (interactive)
;                               (scroll-up 1)))
;  (defun track-mouse (e))
;  (setq mouse-sel-mode t)
;  )
;; disable scrollbar
(when (display-graphic-p)
  (scroll-bar-mode -1)
)
(setq mouse-wheel-progressive-speed nil)
;; kill toolbar too
(menu-bar-mode -1)
(tool-bar-mode -1)
;; icicle
(icomplete-mode 99)
;; company mode
;;(add-hook 'prog-mode-hook 'global-company-mode)
;;(icy-mode 1)
;;(global-yascroll-bar-mode 1)
;; very large file view
;;(add-to-list 'load-path "~/.emacs.d/vlf-1.6")
;;(require 'vlf)
;;(require 'vlf-integrate)
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))
(add-hook 'find-file-hooks 'my-find-file-check-make-large-file-read-only-hook)
;; rainbow delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; rainbow blocks in org
(require 'rainbow-blocks)
(add-hook 'org-mode-hook 'rainbow-blocks-mode)
;; true rainbow color for rainbow blocks
(set-face-attribute 'rainbow-blocks-unmatched-face nil
                      :foreground "#8B0000")
(set-face-attribute 'rainbow-blocks-depth-1-face nil
                      :foreground "#FF0033")
(set-face-attribute 'rainbow-blocks-depth-2-face nil
                      :foreground "#FF8C00")
(set-face-attribute 'rainbow-blocks-depth-3-face nil
                      :foreground "##FFD700")
(set-face-attribute 'rainbow-blocks-depth-4-face nil
                      :foreground "#90EE90")
(set-face-attribute 'rainbow-blocks-depth-5-face nil
                      :foreground "#000080")
(set-face-attribute 'rainbow-blocks-depth-6-face nil
                      :foreground "#800080")
(set-face-attribute 'rainbow-blocks-depth-7-face nil
                      :foreground "#DA70D6")
(set-face-attribute 'rainbow-blocks-depth-8-face nil
                      :foreground "#FF69B4")
(set-face-attribute 'rainbow-blocks-depth-9-face nil
                      :foreground "#A52A2A")
;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(show-paren-mode 1)
;; Auto complete
;;(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
;;(setq 'ac-dictionary-directories '("~/.emacs.d/ac-dict"))
(require 'auto-complete-config)
(ac-config-default)
(setq ac-quick-help-delay 0.2)
;; cider auto-complete
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; nrepl auto-complete
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))
(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; line display
(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode -1)
;; multiple cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-c m ,") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m .") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m 8") 'mc/mark-all-like-this)
;; call init.el
;;(add-to-list 'load-path "~/.emacs.d/")
;;(load-library "init")
(add-to-list 'load-path "~/.emacs.d/")
(load-library "artist")
;;; integrate ido with artist-mode
(defun artist-ido-select-operation (type)
  "Use ido to select a drawing operation in artist-mode"
  (interactive (list (ido-completing-read "Drawing operation: " 
                                          (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
                                                "square" "poly-line" "straight poly-line" "ellipse" 
                                                "circle" "text see-thru" "text-overwrite" "spray-can" 
                                                "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
                                                "cut rectangle" "cut square" "copy rectangle" "copy square" 
                                                "paste" "flood-fill"))))
  (artist-select-operation type))
(defun artist-ido-select-settings (type)
  "Use ido to select a setting to change in artist-mode"
  (interactive (list (ido-completing-read "Setting: " 
                                          (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
                                                "Rubber-banding" "Trimming" "Borders"))))
  (if (equal type "Spray-size") 
      (artist-select-operation "spray set size")
    (call-interactively (artist-fc-get-fn-from-symbol 
                         (cdr (assoc type '(("Set Fill" . set-fill)
                                            ("Set Line" . set-line)
                                            ("Set Erase" . set-erase)
                                            ("Rubber-banding" . rubber-band)
                                            ("Trimming" . trimming)
                                            ("Borders" . borders)
                                            ("Spray-chars" . spray-chars))))))))
(add-hook 'artist-mode-init-hook 
          (lambda ()
            (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
            (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))
;; cedet
;(load-file "~/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; enable projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
;; recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; powerline
(require 'powerline)
(powerline-default-theme)
;; startup files
(find-file "~/tryorg.org")
(find-file "~/emacs-cheat-sheet.org")
(find-file "~/vms-maven/.projectile")
(if (display-graphic-p)
  (load-theme 'zenburn t)
  (load-theme 'zenburn t)
)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "70cf411fbf9512a4da81aa1e87b064d3a3f0a47b19d7a4850578c8d64cac2353" default))))
