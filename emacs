(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq display-raw-bytes-as-hex t)
(setq visible-bell 1)
(scroll-bar-mode -1)
 
;;; For those fans of PC editors, here is how to make emacs replace
;;; the selection (if active) with the typed text.
(delete-selection-mode t)

;;; kill-line called with the point at the beginning of the line
;;; removes the final newline as well.
(setq kill-whole-line t)

;; Enable mouse while in xterm mode
(if (not (window-system))
    (progn
      (menu-bar-mode -1)
      (xterm-mouse-mode)))
 
;;; Deactivate creation of backup files.  I hope I won't regret this...
(setq make-backup-files nil)

;; *** Line number
(column-number-mode 1)
(global-display-line-numbers-mode t)
(line-number-mode 1)

(defun match-paren (arg)
  "Go to the matching parenthesis, if on parenthesis; otherwise,
insert `%'."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;; Essential keys
(global-set-key [f12]     'my-revert-buffer)
(global-set-key "\C-cg"   'goto-line)
;;(global-set-key "\C-cB"   'buffer-beautify)
(global-set-key "\C-z"    'undo)
(global-set-key "\C-cx"   'add-change-log-entry-other-window)
(global-set-key (kbd "%")      'match-paren)

(load-theme 'tango-dark)
