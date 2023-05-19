;;;;You are climbing a staircase. It takes n steps to reach the top.
;;;;Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

;;;; Input: n = 2
;;;; Output: 2
;;;; Explanation: There are two ways to climb to the top.
;;;; 1. 1 step + 1 step
;;;; 2. 2 steps

(defun count-ways-to-climb (n)
  (if (<= n 1)
      1
      (+ (count-ways-to-climb (- n 1))
         (count-ways-to-climb (- n 2)))))

(defun climbing-stairs (n)
  (format t "Number of ways to climb ~a stairs: ~a~%" n (count-ways-to-climb n)))

(climbing-stairs 5)
