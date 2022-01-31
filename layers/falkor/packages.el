;;; falkor/packages.el --- falkor's layer packages file for Spacemacs.
;; Time-stamp: <Fri 2022-01-28 21:35 svarrette>
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
    (auto-insert-tkld :location local) ; see falkor/local/<package>
    bury-successful-compilation

    time-stamp

    ;; Elsehwere-owned packages

    ))

;;; Owned Packages
;;;; All-the-icons

;;(defun falkor/init-all-the-icons ()
;;  (use-package all-the-icons))

(defun falkor/init-auto-insert-tkld ()
  "Spacemacs Falkor Layer: init config for package auto-insert-tkld"
  (use-package auto-insert-tkld
    :config
    (progn
      (setq auto-insert-path (cons (concat  dotspacemacs-directory "templates/auto-insert") auto-insert-path))
      (setq auto-insert-automatically t)
      ;; associate file extention to a template name
      (setq auto-insert-alist
            '(
              ("\\.tex$"         . "LaTeX")            ; TeX or LaTeX
              ("\\.bib$"         . "BibTeX")           ; BibTeX
              ("\\.sty$"         . "LaTeX Style")      ; LaTeX Style
              ("\\.el$"          . "Emacs Lisp")       ; Emacs Lisp
              ("\\.java$"        . "Java")             ; Java
              ("\\App.java$"     . "JavaSwing")        ; Java Swing app
              ("[Tt]ools.h"      . "Tools C++")        ; Useful functions in C/C++
              ("\\Logs.cpp"      . "Logs C++")         ; Macros for logs/debugging
              ("\\Logs.h[+p]*"   . "Logs C++ Include") ; " header file
              ("\\.c$"           . "C")                ; C
              ("\\.h$"           . "C Include")        ; C header file
              ("\\.cxx$"         . "C++")              ; C++
              ("\\.c\\+\\+$"     . "C++")              ;
              ("\\.cpp$"         . "C++")              ;
              ("\\.cc$"          . "C++")              ;
              ("\\.C$"           . "C++")              ;
              ("[Mm]akefile$"    . "Makefile")         ; Makefile
              ("[Mm]akefile.am$" . "Makefile.am")      ; Makefile.am (Automake)
              ("CMakeList*"     . "CMake")             ; CMake
              ("\\.lua$"         . "Lua")              ; Lua
              ("\\.md$"          . "Text")             ; Text
              ("\\.markdown$"    . "Text")             ; Text
              ("\\.mdown$"       . "Text")             ; Text
              ("\\.txt$"         . "Text")             ; Text
              ("\\.gpg$"         . "GPG")              ; GPG
              ("[Rr]eadme$"      . "Readme")           ; Readme
              ("README$"         . "Readme")           ;
              ("\\.sh$"          . "Shell")            ; Shell
              ("\\.csh$"         . "Shell")            ;
              ("\\.tcsh$"        . "Shell")            ;
              ("\\.html"         . "Html")             ; HTML
              ("\\.wml"          . "WML")              ; WML (Website Meta Language)
              ("\\.php"          . "PHP")              ; PHP
              ("\\.gnuplot"      . "Gnuplot")          ; Gnuplot
              ("\\.py$"          . "Python")           ; Python
              ("\\.pl$"          . "Perl")             ; Perl
              ("\\.pm$"          . "Perl Module")      ; PerlModule
              ("\\.t$"           . "Perl Test")        ; Perl Test script
              ("\\.pp$"          . "Puppet")           ; Puppet manifest
              ("\\.rb$"          . "Ruby")             ; Ruby
              ("\\.R$"           . "R")                ; R
              ("\\.admission_rule[s]?$" . "OAR")              ; OAR admission rule
              (""                . "Shell") ; Shell (by default: assume a shell template)
              ))
      ;; now associate a template name to a template file
      (setq auto-insert-type-alist
            '(
              ("LaTeX"       . "insert.tex")
              ("BibTeX"      . "insert.bib")
              ("LaTeX Style" . "insert.sty")
              ("Emacs Lisp"  . "insert.el")
              ("Java"        . "insert.java")
              ("JavaSwing"   . "insertApp.java")
              ("C"           . "insert.c")
              ("CMake"       . "insert.cmake")
              ("C Include"   . "insert.h")
              ("C++"         . "insert.cpp")
              ("Tools C++"   . "insert.tools_cpp.h")
              ("Logs C++"    . "insert.logs.cpp")
              ("Logs C++ Include" . "insert.logs.h")
              ("Lua"         . "insert.lua")
              ("Makefile"    . "insert.makefile")
              ("Makefile.am" . "insert.makefile.am")
              ("Text"        . "insert.md")
              ("GPG"         . "insert.gpg")
              ("Readme"      . "insert.readme")
              ("Shell"       . "insert.shell")
              ("Html"        . "insert.html")
              ("WML"         . "insert.wml")
              ("PHP"         . "insert.php")
              ("Gnuplot"     . "insert.gnuplot")
              ("Python"      . "insert.py")
              ("Perl"        . "insert.pl")
              ("Perl Module" . "insert.pm")
              ("Perl Test"   . "insert.t")
              ("Puppet"      . "insert.pp")
              ("Ruby"        . "insert.rb")
              ("R"           . "insert.R")
              ("OAR"         . "insert.oar")
              ))
      )
    ))
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
