;;; falkor/packages.el --- falkor's layer packages file for Spacemacs.
;; Time-stamp: <Fri 2022-01-28 15:26 svarrette>
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
;; List of packages of the layer and the actual configuration for the packages
;; included in the layer. It must define a variable called <layer>-packages,
;; which should be a list of all the packages that this layer needs
;;
;; For each included package, you may define one or more of the following
;; functions, which are called in order by Spacemacs to initialize the package.
;;   <layer>/pre-init-<package>   (optional)
;;   <layer>/init-<package>       (mandatory)
;;   <layer>/post-init-<package>  (optional)
;;
;; A package will not be installed unless at least one layer defines an init
;; function for it
;;
;; Adapted from https://github.com/ekaschalk/.spacemacs.d/blob/master/layers/display/packages.el
;;; Code:

(defconst falkor-packages
  '(;; Owned packages
    ;; all-the-icons
    bury-successful-compilation

    time-stamp

    ;; Elsehwere-owned packages

    ))

;;; Owned Packages
;;;; All-the-icons

;;(defun falkor/init-all-the-icons ()
;;  (use-package all-the-icons))


;;;; -----------------------
;;;;  bury-successful-compilation
(defun falkor/init-bury-successful-compilation ()
  (use-package bury-successful-compilation
    :config (bury-successful-compilation 1))
  )


;;;; -----------------------
;;;; Time-stamp
(defun falkor/init-time-stamp ()
  (use-package time-stamp
    :init
    (progn
      ;; format of the string inserted by `M-x time-stamp'
      (setq time-stamp-format "%3a %:y-%02m-%02d %02H:%02M %u")
                                        ; `Weekday YYYY-MM-DD HH:MM USER'

      ;; update time stamps every time you save a buffer
      (add-hook 'write-file-hooks 'time-stamp))))
