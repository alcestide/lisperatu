(defun sentence ()
  (append (noun-phrase) (verb-phrase)))

(defun noun-phrase ()
  (append (Article) (Noun)))

(defun verb-phrase ()
  (append (Verb) (noun-phrase)))

(defun Article()
  (one-of '(the a)))

(defun Noun ()
  (one-of '(man ball woman table
            apple cat dog spider
            pen car deer plant)))

(defun Verb ()
  (one-of '(hit took saw liked
            kissed cooked built
            called heard met)))

(defun one-of (set)
  "Pick one element of set, and make a list of it."
  (list (random-elt set)))

(defun random-elt (choices)
  "Choose an element from a list at random"
  (elt choices (random (length choices))))
