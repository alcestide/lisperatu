(defun fizzbuzz ()
  (loop for i from 1 to 100 do
        (let ((output (concatenate 'string
                                   (if (zerop (mod i 3)) "Fizz" "")
                                   (if (zerop (mod i 5)) "Buzz" ""))))
          (print (if (string= output "") i output)))))

(fizzbuzz)

#|
(defun fizzbuzz ()
  (loop :with ring :=
     (loop :for i :from 1 :below 15
        :if (zerop (mod i 3))
        :collect (lambda (x)
                   (declare (ignore x)) "Buzz") :into result
        :else :if (zerop (mod i 5))
        :collect (lambda (x)
                   (declare (ignore x)) "Fizz") :into result
        :else :collect 'identity :into result
        :finally
        (return (nconc
                 (setf result
                       (cons (lambda (x) (declare (ignore x)) "FizzBuzz") result))
                 result)))
     :for i :from 1 :below 101
     :do (print (funcall (car (setf ring (cdr ring))) i))))
#|
