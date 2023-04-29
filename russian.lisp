(defvar *vocabulary* '((кот . cat)
                       (собака . dog)
                       (человек . human)
                       (дом . house)
                       (книга . book)
                       (стол . table)
                       (лёгкий . easy)
                       (трудный . hard)
                       (красный . red)
                       (действительно . really)
                       (открыть . open)
                       (чёрный . black)
                       (наверное . probably)
                       (вполне . fully)
                       (писатель . writer)
                       (судьба . fate)
                       (улыбнуться . "to smile")
                       (согласиться . "to agree")
                       (холодный . cold)
                       (самолёт . airplane)
                       (враг . enemy)
                       (наука . science)
                       (потерять . "to lose")
                       (кожа . skin)
                       (природа . nature)
                       (толпа . crowd)
                       (дождь . rain)))

(defun quiz ()
  (let ((word (random-word)))
    (format t "Translate the word: ~a~%" (car word))
    (let ((answer (read-line)))
      (if (equal answer (cdr word))
          (format t "Correct!~%")
          (format t "Incorrect, the correct answer is ~a~%" (cdr word))))))

(defun random-word ()
  (nth (random (length *vocabulary*)) *vocabulary*))

(quiz)

;; This script defines a vocabulary list of Russian words and their English translations.
;; The quiz function selects a random word from the list and prompts
;; the user to translate it from Russian to English. If the user's answer matches the correct
;; translation, the script displays a "Correct!" message.
;; Otherwise, it displays the correct translation.
;; To use this script, simply copy and paste it into a Lisp interpreter,
;; such as SBCL or CLISP, and run the quiz function.
;; You can customize the vocabulary list by adding or removing words as needed.
