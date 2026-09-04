(setq doom-theme 'doom-one
      display-line-numbers-type t
      doom-user-dir (expand-file-name "~/.nixfiles/modules/core/emacs/doom.d/"))

(after! apheleia
  (setf (alist-get 'nixfmt apheleia-formatters) '("nixfmt"))
  (setf (alist-get 'nix-mode apheleia-mode-alist) 'nixfmt)
  (setf (alist-get 'nix-ts-mode apheleia-mode-alist) 'nixfmt))
