;; Emacs config
;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                        ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

;; Disable splash screen and startup message
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

;; Start with *scratch* buffer
(setq initial-buffer-choice nil)

;; Add cl-lib for remove-if-not
(require 'cl-lib)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Remove menu and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Relative line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; 4-space indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Evil mode setup
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Org mode
(use-package org
  :config
  (setq org-startup-indented t))

;; Treemacs
(use-package treemacs
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t t" . treemacs)))

(use-package treemacs-evil
  :after (treemacs evil))

;; Font configuration
(use-package ligature
  :config
  (ligature-set-ligatures 't '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                              "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                              "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                              "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                              ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                              "/**" "/=" "/>" "//" "///" "&&" "||" "||="
                              "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                              "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                              ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                              "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                              "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                              "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  (global-ligature-mode t))

;; Set font only if it exists
(when (member "Source Code Pro" (font-family-list))
  (set-face-attribute 'default nil
                      :font "Source Code Pro"
                      :height 180))

;; Email (mu4e setup)
(when (file-directory-p "/usr/share/emacs/site-lisp/mu4e")
  (use-package mu4e
    :ensure nil
    :load-path "/usr/share/emacs/site-lisp/mu4e"
    :config
    (setq mail-user-agent 'mu4e-user-agent)))

;; LSP setup
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (go-mode . lsp)
         (js-mode . lsp)
         (java-mode . lsp)
         (python-mode . lsp)
         (lua-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Tree-sitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs)

;; Language specific packages
(use-package rust-mode)
(use-package go-mode)
(use-package zig-mode)
(use-package js2-mode)

;; Python mode with better configuration
(use-package python-mode
  :custom
  (python-shell-interpreter "python3"))

;; Lua mode with fixed configuration
(use-package lua-mode
  :custom
  (lua-indent-level 4)
  :config
  (defvar lua-electric-flag t
    "Non-nil means electric actions (like automatic reindentation) will happen when typing.")
  (defconst lua-block-token-alist
    '(("do" "end") ("function" "end") ("repeat" "until") ("then" "end"))))

(use-package clojure-mode)
(use-package cc-mode)

;; Company mode for completion
(use-package company
  :config
  (global-company-mode))

;; Which key
(use-package which-key
  :config
  (which-key-mode))

;; Modeline configuration
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 3)
  (doom-modeline-persp-name t)
  (doom-modeline-persp-icon t)
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  :config
  (setq doom-modeline-evil-state-icon t)
  (setq doom-modeline-minor-modes t)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-default-eol-type nil))

;; All-the-icons (required for doom-modeline)
(use-package all-the-icons
  :if (display-graphic-p))

;; Themes - Make sure they are installed before enabling
(use-package gruber-darker-theme
  :ensure t)

;; Apply theme after ensuring it's installed
(use-package zenburn-theme
  :ensure t)

;; Apply the theme after frame creation to make sure it sticks
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'gruber-darker t))))
  (load-theme 'gruber-darker t))

;; Other themes available - install but don't activate
(use-package gruvbox-theme
  :ensure t)

(use-package flatland-theme
  :ensure t)

(use-package planet-theme
  :ensure t)

;; Additional modeline customization
(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; Show column number in modeline
(column-number-mode 1)

;; Show file size in modeline
(size-indication-mode 1)

;; Provide better error messages
(setq debug-on-error t)

;; Disable theme caching to fix theme loading issues
(setq custom-safe-themes t)

;; Run package-initialize again to make sure packages are loaded
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(planet-theme flatland-theme gruvbox-theme gruber-darker-theme zig-mode zenburn-theme which-key treemacs-evil tree-sitter-langs rust-mode python-mode lua-mode lsp-ui ligature js2-mode go-mode evil-collection doom-modeline company clojure-mode all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
