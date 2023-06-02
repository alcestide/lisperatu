;;;; Letter value sum
;;;; Assign every lowercase letter a value, from 1 for a to 26 for z.
;;;; Given a string of lowercase letters, find the sum
;;;; of the values of the letters in the string.

;;lettersum("") => 0
;;lettersum("a") => 1
;;lettersum("z") => 26
;;lettersum("cab") => 6
;;lettersum("excellent") => 100
;;lettersum("microspectrophotometries") => 317

(defun letter-value-sum (string)
  (let ((value-sum 0))
    (loop for char across string
          do (incf value-sum (- (char-code char) 96)))
    value-sum))

(loop for x in '("" "a" "z"
                 "cab" "excellent"
                 "microspectrophotometries")
    do(format t "~a Sum of the letters in '~a': ~a"
              #\linefeed x (letter-value-sum x)))
