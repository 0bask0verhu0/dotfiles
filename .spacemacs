;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

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
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(toml
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     (c-c++ :variables c-c++-backend 'lsp-clangd)
     (conda
      :variables conda-anaconda-home "/home/bask_verhu/.conda")
     dap
     debug
     emacs-lisp
     git
     helm
     java
     (latex
      :variables
      latex-refresh-preview t
      latex-backend 'lsp
      latex-view-pdf-in-split-window t
      latex-build-command "LaTeX")
     lsp
     markdown
     themes-megapack
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp"
           mu4e-kill-layout-on-exit t)
     multiple-cursors
     org
     pandoc
     (python
      :variables python-backend 'lsp)
     pdf
     (ranger :variables
             ranger-override-dired 'ranger
             ranger-show-preview t)
     spacemacs-project
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     treemacs
     w3m
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(jupyter
                                      ob-async
                                      ;;ob-jupyter
                                      obsidian
                                      smtpmail
                                      lsp-java
                                      javadoc-lookup
                                      zmq
                                      )



   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

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
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
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
   dotspacemacs-editing-style 'vim

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

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

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

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

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
   dotspacemacs-themes '(gruber-darker
                         hemisu-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Px437 IBM VGA9"
                               :size 12.0
                               :weight regular
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

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
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'.
   dotspacemacs-enable-load-hints t

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
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

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
   dotspacemacs-scroll-bar-while-scrolling t

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

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

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
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `all



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
   dotspacemacs-home-shorten-agenda-source nil

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

  ;; whitespace-cleanup binding
  (keymap-global-set "C-c x <f5>" 'whitespace-cleanup)

  ;; writerroom-mode binding
  (keymap-global-set "C-c x <f6>" 'writeroom-mode)


  ;; vim-powerline
  (setq dotspacemacs-mode-line-theme 'vim-powerline)

  ;; mu4e settings
  (setq mu4e-update-interval 100)

  ;; allow for updating mail using U in main view:
  (setq mu4e-get-mail-command "/usr/bin/offlineimap")
  ;; turn off annoying warning messages
  (setq mu4e-index-update-error-warning nil)


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

  ;;org agenda files
  (setq org-agenda-files '("/home/bask_verhu/.agenda_files"))
  ;;import magic env path
  ;;(setq importmagic-python-interpreter "/home/bask_verhu/.conda/envs/myenv/bin/python2.7" )

  ;;babel for jupyter notebooks
  (use-package jupyter)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (julia . t)
     (python . t)
     (jupyter . t)
     (latex . t)
     (shell .t)))


  ;; lsp-java
  (require 'lsp-java)
  (add-hook 'java-mode-hook 'lsp)
  (condition-case nil
      (require 'use-package)
    (file-error
     (require 'package)
     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
     (package-initialize)
     (package-refresh-contents)
     (package-install 'use-package)
     (setq use-package-always-ensure t)
     (require 'use-package)))

  (use-package projectile)
  (use-package flycheck)
  (use-package yasnippet :config (yas-global-mode))
  (use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
  (use-package hydra)
  (use-package company)
  (use-package lsp-ui)
  (use-package which-key :config (which-key-mode))
  (use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
  (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
  (use-package dap-java :ensure nil)
  (use-package helm-lsp)
  (use-package helm
    :config (helm-mode))
  (use-package lsp-treemacs)

  ;; gruber-darker theme
  (add-to-list 'custom-theme-load-path
               "home/bask_verhu/.emacs.d/themes/gruber-darker-theme/")

  ;; W3M Configuration
  (setq w3m-home-page "https://www.google.com")
  ;; W3M Home Page
  (setq w3m-default-display-inline-images t)
  (setq w3m-default-toggle-inline-images t)
  ;; W3M default display images
  (setq w3m-command-arguments '("-cookie" "-F"))
  (setq w3m-use-cookies t)
  ;; W3M use cookies
  (setq browse-url-browser-function 'w3m-browse-url)
  ;; Browse url function use w3m
  (setq w3m-view-this-url-new-session-in-background t)
  ;; W3M view url new session in background


  ;; mu4e

  ;;; Set up some common mu4e variables
  (setq mail-user-agent 'sendmail-user-agent)

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-trash-folder  "/[Gmail].Trash")
  (setq mu4e-view-show-images t)
  (setq mu4e-view-show-addresses t)


  (setq mu4e-maildir-shortcuts
        '((:Maildir "/INBOX"            . ?i)
          (:Maildir "[Gmail].Sent Mail" . ?s)
          (:Maildir "[Gmail].Trash"     . ?t)
          (:Maildir "[Gmail].All Mail"  . ?a)))

  (add-to-list 'mu4e-bookmarks
               ;; :favorite t; i.e., use this one for the modeline
               '(:query "Maildir:/INBOX" :name "INBOX" :key ?i :favorite t))

  ;;turn off annoying minibuffer update index notification
  (add-hook 'minibuffer-setup-hook
            (lambda () (setq mu4e-hide-index-messages t)))
  (add-hook 'minibuffer-exit-hook
            (lambda () (setq mu4e-hide-index-messages nil)))





  ;; personal info
  (setq user-mail-address "mpbarbella@gmail.com")
  (setq user-full-name "Michael P. Barbella" )
  (setq mu4e-compose-signature "Regards,\n Michael P. Barbella")

  ;; sending mail
  (require 'smtpmail)
  (setq message-send-mail-function 'sendmail-send-it)
  (setq smtpmail-smtp-user "mpbarbella@gmail.com" )
  (setq starttls-use-gnutls t )
  (setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)) )
  (setq smtpmail-auth-credentials '(("smtp.gmail.com" 587 "mpbarbella@gmail.com" nil)) )
  (setq smtpmail-default-smtp-server "smtp.gmail.com" )
  (setq smtpmail-smtp-server         "smtp.gmail.com" )
  (setq smtpmail-stream-type         'starttls )
  (setq smtpmail-smtp-service 587 )



  ;; Obsidian
  (obsidian-specify-path "/home/bask_verhu/shared/education/CSU/Fall 2024/")
  ;; If you want a different directory of `obsidian-capture':
  ;; (setq obsidian-inbox-directory "Inbox")
  ;; Clicking on a wiki link referring a non-existing file the file can be
  ;; created in the inbox (t) or next to the file with the link (nil).
  ;; Default: t - creating in the inbox
                                        ;(setq obsidian-wiki-link-create-file-in-inbox nil)
  ;; You may want to define a folder for daily notes. By default it is the inbox.
                                        ;(setq obsidian-daily-notes-directory "Daily Notes")
  ;; Directory of note templates, unset (nil) by default
                                        ;(setq obsidian-templates-directory "Templates")
  ;; Daily Note template name - requires a template directory. Default: Daily Note Template.md
                                        ;(setq obsidian-daily-note-template "Daily Note Template.md")


  ;; Define obsidian-mode bindings
  (add-hook
   'obsidian-mode-hook
   (lambda ()
     ;; Replace standard command with Obsidian.el's in obsidian vault:
     (local-set-key (kbd "C-c C-o") 'obsidian-follow-link-at-point)

     ;; Use either `obsidian-insert-wikilink' or `obsidian-insert-link':
     (local-set-key (kbd "C-c C-l") 'obsidian-insert-wikilink)

     ;; Following backlinks
     (local-set-key (kbd "C-c C-b") 'obsidian-backlink-jump)))

  ;; Optionally you can also bind a few functions:
  ;; replace "YOUR_BINDING" with the key of your choice:
  ;;(global-set-key (kbd "YOUR_BINDING") 'obsidian-jump)       ;; Opening a note
  ;;(global-set-key (kbd "YOUR_BINDING") 'obsidian-capture)    ;; Capturing a new note in the inbox
  ;;(global-set-key (kbd "YOUR_BINDING") 'obsidian-daily-note) ;; Creating daily note

  ;; Activate detection of Obsidian vault
  (global-obsidian-mode t)

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
   '(blink-cursor-mode t)
   '(browse-url-browser-function 'browse-url-firefox)
   '(cua-normal-cursor-color "gray")
   '(desktop-save t)
   '(desktop-save-mode t)
   '(display-time-day-and-date t)
   '(display-time-mode t)
   '(evil-collection-want-unimpaired-p nil)
   '(evil-escape-mode t)
   '(evil-lion-mode t)
   '(evil-lisp-state-global t)
   '(evil-mode t)
   '(evil-org-use-additional-insert t)
   '(evil-shift-width 2)
   '(evil-undo-system 'undo-fu)
   '(evil-want-C-i-jump nil)
   '(evil-want-C-u-scroll t)
   '(evil-want-keybinding t)
   '(global-evil-surround-mode t)
   '(global-term-cursor-mode t)
   '(gnus-summary-resend-default-address nil)
   '(helm-default-external-file-browser "firefox")
   '(helm-surfraw-default-browser-function 'firefox)
   '(importmagic-python-interpreter
     "home/bask_verhu/.conda/envs/myenv/CS314_spacemacs/bin/python2.7")
   '(message-send-mail-function 'message-send-mail-with-sendmail)
   '(message-signature t)
   '(mu4e-attachment-dir "~/Downloads/")
   '(mu4e-completing-read-function 'completing-read)
   '(mu4e-compose-complete-only-personal t)
   '(mu4e-drafts-folder "/[Gmail].Drafts")
   '(mu4e-get-mail-command "/usr/bin/offlineimap")
   '(mu4e-hide-index-messages t)
   '(mu4e-index-update-error-warning nil)
   '(mu4e-index-update-in-background t)
   '(mu4e-maildir-shortcuts
     '((:Maildir "/INBOX" . 105)
       (:Maildir "[Gmail].Sent Mail" . 115)
       (:Maildir "[Gmail].Trash" . 116)
       (:Maildir "[Gmail].All Mail" . 97)))
   '(mu4e-modeline-mode t)
   '(mu4e-org-support nil)
   '(mu4e-trash-folder "/[Gmail].Trash")
   '(mu4e-update-interval 300)
   '(mu4e-use-fancy-chars t)
   '(org-agenda-files nil)
   '(org-link-frame-setup
     '((vm . vm-visit-folder-other-frame)
       (vm-imap . vm-visit-imap-folder-other-frame)
       (gnus . org-gnus-no-new-news)
       (file . find-file)
       (wl . wl-other-frame)))
   '(org-startup-with-latex-preview t)
   '(package-selected-packages
     '(helm-w3m toml-mode cdlatex company-auctex company-math company-reftex evil-tex auctex consult math-symbol-lists importmagic ob-async xah-fly-keys jupyter websocket zmq blacken code-cells company-anaconda anaconda-mode conda cython-mode helm-pydoc epc ctable concurrent live-py-mode lsp-pyright pip-requirements pipenv load-env-vars pippel poetry py-isort pydoc pyenv-mode pythonic pylookup pytest pyvenv sphinx-doc yapfify ranger groovy-imports pcache groovy-mode maven-test-mode mvn doom-modeline shrink-path nerd-icons ox-pandoc pandoc-mode smudge oauth2 emms helm-spotify-plus multi spotify javadoc-lookup lsp-java elgrep obsidian add-node-modules-path counsel-gtags counsel swiper ivy ggtags impatient-mode import-js grizzl js-doc js2-refactor multiple-cursors livid-mode nodejs-repl npm-mode prettier-js skewer-mode js2-mode simple-httpd tern web-beautify helm-mu w3m pdf-view-restore pdf-tools tablist realgud test-simple loc-changes load-relative dap-mode lsp-docker bui ccls company-c-headers company-rtags company-ycmd cpp-auto-include disaster flycheck-rtags flycheck-ycmd gendoxy google-c-style helm-rtags rtags ycmd request-deferred afternoon-theme alect-themes ample-theme ample-zen-theme anti-zenburn-theme apropospriate-theme badwolf-theme birds-of-paradise-plus-theme bubbleberry-theme busybee-theme cherry-blossom-theme chocolate-theme clues-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow cyberpunk-theme dakrone-theme darkmine-theme darkokai-theme darktooth-theme django-theme doom-themes dracula-theme ef-themes espresso-theme exotica-theme eziam-themes farmhouse-themes flatland-theme flatui-theme gandalf-theme gotham-theme grandshell-theme gruvbox-theme hc-zenburn-theme hemisu-theme heroku-theme inkpot-theme ir-black-theme jazz-theme jbeans-theme kaolin-themes light-soap-theme lush-theme madhat2r-theme majapahit-themes material-theme minimal-theme modus-themes moe-theme molokai-theme monochrome-theme monokai-theme mustang-theme naquadah-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-themes organic-green-theme phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme professional-theme purple-haze-theme railscasts-theme rebecca-theme reverse-theme seti-theme smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme autothemer spacegray-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tango-2-theme tango-plus-theme tangotango-theme tao-theme toxi-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme white-sand-theme zen-and-art-theme zenburn-theme zonokai-emacs auto-dictionary auto-yasnippet code-review emojify deferred a eat esh-help eshell-prompt-extras eshell-z evil-org flycheck-pos-tip pos-tip flyspell-correct-helm flyspell-correct gh-md git-link git-messenger git-modes git-timemachine gitignore-templates gnuplot helm-c-yasnippet helm-company company helm-git-grep helm-ls-git helm-lsp helm-org-rifle htmlize lsp-origami origami lsp-treemacs lsp-ui lsp-mode markdown-toc multi-term multi-vterm xref mwim org-cliplink org-contrib org-download org-mime org-pomodoro alert log4e gntp org-present org-projectile org-project-capture org-category-capture org-rich-yank orgit-forge orgit forge yaml markdown-mode ghub closql emacsql treepy org shell-pop smeargle terminal-here treemacs-magit magit with-editor transient magit-section unfill vterm yasnippet-snippets yasnippet ws-butler writeroom-mode winum which-key vundo volatile-highlights vim-powerline vi-tilde-fringe uuidgen undo-fu-session undo-fu treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-comint helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-demos elisp-def editorconfig dumb-jump drag-stuff dotenv-mode disable-mouse dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line))
   '(send-mail-function 'sendmail-send-it)
   '(server-mode t)
   '(sh-shell-file "/usr/bin/zsh")
   '(shell-default-height 60)
   '(shell-file-name "/usr/bin/zsh")
   '(shell-pop-full-span t t)
   '(shell-pop-shell-type
     '("ansi-term" "*Default-ansi-term*"
       (lambda nil
         (ansi-term shell-pop-term-shell))))
   '(shell-pop-term-shell "/usr/bin/zsh" t)
   '(shell-pop-window-position 'bottom t)
   '(shell-pop-window-size 60 t)
   '(smtpmail-smtp-server "smtp.gmail.com")
   '(smtpmail-smtp-service 25)
   '(timeclock-mode-line-display t)
   '(timeclock-use-display-time t nil (time))
   '(treemacs-width 25)
   '(user-mail-address "mpbarbella@gmail.com")
   '(w3m-search-default-engine "duckduckgo")
   '(warning-suppress-types '((use-package))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background nil))))
   '(evil-mc-cursor-bar-face ((t nil))))
  )
