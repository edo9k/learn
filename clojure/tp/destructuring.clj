(ns clojure.examples.destructuring
  (:gen-class))

(defn destructuring [] 
  (def years [ 1984 1995 2022 ])

  (let [ [year-a year-b year-c year-d] years]
    (println "getting last year by destructuring: " year-c)
    (println "a non-existant value becomes: " year-d))

  (println "you can also use the &rest operator")
  
  (def my-vector [1 2 3 4])
  (let [ [a b & the-rest] my-vector]
    (println "first value: " a)
    (println "second value: " b)
    (println "the rest: " the-rest)))

(destructuring)

