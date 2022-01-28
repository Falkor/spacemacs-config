;;; local-settings's Spacemacs --- User configs -*- mode: emacs-lisp; -*-
;;; Time-stamp: <Fri 2022-01-28 15:28 svarrette>
;;;; Commentary

;; Special settings
;;

(provide 'local-settings/user-configs)

;;;; === Display ====
(defun local-settings/display ()
  "Local Spacemacs User settings for general Look and Feel"
  ;; spaceline-all-the-icons
  ;; Custom components of the theme
  ;; https://github.com/domtronn/spaceline-all-the-icons.el#disabled-segments
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


;;;; Company and LSP -- NOT USED for the moment.
;;; https://gitter.im/emacs-lsp/lsp-mode?at=5d64447c07d1ff39f88ae388
;; finally not used
(defun local-settings/company-lsp-config ()
  "Local Spacemacs User settings for Company"
  ;; (require 'xclip)
  ;; (xclip-mode 1)

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

  (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

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
