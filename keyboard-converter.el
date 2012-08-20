;;; keyboard-converter.el --- Convert string from keyboard layouts

;; Copyright © 2012 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>

;; Author: Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
;; Keywords: emacs, 
;; Created: 2012-08-08
;; Last changed: 2012-08-08 14:53:43
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; 


;;; Code:

(defvar ck-unknown-char "■"
  "Charcter to use whenno conversion ca be done.")

(defvar ck-layouts-idx
  '(us fr))

(defvar ck-layouts
  '(
    ;;US  FR
    ("`"  "²" )
    ("1"  "&" )
    ("2"  "é" )
    ("3"  "\"")
    ("4"  "'" )
    ("5"  "(" )
    ("6"  "-" )
    ("7"  "è" )
    ("8"  "_" )
    ("9"  "ç" )
    ("0"  "à" )
    ("-"  ")" )
    ("="  "=" )
    ("q"  "a" )
    ("w"  "z" )
    ("e"  "e" )
    ("r"  "r" )
    ("t"  "t" )
    ("y"  "y" )
    ("u"  "u" )
    ("i"  "i" )
    ("o"  "o" )
    ("p"  "p" )
    ("["  "^" )
    ("]"  "$" )
    ("\\" "*" )
    ("a"  "q" )
    ("s"  "s" )
    ("d"  "d" )
    ("f"  "f" )
    ("g"  "g" )
    ("h"  "h" )
    ("j"  "j" )
    ("k"  "k" )
    ("l"  "l" )
    (";"  "m" )
    ("'"  "ù" )
    ("z"  "w" )
    ("x"  "x" )
    ("c"  "c" )
    ("v"  "v" )
    ("b"  "b" )
    ("n"  "n" )
    ("m"  "," )
    (","  ";" )
    ("."  ":" )
    ("/"  "!" )
    ("~"  "~" )
    ("!"  "1" )
    ("@"  "2" )
    ("#"  "3" )
    ("$"  "4" )
    ("%"  "5" )
    ("^"  "6" )
    ("&"  "7" )
    ("*"  "8" )
    ("("  "9" )
    (")"  "0" )
    ("_"  "°" )
    ("+"  "+" )
    ("Q"  "A" )
    ("W"  "Z" )
    ("E"  "E" )
    ("R"  "R" )
    ("T"  "T" )
    ("Y"  "Y" )
    ("U"  "U" )
    ("I"  "I" )
    ("O"  "O" )
    ("P"  "P" )
    ("{"  "¨" )
    ("}"  "£" )
    ("|"  "µ" )
    ("A"  "Q" )
    ("S"  "S" )
    ("D"  "D" )
    ("F"  "F" )
    ("G"  "G" )
    ("H"  "H" )
    ("J"  "J" )
    ("K"  "K" )
    ("L"  "L" )
    (":"  "M" )
    ("\"" "%" )
    ("Z"  "W" )
    ("X"  "X" )
    ("C"  "C" )
    ("V"  "V" )
    ("B"  "B" )
    ("N"  "N" )
    ("M"  "?" )
    ("<"  "." )
    (">"  "/" )
    ("?"  "§" )))



(defun ck-keyboard-convert (string to from)
  "Convert STRING from us to fr."
  (let ((to (position (if (symbolp to) to (intern to)) ck-layouts-idx))
	(from (position (if (symbolp from) from (intern from)) ck-layouts-idx)))
    (when (and from to)
      (mapconcat 'identity
		 (loop for c across string
		       for l = (remove-if-not
				(lambda (x) (= c (string-to-char (nth from x))))
				ck-layouts)
		       collect (if l (nth to (car l)) ck-unknown-char))
		 ""))))


(provide 'keyboard-converter)

;; keyboard-converter.el ends here
