(defn factorial [n]
 (reduce * (range 1 (inc n))))

(defn fact [x]
    (loop [n x f 1]
        (if (= n 1)
            f
            (recur (dec n) (* f n)))))

(time (factorial 10))
(time (fact 10))
