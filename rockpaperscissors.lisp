;; Rock, Paper, Scissors (Chad Lisp Edition)

(defun get-player-choice (options)
  (format t "Please enter either: ~{~A~^, ~}: " options)
  (force-output)

  (let ((choice (string-downcase (read-line))))
    (if (member choice options :test #'equal)
        choice
        (progn
          (format t "Invalid choice.~%")
          (get-player-choice options)))))

(defun game ()
  (let* ((options `("rock" "paper" "scissors"))
         (cpu-choice (nth (random (length options) (make-random-state t)) options))
         (player-choice (get-player-choice options)))

    (format t "You entered: ~A, CPU entered: ~A~%" player-choice cpu-choice)

    (cond
      ((equal cpu-choice player-choice)
       (format t "Draw!~%"))

      ((and (equal player-choice "rock")
            (equal cpu-choice "scissors"))
       (format t "You win!~%"))

      ((and (equal player-choice "paper")
            (equal cpu-choice "rock"))
       (format t "You win!~%"))

      ((and (equal player-choice "scissors")
            (equal cpu-choice "paper"))
       (format t "You win!~%"))

      (t (format t "You lose!~%")))))

(defun play-again ()
  (format t "Do you want to play again? [y/n]: ")
  (let ((choice (string-downcase (read-line))))
    (cond
      ((equal choice "y") (game) (play-again))
      ((equal choice "n") (format t "Goodbye!~%"))
      (t (progn
           (format t "Invalid choice.~%")
           (play-again))))))

(game)
(play-again)

;; At the time of writing (14/01/2023), this code only supports a PC vs CPU gamemode.
;; Multi-player mode will probably be implemented in the future.
;; Run (load "rockpaperscissors.lisp") inside a Lisp interpreter such as SBCL or CLISP
;; and follow the instructions. This simple lisp implementation allows replayability.