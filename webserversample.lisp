(ql:quickload '("hunchentoot" "caveman2" "spinneret"
                "djula" "easy-routes"))

(defparameter *server* (make-instance
                        'hunchentoot:easy-acceptor
                                       :port 6666
                                       :address "0.0.0.0"))
(hunchentoot:start *server*)

