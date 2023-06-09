(defun bin-search (val vec &optional (pos 0))
  (if (> (length vec) 1)
      (let ((mid (floor (length vec) 2))
            (cur (aref vec mid)))
        (cond ((< cur val)
               (bin-search val (subseq vec mid) (+ pos mid)))
              ((> cur val)
               (bin-search val (subseq vec 0 mid) pos))
              (t (+ pos mid))))
      (when (= (aref vec 0) val)
        pos)))
