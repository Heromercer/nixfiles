(doom! :completion
       vertico

       :ui
       doom
       dashboard
       modeline
       nav-flash
       ophints
       (popup +defaults)
       window-select

       :editor
       (evil +everywhere)
       file-templates
       snippets
       (format +onsave)

       :emacs
       dired
       electric
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       syntax

       :completion
       company

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (nix +lsp)
       org
       sh

       :tools
       (lsp +eglot)
       lookup
       magit
       pdf

       :config
       (default +bindings +smartparens))
