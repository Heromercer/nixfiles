(doom!      :ui
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
            (dired +dirvish +icons)
            electric
            undo
            vc
            eww

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
            (nix +lsp +tree-sitter)
            (org +pretty +roam)
            sh
            (markdown +lsp +grip +tree-sitter)
            (yaml +lsp +tree-sitter)

            :tools
            (lsp +eglot)
            lookup
            magit
            pdf
            tree-sitter

            :config
            literate
            (default +bindings +smartparens))
