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
    (fstar-mode :location (recipe
                           :fetcher git
                           :url "https://github.com/FStarLang/fstar-mode.el.git"))
    ;; (fstar-mode :location (recipe
    ;;                        :fetcher github
    ;;                        :repo "FStarLang/fstar-mode.el"))
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
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'fstar-mode
        "n" 'fstar-subp-advance-next
        "u" 'fstar-subp-retract-last
        "p" 'fstar-subp-retract-last
        "i" 'fstar-subp-advance-or-retract-to-point
        "l" 'fstar-subp-advance-or-retract-to-point-lax
        "x" 'fstar-subp-kill-one-or-many
        "j" 'fstar-jump-to-definition
        )
      )
    ))


;;; packages.el ends here
