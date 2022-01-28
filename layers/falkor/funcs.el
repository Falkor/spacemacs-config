;;; falkor/funcs.el --- falkor's functions for Spacemacs.
;; Time-stamp: <Fri 2022-01-28 15:35 svarrette>
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


;;;; Global untabify
(defun falkor/untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

;; === Indentation of the full buffer ===
;; Courtesy from http://emacsblog.org/2007/01/17/indent-whole-buffer/
(defun falkor/indent-buffer ()
  "Indent whole buffer"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

;;;; Global cleanup: indent, untabify and delete trailing whitespace
(defun falkor/cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (falkor/indent-buffer)
  (falkor/untabify-buffer)
  (delete-trailing-whitespace))
