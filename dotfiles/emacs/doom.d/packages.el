;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! flycheck-vale)

;; Use my fork of this package
(package! evil-colemak-basics :recipe (:host github :repo "JonathanReeve/evil-colemak-basics"))
