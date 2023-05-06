(defvar *roman-chars* "IVXLCDM")
(defvar *roman-nums*  '(1 5 10 50 100 500 1000))

(defun roman-numeral-to-decimal (roman-numeral)
  (let ((i (position (coerce roman-numeral 'character) *roman-chars*)))
    (and i (nth i *roman-nums*))))

(defun map-roman-numerals-to-decimal (roman-numerals)
  (map 'list #'roman-numeral-to-decimal roman-numerals))

(defun roman-to-decimal (roman)
  (loop as (A B) on (map-roman-numerals-to-decimal roman)
        if A sum (if (and B (< A B)) (- A) A)))
