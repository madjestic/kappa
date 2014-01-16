(package-initialize)
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.emacs.d")

(menu-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories (quote ("~/.emacs.d/ac-dict" "/home/madjestic/.emacs.d/elpa/auto-complete-1.4/dict")))
 '(ac-dwim t)
 '(ac-expand-on-auto-complete t)
 '(ac-quick-help-prefer-pos-tip t)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(browse-url-generic-program "chromium-browser" t)
 '(browse-url-text-browser "chromium")
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
 '(doc-view-resolution 1000)
 '(ecb-layout-name "left2")
 '(ecb-layout-window-sizes (quote (("leftSpeedbarHistory02" (ecb-speedbar-buffer-name 0.16 . 0.6071428571428571) (ecb-history-buffer-name 0.16 . 0.32142857142857145)))))
 '(ecb-options-version "2.40")
 '(fringe-mode nil nil (fringe))
 '(global-auto-complete-mode t)
 '(global-hl-line-mode t)
 '(haskell-indent-offset 4)
 '(haskell-indentation-ifte-offset 4)
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-where-post-offset 4)
 '(haskell-indentation-where-pre-offset 4)
 '(haskell-mode-hook (quote ((lambda nil (ghc-init)) (lambda nil (set-input-method "haskell-unicode")) turn-on-haskell-indent turn-on-haskell-doc-mode)))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(minimap-dedicated-window t)
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(org-agenda-files (quote ("~/journal.org")))
 '(org-file-apps (quote ((auto-mode . emacs) ("\\.mm\\'" . default) ("\\.x?html?\\'" . default) ("\\.pdf\\'" . "/usr/bin/okular"))))
 '(package-archives (quote (("marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("org" . "http://orgmode.org/elpa/"))))
 '(powerline-default-separator (quote arrow))
 '(powerline-height nil)
 '(powerline-text-scale-factor nil)
 '(scroll-bar-mode nil)
 '(smooth-scroll-mode t)
 '(speedbar-after-create-hook (quote (speedbar-frame-reposition-smartly)))
 '(speedbar-before-popup-hook nil)
 '(speedbar-default-position (quote left))
 '(speedbar-directory-button-trim-method (quote trim))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 10) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 36 38 40 44 48 52 56 64 72 80 88 96 104 112 120)))
 '(tab-width 2)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-use-images nil)
 '(tool-bar-mode nil)
 '(tooltip-frame-parameters (quote ((name . "tooltip") (internal-border-width . 2) (border-width . 1))))
 '(yas/global-mode t nil (yasnippet))
 '(yas/root-directory (quote ("~/.emacs.d/snippets")) nil (yasnippet))
 '(yas/use-menu (quote real-modes))
 '(yas/visit-from-menu nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(border ((t nil)))
 '(cursor ((t (:background "#707080"))))
 '(ecb-default-general-face ((t (:height 0.9))))
 '(fringe ((t (:background "#1d2733"))))
 '(highlight ((t (:background "chocolate"))))
 '(hl-line ((t (:inherit highlight :background "#454857"))))
 '(iedit-occurrence ((t (:inherit highlight))))
 '(linum ((t (:inherit (shadow default) :background "#454857" :foreground "#9999aa"))))
 '(menu ((t (:background "#222244" :foreground "#797985" :inverse-video t))))
 '(minimap-active-region-background ((t (:background "#454857"))))
 '(minimap-font-face ((t (:height 0.1))))
 '(popup-tip-face ((t (:background "#797985" :foreground "black" :height 0.8))))
 '(powerline-active1 ((t (:inherit mode-line :background "grey22"))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey40"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey11"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey20"))))
 '(speedbar-button-face ((t (:foreground "green3" :height 0.8))))
 '(speedbar-directory-face ((t (:foreground "steel blue" :height 0.8))))
 '(speedbar-file-face ((t (:foreground "light blue" :height 0.8))))
 '(speedbar-highlight-face ((t (:background "sea green" :height 0.8))))
 '(speedbar-selected-face ((t (:foreground "red" :underline t :height 0.8))))
 '(speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray" :height 0.8))))
 '(speedbar-tag-face ((t (:foreground "yellow" :height 0.8))))
 '(tabbar-button ((t (:inherit tabbar-default))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray50" :foreground "grey75"))))
 '(tabbar-highlight ((t (:inherit nil :background "#2d3743"))))
 '(tabbar-selected ((t (:inherit tabbar-default :underline t :weight bold))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(tooltip ((t (:inherit variable-pitch :background "#797985" :foreground "black" :height 0.8))))
 '(vertical-border ((t nil)))
 '(vhdl-speedbar-architecture-face ((t (:foreground "LightSkyBlue" :height 0.8))))
 '(vhdl-speedbar-architecture-selected-face ((t (:foreground "LightSkyBlue" :underline t :height 0.8))))
 '(vhdl-speedbar-package-face ((t (:foreground "Grey80" :height 0.8))))
 '(vhdl-speedbar-package-selected-face ((t (:foreground "Grey80" :underline t :height 0.8)))))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . 
      "http://melpa.milkbox.net/packages/") t)

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))

(add-hook 'web-mode-hook
          (lambda()
	    (linum-mode)
	    (iedit-mode)
	    (setq web-mode-markup-indent-offset 4)
	    (setq web-mode-css-indent-offset 4)
	    (setq web-mode-code-indent-offset 4)
	    (setq web-mode-indent-style 4)))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(defun load-haskell ()
  "load haskell config files"
  (interactive)
  (load-user-file "haskell.el"))

(defun load-cpp ()
  "load haskell config files"
  (interactive)
  (load-user-file "cpp.el"))

(defun load-ecb ()
  "load haskell config files"
  (interactive)
  (load-user-file "ecb.el"))

(defun load-haskell-ide ()
  "load haskell config files"
  (interactive)
  (load-user-file "haskell-ide.el"))

(defun load-haskell-ide ()
  "load haskell config files"
  (interactive)
  (load-user-file "haskell-ide.el"))

(defun load-cpp-ide ()
  "load haskell config files"
  (interactive)
  (load-user-file "cpp-ide.el"))

(defun swap-buffer-mode ()
  "load haskell config files"
  (interactive)
  (load-user-file "buffer-mode.el"))

(defun web-mode ()
  "load haskell config files"
  (interactive)
  (load-user-file "web-mode.el"))

(defun blog-mode ()
  "load haskell config files"
  (interactive)
  (load-user-file "blog.el"))

(defun kill-all-dired-buffers ()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let ((count 0))
          (dolist (buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count))))

(global-set-key (kbd "C-x C-k") 'kill-all-dired-buffers)
(global-set-key (kbd "C-c L") 'linum-mode)
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

(require 'smooth-scroll)
(smooth-scroll-mode t)

(require 'dired-sort-menu)
(require 'move-text)
(move-text-default-bindings)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

(swap-buffer-mode)
(show-paren-mode t)
(set-default 'truncate-lines t)
(powerline-default-theme)

;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;

(global-set-key (kbd "C-c C-S-l") 'org-store-link)
(global-set-key (kbd "C-c C-S-c") 'org-capture)
(global-set-key (kbd "C-c C-S-a") 'org-agenda)
(global-set-key (kbd "C-c C-S-b") 'org-iswitchb)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(global-set-key (kbd "C-c a") 'org-agenda)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")
(setq browse-url-default-browser "chromium")

;;(require 'semantic)
;;(require 'ecb)
