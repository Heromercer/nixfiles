(setq doom-theme 'doom-one
      display-line-numbers-type t
      doom-user-dir (expand-file-name "~/.nixfiles/modules/core/emacs/doom.d/")
      doom-font (font-spec :family "JetBrains Mono" :size 16))
(setq org-directory "~/Documents/org/")
(setq org-roam-directory "~/Documents/org/")
(setq confirm-kill-emacs nil)

(after! apheleia
  (setf (alist-get 'nixfmt apheleia-formatters) '("nixfmt"))
  (setf (alist-get 'nix-mode apheleia-mode-alist) 'nixfmt)
  (setf (alist-get 'nix-ts-mode apheleia-mode-alist) 'nixfmt))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
