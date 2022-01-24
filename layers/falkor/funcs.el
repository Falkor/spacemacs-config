;;; falkor/funcs.el --- falkor's functions for Spacemacs.
;; Time-stamp: <Sun 2022-01-23 11:17 svarrette>
;;
;; Copyright (c) 2022 Sebastien Varrette
;;
;; Author: Sebastien Varrette <sebastien.varrette@gmail.com>
;; URL: https://github.com/Falkor/spacemacs-config

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
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

;;; Commentary:

;; Falkor's aka Sebastien Varrette Spacemacs customization settings
;;
;; Layer and Package agnostic functions

;;; Code:


(defun falkor/markdown-preview-file ()
  "run Marked application on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name)))))
