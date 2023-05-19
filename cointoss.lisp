(defun toss-coin ()
 (let ((number (random 2 (make-random-state t))))
    (if (= number 0)
        "heads"
        "tails")))

(defun prompt ()
  (format t "Please enter heads or tails: ")
  (force-output)
  (let ((guess (string-downcase (read-line))))
    (if (or (string= guess "heads")
            (string= guess "tails"))
        guess
        (prompt))))

(defun game ()
  (if (string= (prompt)
               (toss-coin))
      (format nil "You win!~%")
      (format nil "You lose!~%")))

(game)
