(defn hanoi
  [n source target spare]
  (if (= 1 n)
    (str " " source "->" target " ")
    (str
     (hanoi (dec n) source spare target)
     (str " " source "->" target " ")
     (hanoi (dec n) spare target source))))

(hanoi 7 :a :b :C)
