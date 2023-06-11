(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defun dough-calculator (pizzas diameter)
  (round (* (+ (/ (* 45 pi diameter) 20) 200) pizzas)))

(defun size-from-sauce (sauce)
  (sqrt (/ (* sauce 40) (* pi 3))))

(defun pizzas-per-cube (cube-size diameter)
  (floor (/ (* 2 (expt cube-size 3)) (* 3 pi (expt diameter 2)))))

(defun fair-share-p (pizzas friends)
  (let ((slices (* pizzas 8)))
    (= 0 (mod slices friends))))
