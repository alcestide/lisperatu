(defstruct ht
  array
  (count 0))

defun ht (&rest kvs)
    (let ((rez (make-ht :array (make-array 16 :initial-element (list)))))
      (loop :for (k v) :in kvs :do
        (add-ht k v rez))
      rez))

(defun ht-get (key ht)
  (rtl:with ((size (length (rtl:? ht 'array)))
             (start (rem (hash key) size)))
    (do ((count 0 (1+ count))
         (i start (rem (1+ i) size))
         (item (rtl:? ht 'array start)
               (rtl:? ht 'array i)))
        ((or (null item)
             (= count size)))
      (when (eql key (car item))
        (return
          (values (cdr item)
;; the second value is an index, at which the item
;; was found
;; (also used to distinguish the value nil from not found,
;; which is also represented by nil
;; but with no second value)
                  i))))))

(defun ht-add (key val ht)
  (rtl:with ((array (ht-array ht))
             (size (length array)))
;; flet defines a local function that has access
;; to the local variables defined in HT-ADD
        (flet ((add-item (k v)
                 (do ((i (rem (hash k) size)
                         (rem (1+ i) size))
                      ((null (rtl:? ht 'array i))
                       (setf (rtl:? ht 'array i) (cons k v)))
;; this do-loop doesn't have a body
)))
            (when (= (hash-table-count ht) size)
;; when the backing array is full
;; expand it to have the length equal to the next power of 2
              (setf size (expt 2 (ceiling (log (1+ count) 2)))
                    (rtl:? ht 'array) (make-array size :initial-element nil))
;; and re-add its contents
              (rtl:dovec (item array)
                    (add-item (car item) (cdr item)))
;; finally, add the new item
            (incf (rtl:? ht 'count))
            (add-item key val)))

(defun ht-rem (key ht)
;; here, we use the index of the item returned as the 2nd value of HT-GET
  (rtl:when-it (nth-value 1 (ht-get key ht))
    (setf (rtl:? ht 'array rtl:it) nil)it))
;; return the index to indicate that the item was found
