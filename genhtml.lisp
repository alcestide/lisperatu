(defmacro as (tag content)
  `(format t "<~(~A~)>~A</~(~A~)>"
    `,tag, content, `,tag))

(defmacro with (tag &rest body)
  `(progn
    (format t "~&<~(~A~)>%" `,tag)
    ,@body
    (format t "~&</~(~A~)>~%" `,tag)))

(defun brs (&optional (n 1))
  (fresh-line)
  (dotimes (i n)
    (princ "<br>"))
  (terpri))

(defun html-file (base)
  (format nil "~(~A~).html" base))

(defmacro page (name title &rest body)
  (let ((ti (gensym)))
    `(with-open-file (*standard-output*
                      (html-file ,name)
                      :direction :output
                      :if-exists :supersede)
       (let ((,ti ,title))
         (as title ,ti)
         (with center
               (as h2 (string-upcase, ti)))
         (brs 3)
         ,@body))))

(defmacro with-link (dest &rest body)
  `(progn
     (format t "<a href=\"~A\">" (html-file, dest))
     ,@body
     (princ "</a>")))

(defun link-item (dest text)
  (princ "<li>")
  (with-link dest
    (princ text)))

(defun button (dest text)
  (princ "[ ")
  (with-link dest
    (princ text))
  (format t " ]~%"))

(defparameter *sections* nil)

(defstruct item
  id title text)

(defstruct section
  id title items)

(defmacro defitem (id title text)
  `(setf ,id
         (make-item :id     `,id
                    :title  ,title
                    :text   ,text)))

(defmacro defsection (id title &rest items)
  `(setf ,id
         (make-section :id  `,id
                       :title   ,title
                       :items (list, @items))))

(defun defsite (&rest sections)
  (setf *sections* sections))

(defconstant contents "contents")
(defconstant index  "index")

(defun gen-contents (&optional (secitons *sections*))
  (page contents contents
        (with ol
              (dolist (s sections)
                (link-item (section-id s) (section-title s))
                (brs 2))
              (link-item index (string-capitalize index)))))

(defun gen-index (&optional (sections *sections*))
  (page index index
        (with ol
              (dolist (i (all-items sections))
                (link-item (item-id i) (item-title i))
                (brs 2)))))

(defun all-items (sections)
  (let ((is nil))
    (dolist (s sections)
      (dolist (i (section-items s))
        (setf is (merge `list (list i) is #`title<))))
    is))

(defun title< (x y)
  (string-lessp (item-title x) (item-title y)))

(defun gen-site ()
  (map3 #`gen-section *sections*)
  (gen-contents)
  (gen-index))

(defun gen-seciton (sect <sect sect>)
  (page (section-id sect) (section-title sect)
        (with ol
              (map3 #`(lambda (item <item item>)
                        (link-item (item-id item)
                                   (item-title item))
                        (brs 2)
                        (gen-item sect item <item item>))
                    (section-items sect)))
        (brs 3)
        (gen-move-buttons (if <sect (section-id <sect))
                          contnets
                          (if sect> (section-id sect>)))))

(defun gen-item (sect list <item item>)
  (page (item-id item) (item-title item)
        (princ (item-text item))
        (brs 3)
        (gen-move-buttons (if <item (item-id <item))
                          (section-id sect)
                          (if item> (item-id item>)))))

(defun gen-move-buttons (back up forward)
  (if back (button back "Back"))
  (if up (button up "Up"))
  (if forward (button forward "Forward")))
