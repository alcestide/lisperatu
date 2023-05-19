(defun fibonacci (n)
  (do ((a 1 b)
       (b 1 (print (+ a b)))
       (n n (1- n)))
      ((zerop n) b)))

(fibonacci 27)
