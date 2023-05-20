
;;;; Given an integer x, return true if x is
;;;; a palindrome and false otherwise.

(defun is-palindrome (number)
  (let ((string-number (write-to-string number)))
    (equal string-number (reverse string-number))))

(defun check-palindrome (number)
  (if (is-palindrome number)
      (format t "The number ~a is a palindrome.~%" number)
      (format t "The number ~a is not a palindrome.~%" number)))

(check-palindrome 4206996024)
