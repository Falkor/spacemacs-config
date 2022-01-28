;;; falkor/keybindings.el.el --- falkor's General key bindings for Spacemacs.
;; Time-stamp: <Fri 2022-01-28 15:41 svarrette>
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
;; General key bindings not tied to a specific package configuration

;;; Code:


(global-set-key (kbd "C-c i") 'falkor/indent-buffer)
(global-set-key (kbd "C-c n") 'falkor/cleanup-buffer)
