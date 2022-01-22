;;; Falkor's Spacemacs --- Settings -*- mode: emacs-lisp; -*-
;;; Time-stamp: <Sat 2022-01-22 17:53 svarrette>
;;;; Commentary


;; Time-stamp: <Sat 2022-01-22 10:41 svarrette>
;;
;; Defines the layers to configure
;;

(provide 'falkor/configuration-layers)

;;  List of configuration layers to load.
(defvar falkor/dotspacemacs-configuration-layers
  '(;; ----------------------------------------------------------------
    ;; press `SPC f e R' (Vim style) or `M-m f e R' (Emacs style) to
    ;; install them.
    ;; ----------------------------------------------------------------
    ansible
    (auto-completion :variables
                     auto-completion-complete-with-key-sequence-delay 0.2
                     auto-completion-enable-help-tooltip 'manual
                     auto-completion-enable-sort-by-usage t
                     :disabled-for
                     org
                     git)
    (better-defaults :variables
                     better-defaults-move-to-beginning-of-code-first t
                     better-defaults-move-to-end-of-code-first t)
    dtrt-indent
    ;;emacs-lisp
    (geolocation :variables
                 ;; geolocation-enable-automatic-theme-changer t
                 geolocation-enable-location-service t
                 geolocation-enable-weather-forecast t)
    (git :variables
         git-enable-magit-delta-plugin t   ;; brew install git-delta
         git-enable-magit-gitflow-plugin t ;; brew install git-flow
         )
    github
    helm
    html
    latex
    (lsp :variables
         ;; default segments

         lsp-modeline-code-actions-segments '(count icon))
    (markdown :variables
              markdown-open-command (concat dotspacemacs-directory "markdown_open")
              markdown-italic-underscore t
              markdown-live-preview-engine 'vmd
              )
    multiple-cursors
    (org :variables
         org-enable-github-support t)
    (osx :variables
         osx-option-as 'none       ;; Very important to allow for all keys \
         osx-right-option-as 'meta)
    python
    themes-megapack
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
    ;; spell-checking
    syntax-checking
    (templates :variables
               templates-use-default-templates nil
               templates-private-directory (concat dotspacemacs-directory "templates"))
    (treemacs :variables
              treemacs-lock-width t
              treemacs-use-git-mode 'deferred
              treemacs-use-all-the-icons-theme t
              treemacs-use-follow-mode t
              treemacs-use-filewatch-mode t
              treemacs-use-follow-mode 'tag)
    version-control
    )
  )

;; List of additional packages that will be installed without being wrapped
;; in a layer
(defvar falkor/dotspacemacs-additional-packages
  '(bury-successful-compilation
    doom-themes
    mic-paren
    time-stamp
    solo-jazz-theme
    ws-butler
    ))

;; List of packages that cannot be updated.
(defvar falkor/dotspacemacs-frozen-packages '())

;; A list of packages that will not be installed and loaded.
(defvar falkor/dotspacemacs-excluded-packages '())
