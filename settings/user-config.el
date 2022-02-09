;;; local-settings's Spacemacs --- User configs -*- mode: emacs-lisp; -*-
;;; Time-stamp: <Mon 2022-02-07 10:44 svarrette>
;;;; Commentary

;; Special settings, in alphabetical order
;;

(provide 'local-settings/user-configs)



;;;; ==== User Reserved Key bindings (SPC o [...])
(defun local-settings/keybindings-user-reserved ()
  "User reserved key bindings (under SPC o), guaranteed to never conflict with
Spacemacs default key bindings. "
  ;; (define-key evil-normal-state-map (kbd "SPC o t") 'org-table-create) ;;DOES
  ;; NOT WORK
  )


;;;; Auto-completion
(defun local-settings/auto-completion-config ()
  "Local Spacemacs User settings for Auto-completion"

  (use-package company
    :ensure t
    :diminish t
    :init
    (add-hook 'after-init-hook 'global-company-mode)
    (add-hook 'elm-mode-hook 'company-mode)
    :config
    (setq company-idle-delay 0.02
          company-minimum-prefix-length 2
          company-echo-delay 0
          company-dabbrev-downcase nil
          company-dabbrev-code-everywhere t
          company-dabbrev-code-modes t
          company-dabbrev-code-ignore-case t
          company-tooltip-align-annotations t
          company-transformers '(company-sort-prefer-same-case-prefix)))

  ;; integrate yasnippet into company
  (yas-global-mode 1)
  (global-set-key (kbd "C-<return>") 'hippie-expand)

  (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  )


;;;; Company and LSP -- NOT USED for the moment.
;;; https://gitter.im/emacs-lsp/lsp-mode?at=5d64447c07d1ff39f88ae388
;; finally not used
(defun local-settings/company-lsp-config ()
  "Local Spacemacs User settings for Company"


  ;; (use-package lsp-mode
  ;;   :ensure t
  ;;   :commands lsp
  ;;   :hook (elm-mode . lsp)
  ;;   :config
  ;;   (setq lsp-prefer-flymake nil
  ;;         lsp-enable-symbol-highlighting nil
  ;;         lsp-enable-snippet nil
  ;;         lsp-ui-sideline-enable nil
  ;;         lsp-ui-flycheck-enable t))

  ;; (use-package lsp-ui
  ;;   :ensure t
  ;;   :commands lsp-ui-mode)

  ;; (use-package company-lsp
  ;;   :ensure t
  ;;   :commands company-lsp
  ;;   :config
  ;;   (push '(company-lsp :with company-yasnippet) company-backends)
  ;;   )

  ;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
  ;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
  ;; (use-package dap-mode)

  ;; (add-hook 'elm-mode-hook (lambda () (defalias 'company-elm 'company-lsp)))
  ;; (with-eval-after-load 'lsp-mode
  ;;   ;; company-lsp is NO LONGER supported
  ;;   ;; compliance with Company and yasnippet in the drop-down menu:
  ;;   ;;   https://github.com/tigersoldier/company-lsp/issues/119
  ;;   (setq company-lsp-enable-snippet t)
  ;;   (setq lsp-enable-snippet t)
  ;;   ;; (setq lsp-auto-configure nil)
  ;;   ;; (lsp-register-client
  ;;   ;;  (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
  ;;   ;;                   :major-modes '(go-mode)
  ;;   ;;                   :priority 0
  ;;   ;;                   :initialization-options 'lsp-clients-go--make-init-options
  ;;   ;;                   :server-id 'gopls
  ;;   ;;                   :library-folders-fn (lambda (_workspace)
  ;;   ;;                                         lsp-clients-go-library-directories)))
  ;;   ;; (require 'lsp-ui)
  ;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  ;;   (require 'lsp-ui-flycheck)
  ;;   (lsp-ui-flycheck-enable t)
  ;;   (flycheck-mode 1)
  ;;   (require 'company)
  ;;   (push '(company-lsp :with company-yasnippet) company-backends)
  ;;   ;; Better sorting
  ;;   ;;(setq company-transformers '(company-sort-prefer-same-case-prefix)
  )


;;;;; === Compiling  https://develop.spacemacs.org/doc/DOCUMENTATION.html#compiling
(defun local-settings/compile-config ()
  "Local Spacemacs User settings for compilation "
  (setq compilation-window-height 10)

  ;; Compile - 'SPC c m' to run helm-make
  (spacemacs/set-leader-keys "c c" 'compile)              ;; inverse default setting 'SPC c c' and 'SPC c C'
  (spacemacs/set-leader-keys "c C" 'helm-make-projectile) ;; with below
  (global-set-key (kbd "C-x C-e")  'compile) ;; SPC c C
  (global-set-key (kbd "<f6>")     'compile)
  )



;;;; === Display ====
(defun local-settings/display ()
  "Local Spacemacs User settings for general Look and Feel"
  ;; spaceline-all-the-icons
  ;; See also
  ;; https://git.madhouse-project.org/algernon/emacs.d/src/branch/master/layers/+look-n-feel/algernon-modeline/packages.el
  (spaceline-all-the-icons--setup-package-updates)
  (spaceline-all-the-icons--setup-git-ahead)

  (setq spaceline-all-the-icons-highlight-file-name t
        spaceline-all-the-icons-file-name-highlight "#f3ea98"
        spaceline-all-the-icons-hide-long-buffer-path t
        )

  ;; Toggles
  ;; Custom components of the theme
  ;; https://github.com/domtronn/spaceline-all-the-icons.el#disabled-segments
  (spaceline-toggle-all-the-icons-buffer-size-off)
  (spaceline-toggle-all-the-icons-buffer-position-on)

  (spaceline-toggle-all-the-icons-dedicated-on)
  ;;(spaceline-toggle-all-the-icons-buffer-encoding-abbrev-on)
  (spaceline-toggle-all-the-icons-weather-on)



  ;; !!!!!!!!!!!!!!!!
  ;; !! https://github.com/domtronn/spaceline-all-the-icons.el/issues/55
  ;; !! If you remove this - expect EXTREMELY degraded performance
  ;; !! on files of more-or-less any size and of any type
  ;; !!!!!!!!!!!!!!!!
  (spaceline-toggle-projectile-root-off)
  (spaceline-toggle-all-the-icons-projectile-off)
  (spaceline-toggle-all-the-icons-buffer-id-off)


  ;;(setq initial-frame-alist '((top . 30) (left . 700) (width . 212) (height . 81)))
  ;; Use Mouse to copy/paste
  ;; (xterm-mouse-mode -1)


  )

(defun local-settings/evil-bindings ()
  "Local Spacemacs User settings for Evil bindings customizations"
  ;; === Search and replace
  ;; Better vim-compliant search with <up> and <down> key
  (evil-select-search-module 'evil-search-module 'evil-search)
  ;; (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
  ;; (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)

  ;; DO to insert mode on double-click DOES NOT WORK
  ;; (define-key evil-normal-state-map [double-mouse-1]
  ;;   (lambda ((custom-set-variables
  ;;     (interactive)
  ;;     (evil-insert)))

  ;; Reminder: From visual mode:  three different "visual" states:
  ;;    Char: 'v'   from normal mode
  ;;    Line  'S-v' from normal mode
  ;;    Block 'C-v' from normal mode
  ;; Shift-arrow to also select text in normal mode
  ;; Alternative: v for visual then arrow
  (define-key evil-normal-state-map (kbd "S-<left>")
    (lambda ()
      (interactive)
      (evil-visual-char)
      (backward-char)))
  (define-key evil-normal-state-map (kbd "S-<right>")
    (lambda ()
      (interactive)
      (evil-visual-char)
      (forward-char)))
  (define-key evil-normal-state-map (kbd "S-<down>")
    (lambda ()
      (interactive)
      (evil-visual-char)
      (evil-next-line)))
  (define-key evil-normal-state-map (kbd "S-<up>")
    (lambda ()
      (interactive)
      (evil-visual-char)
      (evil-previous-line)))
  (define-key evil-visual-state-map (kbd "S-<left>")   #'backward-char)
  (define-key evil-visual-state-map (kbd "S-<right>")  #'forward-char)

  ;; Remap C-e to end of line
  (define-key evil-normal-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-visual-state-map (kbd "C-e") 'end-of-line)

  ;; revert C-w to delete previous word even in insert
  (define-key evil-normal-state-map (kbd "C-!") 'evil-windows-map)
  (define-key evil-visual-state-map (kbd "C-!") 'evil-windows-map)
  (define-key evil-normal-state-map (kbd "C-w") 'spacemacs/backward-kill-word-or-region)
  (define-key evil-visual-state-map (kbd "C-w") 'spacemacs/backward-kill-word-or-region)

  ;; Backspace in visual mode also delete selected region
  (define-key evil-visual-state-map (kbd "<backspace>") 'delete-forward-char)

  ;; Emacs-like movement of cursor with Evil (left in '^' goes to end of previous line)
  (setq evil-cross-lines t)
  )

;;;;; ===  Geolocation - https://develop.spacemacs.org/layers/+tools/geolocation/README.html
(defun local-settings/geolocation-config ()
  "Local Spacemacs User settings for geolocation"
  (setq calendar-location-name "Thionville, France"
        calendar-latitude 49.3
        calendar-longitude 6.2)
  ;; OpenWeatherMap API key, to define in settings/private.el
  ;; (setq sunshine-appid "your-apikey")
  ;; Get you city ID from city.list.json.gz under http://bulk.openweathermap.org/sample/
  (setq sunshine-location   "57100,FR") ;; City ID (Thionville): 2972811
  (setq sunshine-units      'metric)
  (setq sunshine-show-icons t)
  )


;;;; === General Look and Feel ===
(defun local-settings/look-and-feel ()
  "Local Spacemacs User settings for general Look and Feel"
  ;; automatic wrapping of lines and insertion of newlines when the cursor
  ;; goes over the column limit.
  (setq-default fill-column 80)

  ;; === Mouse settings
  ;; Correct copy-paste to clipboard
  (setq select-enable-clipboard t)
  ;; after mouse selection in X11, you can paste by `yank' in emacs
  ;;(setq x-select-enable-primary t)
  (setq mouse-drag-copy-region  t)

  ;; === General cursor interaction
  ;; replace highlighted text with what I type
  (delete-selection-mode 1)
  ;; Make cursor the width of the character it is under i.e. full width of a TAB
  (setq x-stretch-cursor t)
  ;; show trailing whitespace
  (add-hook 'prog-mode-hook (lambda ()
                              (setq show-trailing-whitespace t)))

                                        ; helm-swoop
  (setq helm-swoop-use-fuzzy-match t)
  (setq helm-swoop-use-line-number-face t)
  )


;;;; LaTeX - https://develop.spacemacs.org/layers/+lang/latex/README.html
(defun local-settings/latex-config ()
  (setq TeX-auto-local ".texinfo")
  )

;;;; LSP https://develop.spacemacs.org/layers/+tools/lsp/README.html
(defun local-settings/lsp-config ()
  "Local Spacemacs User settings for LSP"
  (spacemacs/lsp-define-extensions "c-c++" 'refs-address
                                   "textDocument/references"
                                   '(plist-put (lsp--text-document-position-params) :context '(:role 128)))
  (spacemacs/lsp-bind-extensions-for-mode mode "c-c++"
                                          "&" 'refs-address
                                          "R" 'refs-read
                                          "W" 'refs-write
                                          "c" 'callers
                                          "C" 'callees
                                          "v" 'vars)
  )

;;;; Magit -  https://develop.spacemacs.org/layers/LAYERS.html#git
(defun local-settings/magit-config ()
  "Local Spacemacs User settings for Magit"
  (setq-default git-magit-status-fullscreen t)
  ;; (setq magit-commit-arguments '("--signoff"))  ;; DOES NOT WORK
  (setq magit-stage-all-confirm   nil)
  (setq magit-unstage-all-confirm nil)
  (setq magit-commit-all-when-nothing-staged t)
  ;; When in magit-section-movement-hook (after commit), remap the existing
  ;; keys to something more natural to me. Existing bindings:
  ;;   C-k to go to the section backward (magit-section-backward)
  ;;   C-j to go to the section forward  (magit-section-forward)
  ;;
  ;; Other shortcuts good to know when under magit-status:
  ;;   gt  go to untracked
  ;;
  (evil-define-key 'normal magit-mode-map (kbd "C-p")  'magit-section-backward)
  (evil-define-key 'normal magit-mode-map (kbd "C-n")  'magit-section-forward)
  ;; commit enter in insert mode -- C-c C-c to write the commit message
  (add-hook 'git-commit-mode-hook 'evil-insert-state)


  ;; Make custom gitlab instance (gitlab.uni.lu) recognized as elligible forge
  ;; repository - C h v to check the value of forge-alist
  (with-eval-after-load 'forge
    ;; Each entry must follow (GITHOST APIHOST ID CLASS)
    (add-to-list 'forge-alist
                 '("gitlab.uni.lu"
                   "gitlab.uni.lu/api/v4"
                   "gitlab.uni.lu"
                   forge-gitlab-repository)))
  )


;;;; Markdown - https://develop.spacemacs.org/layers/+lang/markdown/README.html
(defun local-settings/markdown-config ()
  "Local Spacemacs User settings for Markdown"
  ;; re-enable orgtbl-mode disabled from https://github.com/syl20bnr/spacemacs/issues/15256
  (add-hook 'markdown-mode-hook 'orgtbl-mode)
  ;; Complete the default C-c |
  (spacemacs/set-leader-keys "o t"   'org-table-create)
  (spacemacs/set-leader-keys "m t t" 'org-table-create)
  )



;;;; Ranger - https://develop.spacemacs.org/layers/+tools/ranger/README.html
(defun local-settings/ranger-config ()
  "Local Spacemacs User settings for Ranger"
  (setq ranger-cleanup-on-disable t)
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
  )





;;;; Smart Parentheses
(defun local-settings/parenthesis ()
  ;; see https://medium.com/@ageekymonk/setting-up-spacemacs-for-development-part-3-developer-environment-4bc7961934f4
  (use-package smartparens
    :defer t
    :diminish ""
    :bind (("C-)" . sp-forward-slurp-sexp)
           ("C-}" . sp-forward-barf-sexp)
           ("C-(" . sp-splice-sexp))
    :config
    (progn
      (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
      ;;(push 'yas-installed-snippets-dir yas-snippet-dirs)
      )
    )
  ;; Better highlight matching parenthesis
  (use-package rainbow-delimiters
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; to enable it in all programming-related modes
    (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                        :foreground "red"
                        :inherit 'error
                        :box t)
    )
  ;;(require 'paren)
  ;;(show-paren-mode t)
  ;;(setq show-paren-style 'expression)
  ;;(set-face-background 'show-paren-match-face "turquoise")
  ;;(set-face-foreground 'show-paren-mismatch-face "red")
  ;;(set-face-attribute 'show-paren-mismatch-face nil
  ;;                    :weight 'bold :underline t :overline nil :slant 'normal)
  ;; Turn this off to stop it interfering with mic-paren.
  ;;(set-face-attribute 'sp-show-pair-match-face nil    :foreground 'unspecified :background 'unspecified)
  ;;(set-face-attribute 'sp-show-pair-mismatch-face nil :foreground 'unspecified :background 'unspecified)
  ;; show matching parenthesis, even if found outside the present screen.
  ;; see http://www.emacswiki.org/emacs/MicParen
  ;; (require 'mic-paren)                    ; loading
  ;; (paren-activate)                        ; activating
  ;; (use-package mic-paren
  ;;   :init
  ;;   (setq show-paren-delay 0)
  ;;   :config
  ;;   (show-paren-mode +1))
  )
