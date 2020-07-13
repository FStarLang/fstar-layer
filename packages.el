;;; packages.el --- fstar layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Kyo Dralliam <kyodralliam@neko-udon>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `fstar-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `fstar/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `fstar/pre-init-PACKAGE' and/or
;;   `fstar/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst fstar-packages
  '(
    (fstar-mode)
    )
  "The list of Lisp packages required by the fstar layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun fstar/init-fstar-mode ()
  (use-package fstar-mode
    :defer t
    :init
    (progn
      (company-quickhelp-mode 1))
    :config
    (progn
      (dolist (prefix '(("mh" . "fstar/help")
                        ("mj" . "fstar/jump")))
        (spacemacs/declare-prefix-for-mode
          'fstar-mode
          (car prefix) (cdr prefix)))
      (add-to-list 'spacemacs-indent-sensitive-modes 'fstar-mode)
      (add-to-list 'spacemacs-jump-handlers-fstar-mode '(fstar-jump-to-definition :async t))
      (spacemacs/set-leader-keys-for-major-mode 'fstar-mode
        "n" 'fstar-subp-advance-next
        "u" 'fstar-subp-retract-last
        "i" 'fstar-subp-advance-or-retract-to-point
        "l" 'fstar-subp-advance-or-retract-to-point-lax
        "x" 'fstar-subp-kill-one-or-many
        "b" 'fstar-subp-advance-to-point-max-lax
        "r" 'fstar-subp-reload-to-point
        "k" 'fstar-subp-kill-z3

        ;; Moving around
        "." 'fstar-jump-to-definition
        "'" 'fstar-jump-to-related-error
        "jj" 'fstar-jump-to-definition
        "jf" 'fstar-jump-to-definition-other-frame
        "jw" 'fstar-jump-to-definition-other-window
        "je" 'fstar-jump-to-related-error
        "jF" 'fstar-jump-to-related-error-other-frame
        "jW" 'fstar-jump-to-related-error-other-window
        "jd" 'fstar-visit-dependency
        "ja" 'fstar-visit-interface-or-implementation
        "ju" 'fstar-subp-goto-beginning-of-unprocessed

        ;; Help !!!
        "hy" 'fstar-copy-help-at-point
        "hw" 'fstar-browse-wiki
        "hW" 'fstar-browse-wiki-in-browser
        "ho" 'fstar-list-options
        "hp" 'fstar-quick-peek

        ;; Other queries
        "c"  'fstar-insert-match-dwim
        "e"  'fstar-eval
        "E"  'fstar-eval-custom
        "s"  'fstar-search
        "d"  'fstar-doc
        "p"  'fstar-print
        "q"  'fstar-quit-windows
        ;; "o" is reserved by convention :'(
        "P"  'fstar-outline
        )
      )
    ))


;;; packages.el ends here
