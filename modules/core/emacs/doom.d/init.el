(doom! :completion
       vertico

       :ui
       doom
       dashboard
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces
       window-select

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets
       (format +onsave)
       (whitespace +guess +trim)

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
       (spell +flyspell)
       grammar

       :completion
       ;;company
       (corfu +orderless)
       vertico

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
