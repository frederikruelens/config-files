;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the
  variable values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the
   ;; directory `+distribution'. For now available distributions are
   ;; `spacemacs-base' or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all'
   ;; instead of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     javascript
     python
     ;;elpy
     ipython-notebook
     rust
     html
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     ;; version-control
     ess
     latex
     ;; private layers
     (ess :variables
          ess-enable-smart-equals nil
          ess-enable-smartparens nil)
     ;;funk
     ;;polymode
     ;;smartparens-config
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
   swiper
   ivy
   polymode
   better-defaults
   ;;jedi
   material-theme
   elpy
   py-autopep8
   hardcore-mode
   emojify
   browse-kill-ring
   ov
   key-chord
   multiple-cursors
   )
   ;; A list of packages and/or extensions that will not be install and
   ;; loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e.
   ;; packages that are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages nil))


;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))



(defvar myPackages
  '(better-defaults
    ein ;; add the ein package (Emacs ipython notebook)
    elpy
    flycheck
    material-theme
    py-autopep8))


  (when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq save-abbrevs t)
(setq save-abbrevs 'silently)
(setq hardcore-mode t)


(add-hook 'after-init-hook #'global-emojify-mode)


;;
(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to
   ;; t.
   ;; This variable has no effect if Emacs is launched with the
   ;; parameter `--insecure' which forces the value of this variable to
   ;; nil. (default t)
   dotspacemacs-elpa-https t
   ;;ivy-use-virtual-buffers t
   ;;setq enable-recursive-minibuffers t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if
   ;; the variable is `emacs' then the `holy-mode' is enabled at
   ;; startup. `hybrid' uses emacs key bindings for vim's insert mode,
   ;; but otherwise leaves evil unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer.
   ;; (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it
   ;; displays the official spacemacs logo. An integer value is the
   ;; index of text banner, `random' chooses a random text banner in
   ;; `core/banners' directory. A string value must be a path to an
   ;; image format supported by your Emacs build. If the value is nil
   ;; then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is
   ;; disabled. Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default
   ;; 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs
   ;; starts. Press <SPC> T n to cycle to the next theme in the list
   ;; (works great with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the
   ;; mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default
   ;; ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert
   ;; state'. (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the
   ;; GUI to the key pairs C-i, TAB and C-m, RET. Setting it to a
   ;; non-nil value, allows for separate commands under <C-i> and TAB or
   ;; <C-m> and RET. In the terminal, these pairs are generally
   ;; indistinguishable, so this only works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil The command
   ;; key used for Evil commands (ex-commands) and Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like
   ;; in Vim with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume
   ;; automatically upon start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original'
   ;; to auto-save the file in-place, `cache' to auto-save the file to
   ;; another file stored in the cache directory and `nil' to disable
   ;; auto-saving. (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now
   ;; only `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s),
   ;; and `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses.
   ;; (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one
   ;; source. (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom',
   ;; `top', `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing
   ;; `p` several times cycle between the kill ring content. (default
   ;; nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup
   ;; listing the commands bound to the current keystroke sequence.
   ;; (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom'
   ;; and `right-then-bottom'. right-then-bottom tries to display the
   ;; frame to the right; if there is insufficient space it displays it
   ;; at the bottom. (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading.
   ;; This may increase the boot time on some systems and emacs builds,
   ;; set it to nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default
   ;; nil) (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native
   ;; fullscreen. Use to disable fullscreen animations in OSX. (default
   ;; nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which
   ;; describes the transparency level of a frame when it's active or
   ;; selected. Transparency can be toggled through
   ;; `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which
   ;; describes the transparency level of a frame when it's inactive or
   ;; deselected. Transparency can be toggled through
   ;; `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   ;; (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters
   ;; the point when it reaches the top or bottom of the screen.
   ;; (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', also turns on
   ;; relative line numbers. (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming
   ;; modes. (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope
   ;; and emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when
   ;; quitting. (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first
   ;; installed tool of the list. Supported tools are `ag', `pt', `ack'
   ;; and `grep'. (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has
   ;; been specified with an installed package. Not used for now.
   ;; (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of
   ;; whitespace, `trailing' to delete only the whitespace at end of
   ;; lines, `changed'to delete only whitespace for changed lines or
   ;; `nil' to disable cleanup. (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'. You are free
to put almost any user code here. The exception is org related
code, which should be placed in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs
initialization after layers configuration. You are free to put
any user code."

  ;; Text settings =====================================================
  (setq-default
   ;; Break lines at specified column (<= 80, defaults 72)
   fill-column 72
   ;; Turns on auto-fill-mode to automatically break lines
   auto-fill-function 'do-auto-fill
   )
  ;; Turn on FCI (Fill Column Indicator) mode
  ; (turn-on-fci-mode)
  ;; Maxima mode https://www.emacswiki.org/emacs/MaximaMode
  ;; (add-to-list 'load-path "/usr/local/share/maxima/5.18.1/emacs/")
  (autoload 'maxima-mode "maxima" "Maxima mode" t)
  (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
  (autoload 'maxima "maxima" "Maxima interaction" t)
  (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
  (setq imaxima-use-maxima-mode-flag t)
  (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md$" . poly-markdown-mode))

;;; ORG
;; org is not working presently
;; (add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode))

;;; R related modes
(add-to-list 'auto-mode-alist '("\\.Snw$" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw$" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.rapport$" . poly-rapport-mode))
(add-to-list 'auto-mode-alist '("\\.Rhtml$" . poly-html+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rbrew$" . poly-brew+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rcpp$" . poly-r+c++-mode))
(add-to-list 'auto-mode-alist '("\\.cppR$" . poly-c++r-mode))

;;; ERB modes
(add-to-list 'auto-mode-alist '("\\.js.erb$" . poly-javascript+erb-mode))
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . poly-coffee+erb-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . poly-html+erb-mode))

;;; Slim mode
(add-to-list 'auto-mode-alist '("\\.slim$" . poly-slim-mode))

(provide 'polymode-configuration)
  )


;; let make a cool command :)
;; newline-without-break-of-line
(defun newline-without-break-of-line ()

  "1. move to the begining  of the line.
    2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "C-c o") 'newline-without-break-of-line)


(defun freddy-python-shell-send-region-or-line nil
  "Sends from python-mode buffer to a python shell, intelligently."
  (interactive)
  (cond ((region-active-p)
         (setq deactivate-mark t)
         (python-shell-send-region (region-beginning) (region-end))
         (python-nav-forward-statement)
         ) (t (elpy-shell-send-statement))))




;; insert new line above without breaking the current line
(defun fred-newline-here ()

  "1. move to end of the line.
  2. insert newline with index"
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (newline-and-indent)
    (previous-line)
    (indent-relative)))

(global-set-key (kbd "C-c i") 'fred-newline-here)

(global-set-key (kbd "C-x p") 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)



(defun fred-move-beginning-next-line ()
  "1. move to end of the line.
  2. insert newline with index"
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (next-line)
    (beginning-of-line-text)
    )
  )
(global-set-key (kbd "C-c a") 'fred-move-beginning-next-line)

;;(elpy-enable)

(setq ess-packages
  '(
    ess
    ess-R-data-view
    ess-smart-equals
    golden-ratio
    org))

;;(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)


(add-to-list 'load-path "~/icons-in-terminal/")


(defun ess/init-ess ()
  (use-package ess-site
    :mode (("\\.sp\\'"           . S-mode)
           ("/R/.*\\.q\\'"       . R-mode)
           ("\\.[qsS]\\'"        . S-mode)
           ("\\.ssc\\'"          . S-mode)
           ("\\.SSC\\'"          . S-mode)
           ("\\.[rR]\\'"         . R-mode)
           ("\\.[rR]nw\\'"       . Rnw-mode)
           ("\\.[sS]nw\\'"       . Snw-mode)
           ("\\.[rR]profile\\'"  . R-mode)
           ("NAMESPACE\\'"       . R-mode)
           ("CITATION\\'"        . R-mode)
           ("\\.omg\\'"          . omegahat-mode)
           ("\\.hat\\'"          . omegahat-mode)
           ("\\.lsp\\'"          . XLS-mode)
           ("\\.do\\'"           . STA-mode)
           ("\\.ado\\'"          . STA-mode)
           ("\\.[Ss][Aa][Ss]\\'" . SAS-mode)
           ("\\.jl\\'"           . ess-julia-mode)
           ("\\.[Ss]t\\'"        . S-transcript-mode)
           ("\\.Sout"            . S-transcript-mode)
           ("\\.[Rr]out"         . R-transcript-mode)
           ("\\.Rd\\'"           . Rd-mode)
           ("\\.[Bb][Uu][Gg]\\'" . ess-bugs-mode)
           ("\\.[Bb][Oo][Gg]\\'" . ess-bugs-mode)
           ("\\.[Bb][Mm][Dd]\\'" . ess-bugs-mode)
           ("\\.[Jj][Aa][Gg]\\'" . ess-jags-mode)
           ("\\.[Jj][Oo][Gg]\\'" . ess-jags-mode)
           ("\\.[Jj][Mm][Dd]\\'" . ess-jags-mode))
    :commands (R stata julia SAS)
    :init
    (progn
      (spacemacs/register-repl 'ess-site 'julia)
      (spacemacs/register-repl 'ess-site 'R)
      (spacemacs/register-repl 'ess-site 'SAS)
      (spacemacs/register-repl 'ess-site 'stata)
      ;; Explicitly run prog-mode hooks since ess-mode does not derive from
      ;; prog-mode major-mode
      (add-hook 'ess-mode-hook 'spacemacs/run-prog-mode-hooks)
      (when (configuration-layer/package-usedp 'company)
          (add-hook 'ess-mode-hook 'company-mode))))

  ;; R --------------------------------------------------------------------------
  (with-eval-after-load 'ess-site
    ;; Follow Hadley Wickham's R style guide
    (setq ess-first-continued-statement-offset 2
          ess-continued-statement-offset 0
          ess-expression-offset 2
          ess-nuke-trailing-whitespace-p t
          ess-default-style 'DEFAULT)

    (defun spacemacs/ess-start-repl ()
      "Start a REPL corresponding to the ess-language of the current buffer."
      (interactive)
      (cond
       ((string= "S" ess-language) (call-interactively 'R))
       ((string= "STA" ess-language) (call-interactively 'stata))
       ((string= "SAS" ess-language) (call-interactively 'SAS))))

    (spacemacs/set-leader-keys-for-major-mode 'ess-julia-mode
      "'"  'julia
      "si" 'julia)
    (spacemacs/set-leader-keys-for-major-mode 'ess-mode
      "'"  'spacemacs/ess-start-repl
      "si" 'spacemacs/ess-start-repl
      ;; noweb
      "cC" 'ess-eval-chunk-and-go
      "cc" 'ess-eval-chunk
      "cd" 'ess-eval-chunk-and-step
      "cm" 'ess-noweb-mark-chunk
      "cN" 'ess-noweb-previous-chunk
      "cn" 'ess-noweb-next-chunk
      ;; REPL
      "sB" 'ess-eval-buffer-and-go
      "sb" 'ess-eval-buffer
      "sD" 'ess-eval-function-or-paragraph-and-step
      "sd" 'ess-eval-region-or-line-and-step
      "sL" 'ess-eval-line-and-go
      "sl" 'ess-eval-line
      "sR" 'ess-eval-region-and-go
      "sr" 'ess-eval-region
      "sT" 'ess-eval-function-and-go
      "st" 'ess-eval-function
      ;; R helpers
      "hd" 'ess-R-dv-pprint
      "ht" 'ess-R-dv-ctable
      )
    (define-key ess-mode-map (kbd "<s-return>") 'ess-eval-line)
    (define-key inferior-ess-mode-map (kbd "C-j") 'comint-next-input)
    (define-key inferior-ess-mode-map (kbd "C-k") 'comint-previous-input)))

(defun ess/init-ess-R-data-view ())

(defun ess/init-ess-smart-equals ()
  (use-package ess-smart-equals
    :defer t
    :if ess-enable-smart-equals
    :init
    (progn
      (add-hook 'ess-mode-hook 'ess-smart-equals-mode)
      (add-hook 'inferior-ess-mode-hook 'ess-smart-equals-mode))))

(defun ess/pre-init-golden-ratio ()
  (spacemacs|use-package-add-hook golden-ratio
    :post-config
    (dolist (f '(ess-eval-buffer-and-go
                 ess-eval-function-and-go
                 ess-eval-line-and-go))
      (add-to-list 'golden-ratio-extra-commands f))))

(defun ess/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config (add-to-list 'org-babel-load-languages '(R . t))))


(global-set-key (kbd "M-ç") 'kill-whole-line)


(global-set-key (kbd "C-h") 'backward-delete-char)




(defun avy-flash ()
  (interactive)
  (set-face-attribute 'mode-line nil :background "#50AA50")
  (run-with-timer 0.25 nil 'set-face-attribute 'mode-line nil :background "grey75")
  (avy-goto-char-timer))

(defun my-restart-python-console ()
  "Restart python console before evaluate buffer or region to avoid various uncanny conflicts, like not reloding modules even when they are changed"
  (interactive)
  (kill-process "Python")
  (sleep-for 0.05)
  (kill-buffer "*Python*")
  ;;(elpy-shell-send-region-or-buffer)
  )

(global-set-key (kbd "M-é") 'my-restart-python-console)


(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))


(global-set-key (kbd "C-c C-g") 'quick-copy-line)

;; AVY shortcut keys for inline navigation
(global-set-key (kbd "C-,") 'avy-goto-line)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-:") 'avy-goto-char-2)
(global-set-key (kbd "C-=") 'avy-move-region)



;;(use-package eyebrowse
(global-set-key (kbd "M-s M-1") 'eyebrowse-switch-to-window-config-1)
(global-set-key (kbd "M-s M-2") 'eyebrowse-switch-to-window-config-2)
(global-set-key (kbd "M-s M-3") 'eyebrowse-switch-to-window-config-3)
(global-set-key (kbd "M-s M-4") 'eyebrowse-switch-to-window-config-4)


(global-set-key (kbd "C-4") 'er/expand-region)






(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  ;; (setq load-path
  ;;  (append (list "path/to/polymode/" "path/to/polymode/modes/")
  ;;      load-path))
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

(defun r-chunk (header)
  "Insert an r-chunk in markdown mode. Necessary due to interactions between polymode and yas snippet"
  (interactive "sHeader: ")
  (insert (concat "```{r " header "}\n\n```"))
  (forward-line -1))


(defun r-comment (comment)
  "Insert an r-coment block"
  (interactive "sComment: ")
  (insert (concat "###----------------------------------\n##\n## " comment
                  "\n##\n###----------------------------------"))
  )

(defun r-clear-workspace ()
  (interactive)
  (insert "rm(list=ls())")
  (insert ~%)
  (format t "An atom~%")
 )

(global-set-key (kbd "C-&") 'r-clear-workspace)


(defun emacs-single-quote-left ()
  (interactive)
  (insert "(")
 )
(global-set-key (kbd "C-(") 'emacs-single-quote-left)

(defun emacs-single-quote-right ()
  (interactive)
  (insert ")")
  )


(global-set-key (kbd "C-)") 'emacs-single-quote-right)


(global-set-key (kbd "M-f") 'evil-forward-word-begin)


(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

(setq browse-kill-ring-highlight-current-entry t)

(global-set-key (kbd "M-y") 'browse-kill-ring)





(global-set-key (kbd "C-'") 'r-chunk)
(global-set-key (kbd "M-o") 'ace-window)


(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-c u") 'undo)
(global-set-key (kbd "C-c r") 'redo)


(setq aw-keys '(?q ?s ?d ?f ?g ?h ?j ?k ?l))

(setq aw-background nil)






(setq ess-use-auto-complete t)


(defun mark-whole-word (&optional arg allow-extend)
  "Like `mark-word', but selects whole words and skips over whitespace.
If you use a negative prefix arg then select wordss backward.
Otherwise select them forward.

If cursor starts in the middle of word then select that whole word.

If there is whitespace between the initial cursor position and the
first word (in the selection direction), it is skipped (not selected).

If the command is repeated or the mark is active, select the next NUM
words, where NUM is the numeric prefix argument.  (Negative NUM
selects backward.)"
  (interactive "P\np")
  (let ((num  (prefix-numeric-value arg)))
    (unless (eq last-command this-command)
      (if (natnump num)
          (skip-syntax-forward "\\s-")
        (skip-syntax-backward "\\s-")))
    (unless (or (eq last-command this-command)
                (if (natnump num)
                    (looking-at "\\b")
                  (looking-back "\\b")))
      (if (natnump num)
          (left-word)
        (right-word)))
    (mark-word arg allow-extend)))

(global-set-key [remap mark-word] 'mark-whole-word)
;;(global-set-key (kbd "C-h")  'mark-word)

(defun clear-shell()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))

(global-set-key (kbd "C-Q")  'clear-shell)

;;(add-hook 'python-mode-hook 'jedi:setup)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(setenv "WORKON_HOME" "/home/fruelens/anaconda2/envs")
;;(pyvenv-mode 1)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#37474f" t)
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (org-mime python-environment epc concurrent elpy find-file-in-project ein skewer-mode request-deferred websocket deferred js2-mode simple-httpd ghub let-alist ctable yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-category-capture toml-mode racer flycheck-rust seq cargo rust-mode undo-tree winum unfill fuzzy diminish f log4e s web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data goto-chg packed evil avy markdown-mode alert bind-key bind-map magit-popup powerline request auctex company with-editor projectile org highlight dash pcache flyspell-correct async auto-complete iedit smartparens yaml-mode paradox org-plus-contrib helm-ag expand-region evil-matchit ess flycheck yasnippet helm helm-core magit spacemacs-theme zenburn-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spinner spaceline solarized-theme smeargle shell-pop restart-emacs rainbow-delimiters quelpa popwin polymode persp-mode pcre2el orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative link-hint julia-mode info+ indent-guide ido-vertical-mode hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit gh-md flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump define-word company-statistics company-auctex column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(virtualenv-root "/home/fruelens/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
