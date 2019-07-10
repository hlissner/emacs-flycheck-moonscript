;;; flycheck-moonscript.el --- flycheck support for moonscript-mode -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2019 Henrik Lissner
;;
;; Author: Henrik Lissner <henrik@lissner.net>
;; Maintainer: Henrik Lissner <henrik@lissner.net>
;; Created: July 9, 2019
;; Modified: July 9, 2019
;; Version: 1.0.0
;; Keywords: tools, convenience
;; Homepage: https://github.com/hlissner/emacs-flycheck-moonscript
;; Package-Requires: ((emacs "24.1") (flycheck "28"))
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This Flycheck extension configures Flycheck automatically for the current
;; moonscript file using moonc or moonpick.
;;
;; # Setup
;;
;;   (with-eval-after-load 'moonscript
;;     (require 'flycheck-moonscript))
;;
;;; Code:

(eval-and-compile
  (require 'flycheck))

(flycheck-define-checker moonscript-moonpick
  "A Moonscript syntax and style checker using moonpick."
  :command ("moonpick" "--filename" source-original)
  :error-patterns ((warning line-start "line " line ": " (message))
                   (error line-start (message) ":\n [" line "]"))
  :standard-input t
  :modes moonscript-mode)

(flycheck-define-checker moonscript-moonc
  "A Moonscript syntax and style checker using moonc."
  :command ("moonc" "-l" source)
  :error-patterns ((warning line-start "line " line ": " (message))
                   (error line-start (message) ":\n [" line "]"))
  :modes moonscript-mode
  :prefix flycheck-buffer-saved-p)

(add-to-list 'flycheck-checkers 'moonscript-moonc)
(add-to-list 'flycheck-checkers 'moonscript-moonpick)

(provide 'flycheck-moonscript)
;;; flycheck-moonscript.el ends here
