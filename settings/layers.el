;;; local-settings's Spacemacs --- Settings -*- mode: emacs-lisp; -*-
;;; Time-stamp: <Thu 2022-04-28 13:53 svarrette>
;;;; Commentary

;; Defines the layers to configure
;;

(provide 'local-settings/configuration-layers)

;;  List of configuration layers to load.
(defvar local-settings/dotspacemacs-configuration-layers
  '(;; ----------------------------------------------------------------
    ;; press `SPC f e R' (Vim style) or `M-m f e R' (Emacs style) to
    ;; install them.
    ;; ----------------------------------------------------------------
    ansible
    (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     ;;auto-completion-complete-with-key-sequence "C-return"
                     auto-completion-complete-with-key-sequence-delay 0.0
                     auto-completion-enable-help-tooltip 'manual
                     auto-completion-use-company-box t
                     auto-completion-enable-sort-by-usage t
                     auto-completion-enable-snippets-in-popup t
                     auto-completion-tab-key-behavior 'cycle
                     :disabled-for
                     org
                     git)
    (better-defaults :variables
                     better-defaults-move-to-beginning-of-code-first t
                     better-defaults-move-to-end-of-code-first t)
    bibtex
    (c-c++ :variables
           c-c++-backend 'lsp-clangd
           c-c++-dap-adapters '(dap-lldb dap-cpptools)
           c-c++-enable-organize-includes-on-save t
           c-c++-enable-auto-newline t)
    common-lisp
    copy-as-format
    csv
    (dash :variables
          dash-autoload-common-docsets nil)
    dap
    ;; dtrt-indent
    ;;emacs-lisp
    ess
    evil-better-jumper
    (geolocation :variables
                 ;; geolocation-enable-automatic-theme-changer t
                 ;; geolocation-enable-location-service t
                 geolocation-enable-weather-forecast t)
    (git :variables
         git-enable-magit-delta-plugin t   ;; brew install git-delta
         git-enable-magit-gitflow-plugin t ;; brew install git-flow
         )
    github
    (go :variables
        go-backend 'go-mode
        go-format-before-save t)
    gpu
    graphviz
    helm
    helpful
    html
    (java :variables
          java-backend 'meghanada)
    (latex :variables
           latex-enable-magic nil)
    ;; lsp configured SEPARATELY outside the default layer within settings/user-config.el
    ;; LSP is not compliant with company-lsp : see https://github.com/tigersoldier/company-lsp/issues/119
    (lsp :variables
         ;;
         ;; default segments
         lsp-modeline-code-actions-segments '(count icon)
         lsp-headerline-breadcrumb-enable t
         lsp-headerline-breadcrumb-segments '(project path-up-to-project file symbols)
         lsp-use-lsp-ui t
         lsp-ui-remap-xref-keybindings t
         lsp-navigation 'peek
         )
    (lua :variables
         lua-backend 'lsp
         lua-lsp-server 'lua-lsp
         lsp-clients-luarocks-bin-dir "/usr/local")
    (markdown :variables
              markdown-open-command (concat dotspacemacs-directory "markdown_open")
              markdown-italic-underscore t
              markdown-live-preview-engine 'vmd
              )
    (multiple-cursors :variables
                      multiple-cursors-backend 'evil-mc)
    nav-flash
    (org :variables
         org-enable-github-support t)
    (osx :variables
         osx-option-as 'none       ;; Very important to allow for all keys \
         osx-right-option-as 'meta)
    ;; pass
    perl5
    php
    prettier
    protobuf
    puppet
    (python :variables
            python-formatter 'black
            python-format-on-save nil
            ;; python-save-before-test nil
            python-sort-imports-on-save t
            python-fill-column 99
            )
    (ranger :variables
            ranger-override-dired 'ranger
            ranger-show-preview t)
    rebox
    restructuredtext
    (ruby :variables
          ruby-backend         'lsp
          ruby-enable-enh-ruby-mode t
          ruby-prettier-on-save t
          ruby-test-runner     'rspec
          ruby-version-manager 'rvm
          )
    ;; org
    (shell :variables
           shell-default-term-shell "/bin/bash"
           shell-default-shell 'multi-term   ;; brew install libvterm
           multi-term-program "/bin/bash"
           shell-default-height 30
           shell-default-position 'bottom
           close-window-with-terminal t)
    (shell-scripts :variables
                   shell-scripts-format-on-save t)
    (solidity :variables
              solidity-flycheck-solc-checker-active t)
    (spell-checking :variables
                    spell-checking-enable-by-default nil
                    enable-flyspell-auto-completion t
                    spell-checking-enable-auto-dictionary t)
    syntax-checking
    ;; Still using auto-insert-tlkd for the moment.
    ;; (templates :variables
    ;;            templates-use-default-templates t
    ;;            templates-private-directory (concat dotspacemacs-directory "templates/yatemplates"))
    themes-megapack
    (treemacs :variables
              treemacs-lock-width t
              treemacs-use-git-mode 'deferred
              treemacs-use-all-the-icons-theme t
              treemacs-use-follow-mode t
              treemacs-use-filewatch-mode t
              treemacs-use-follow-mode 'tag)
    vagrant
    version-control
    vue
    (xclipboard :variables
                xclipboard-enable-cliphist t)
    yaml

    ;;; Local layers
    savegeometry
    falkor     ;; ENSURE it is added at the LAST position
    )
  )

;; List of additional packages that will be installed without being wrapped
;; in a layer
(defvar local-settings/dotspacemacs-additional-packages
  '(bury-successful-compilation
    doom-themes
    evil-smartparens
    mic-paren
    time-stamp
    solo-jazz-theme
    ws-butler
    ))

;; List of packages that cannot be updated.
(defvar local-settings/dotspacemacs-frozen-packages '())

;; A list of packages that will not be installed and loaded.
(defvar local-settings/dotspacemacs-excluded-packages '(
                                                        company-lsp
                                                        ))
