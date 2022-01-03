(ns clojure.examples.hello
  (:gen-class))

(defn call-builtins [n]
  (println "called with argument -> " n)
  (println "zero? " (zero? n))
  (println "pos? " (pos? n) " neg? " (neg? n))
  (println "even? " (even? n) " odd? " (odd? n))
  (println 
    "number? " (number? n) 
    " integer? " (integer? n) 
    " float? " (float? n))
  (println "type -> " (type n))
  (println "----"))


(println "some builtin number functions")
(println "zero? pos? neg? even? odd?")
(println "number? integer? float?")

(run! call-builtins [2022, 0, 1, -1])

