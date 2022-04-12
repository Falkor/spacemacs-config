;;; Setup -*- lexical-binding: t; -*-
;;; Time-stamp: <Tue 2022-04-12 09:46 svarrette>
;;;; Commentary

;;  _____     _ _              _       ____
;; |  ___|_ _| | | _____  _ __( )___  / ___| _ __   __ _  ___ ___ _ __ ___   __ _  ___ ___
;; | |_ / _` | | |/ / _ \| '__|// __| \___ \| '_ \ / _` |/ __/ _ \ '_ ` _ \ / _` |/ __/ __|
;; |  _| (_| | |   < (_) | |    \__ \  ___) | |_) | (_| | (_|  __/ | | | | | (_| | (__\__ \
;; |_|  \__,_|_|_|\_\___/|_|    |___/ |____/| .__/ \__,_|\___\___|_| |_| |_|\__,_|\___|___/
;;                                          |_|
;;
;;         Copyright (c) 2022 Sebastien Varrrette <sebastien.varrrette@gmail.com>
;;
;; -- Sebastien Varrette aka Falkor's Spacemacs Configuration --
;; -- MIT License --
;; -- Emacs 27.1 ~ Spacemacs Dev Branch 0.999.x ~ pkgs updated: 1/21/19 --
;; -- http://modernemacs.com --
;;
;; Personal layers host most of my configuration - see README.
;; Ligatures and icons require installation - see README.
;; Resources:
;;   - https://github.com/Falkor/emacs-config2 (previous Emacs config)
;;   - https://github.com/ekaschalk/.spacemacs.d

;;;; Constants

(defconst system/linux?   (eq system-type 'gnu/linux) "Are we on a linux machine?")
(defconst system/mac?     (eq system-type 'darwin)    "Are we on a macOS machine?")
(defconst system/windows? (not (or system/linux? system/mac?)) "Are we on windows machine?")

;; Helper function for root path to a given configuration
(defun spacemacs/get-conf-path(path)
  "Appends argument at the end of user-emacs-directory (~/.config/emacs)
   using expand-file-name"
  (expand-file-name path user-emacs-directory))
(defun local/get-conf-path(path)
  "Appends argument at the end of dotspacemacs-directory (~/.spacemacs.d)
   using expand-file-name"
  (expand-file-name path dotspacemacs-directory))

;; ============================ Let's go! ============================
(load (local/get-conf-path "settings/layers.el"))
(require 'local-settings/configuration-layers)
(load (local/get-conf-path "settings/user-config.el"))
(require 'local-settings/user-configs)

;; https://github.com/practicalli/spacemacs/blob/main/source-control/forge-configuration.md
;; Authentication source - Set the files that are searched for writing tokens
(setq local/authinfo (local/get-conf-path ".authinfo.gpg"))
(when (file-exists-p local/authinfo)
  (setq auth-sources
        '((:source "~/.spacemacs.d/.authinfo.gpg"))))

;; private settings
(setq local/private-settings (local/get-conf-path "settings/private.el"))
(when (file-exists-p local/private-settings)
  (load local/private-settings))

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")

   ;; List of configuration layers to load -- see settings/layers.el
   dotspacemacs-configuration-layers local-settings/dotspacemacs-configuration-layers

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   ;;  see settings/layers.el
   dotspacemacs-additional-packages  local-settings/dotspacemacs-additional-packages

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages  local-settings/dotspacemacs-frozen-packages

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages local-settings/dotspacemacs-excluded-packages

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'markdown-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'markdown-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; -- Screenshot for themes --
   ;;    Doom: https://github.com/doomemacs/themes/tree/screenshots
   ;;    Theme Megapack: https://themegallery.robdor.com/
   dotspacemacs-themes '(
                         doom-tomorrow-day
                         doom-opera-light
                         doom-one-light
                         spacemacs-light
                         )
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(all-the-icons :separator arrow :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("MesloLGS NF"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "C-SPC"  ; "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 10

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%t: %a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source t

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq evil-want-keybinding nil)

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; =====================
  ;; === Look and Feel ===
  ;; =====================
  (local-settings/look-and-feel)

  ;; ====================================
  ;; === Evil Bindings Customizations ===
  ;; ====================================
  (local-settings/evil-bindings)

  ;; ===============
  ;; === Display ===
  ;; ===============
  (local-settings/display)
  (local-settings/parenthesis)


  ;; =============================
  ;; === Layers Customizations ===
  ;; =============================
  ;;;; Auto-completion
  (local-settings/auto-completion-config)
  ;; (local-settings/company-lsp-config)


  ;;;; -- Compiling - https://develop.spacemacs.org/doc/DOCUMENTATION.html#compiling
  (local-settings/compile-config)


;;;; -- Copy-as Format  - https://develop.spacemacs.org/layers/+misc/copy-as-format/README.html
  (setq copy-as-format-default "markdown")

  ;;;; -- drt-indent - https://develop.spacemacs.org/layers/+misc/dtrt-indent/README.html
  (add-hook 'prog-mode-hook #'(lambda ()
                                (dtrt-indent-mode)
                                (dtrt-indent-adapt)))

  ;;;; Easybuild / Easyconfigs
  (add-to-list 'auto-mode-alist '("\\.eb\\'" . python-mode))

  ;;;; Geolocation - https://develop.spacemacs.org/layers/+tools/geolocation/README.html
  (local-settings/geolocation-config)


  ;;;; LaTeX
  (local-settings/latex-config)

  ;;;; LSP
  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  ;; (local-settings/lsp-config)

  ;; -- [Ma]git -  https://develop.spacemacs.org/layers/LAYERS.html#git
  (local-settings/magit-config)

  ;; Markdown
  (local-settings/markdown-config)
  ;; (local-settings/keybindings-user-reserved)
  ;; (evil-define-key 'normal markdown-mode-map (kbd "C-c-|")  'org-table-create)


  ;; -- Ranger - https://develop.spacemacs.org/layers/+tools/ranger/README.html
  (local-settings/ranger-config)

  ;; -- Rebox - https://develop.spacemacs.org/layers/+tools/rebox/README.html
  (setq rebox-style-loop '(71 72 73))

  ;; -- Treemacs
  ;; https://issueexplorer.com/issue/Alexander-Miller/treemacs/826
  ;; Single Click in Treemacs
  (with-eval-after-load 'treemacs
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))


  ;; ==============================
  ;; === Personnal Key bindings ===
  ;; ==============================
  ;; undo on C-z instead of suspend-frame
  (global-set-key (kbd "C-z") 'undo-tree-undo)

  ;; better search  SPC s s
  (global-set-key (kbd "C-s") 'helm-swoop-without-pre-input)
  ;; better replace withe Anzu - https://github.com/emacsorphanage/anzu
  (global-set-key (kbd "H-q") 'anzu-query-replace)


  ;; Beginning / End of line
  (global-set-key (kbd "<home>") 'beginning-of-line)
  (global-set-key (kbd "<end>")  'end-of-line)

  ;; comment/uncomment line  SPC c l
  (global-set-key (kbd "C-;") 'spacemacs/comment-or-uncomment-lines)

  ;; === Buffer/Window change
  ;; Move from one buffer to another using 'C-<' and 'C->' OR better: SPC b p and SPC b n
  (global-set-key (kbd "C-<") 'previous-buffer)
  (global-set-key (kbd "C->") 'next-buffer)
  ;; === Window switching   SPC w w
  (global-set-key [C-prior] 'other-window)
  (global-set-key [C-next]  'other-window)

  ;; === Kill this buffer ===
  (global-set-key (kbd "C-q") 'kill-this-buffer)

  ;; Markdown preview with Marked 2
  (eval-after-load 'markdown-mode
    '(define-key markdown-mode-map (kbd "C-c C-v") 'falkor/markdown-preview-file))

  ;; Font size
  ;; I may prefer C-+ and C-- for window enlarge/schrink
  (global-set-key (kbd "C-+")    'text-scale-increase)
  (global-set-key (kbd "C--")    'text-scale-decrease)

  ;; kill buffer
  (spacemacs/set-leader-keys "b k" 'spacemacs/kill-this-buffer)

  ;; run shell
  (spacemacs/set-leader-keys "$" 'spacemacs/default-pop-shell)

  ;; projectile
  (global-set-key (kbd "C-x C-p") 'helm-projectile)                ;; SPC p h
  (global-set-key (kbd "C-x C-o") 'helm-projectile-switch-project) ;; SPC p l
  ;; open recent files SPC f r
  (global-set-key (kbd "C-x C-r") 'lazy-helm/helm-recentf)


  ;; ===========================
  ;; === Complementary Tools ===
  ;; ===========================

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-safe-themes
     '("8efa3d21b3fa1ac084798fae4e89848ec26ae5c724b9417caf4922f4b2e31c2a" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" default))
   '(evil-want-Y-yank-to-eol nil)
   '(hl-todo-keyword-faces
     '(("TODO" . "#dc752f")
       ("NEXT" . "#dc752f")
       ("THEM" . "#2d9574")
       ("PROG" . "#4f97d7")
       ("OKAY" . "#4f97d7")
       ("DONT" . "#f2241f")
       ("FAIL" . "#f2241f")
       ("DONE" . "#86dc2f")
       ("NOTE" . "#b1951d")
       ("KLUDGE" . "#b1951d")
       ("HACK" . "#b1951d")
       ("TEMP" . "#b1951d")
       ("FIXME" . "#dc752f")
       ("XXX+" . "#dc752f")
       ("\\?\\?\\?+" . "#dc752f")))
   '(next-error-recenter '(4))
   '(org-fontify-done-headline nil)
   '(org-fontify-todo-headline nil)
   '(package-selected-packages
     '(mic-paren yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode pydoc py-isort poetry transient pippel pipenv pyvenv pip-requirements nose lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-gtags helm-cscope xcscope ggtags dap-mode lsp-treemacs bui lsp-mode lv cython-mode counsel-gtags counsel swiper ivy company-anaconda blacken anaconda-mode pythonic keycast guide-key vmd-mode valign mmm-mode markdown-toc markdown-mode gh-md emoji-cheat-sheet-plus company-emoji company solo-jazz-theme zonokai-emacs zenburn-theme zen-and-art-theme ws-butler writeroom-mode winum white-sand-theme which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection string-edit spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme restart-emacs request rebecca-theme rainbow-delimiters railscasts-theme quickrun purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox overseer organic-green-theme org-superstar open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme nameless mustang-theme multi-line monokai-theme monochrome-theme molokai-theme moe-theme modus-themes minimal-theme material-theme majapahit-theme madhat2r-theme macrostep lush-theme lorem-ipsum link-hint light-soap-theme kaolin-themes jbeans-theme jazz-theme ir-black-theme inspector inkpot-theme info+ indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gandalf-theme font-lock+ flycheck-package flycheck-elsa flx-ido flatui-theme flatland-theme farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme emr elisp-slime-nav editorconfig dumb-jump drag-stuff dracula-theme dotenv-mode doom-themes django-theme dired-quick-sort diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line))
   )
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
   )
  )
