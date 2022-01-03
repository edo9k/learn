(ns clojure.examples.hello
  (:gen-class))

; counting with recursion
(defn count [to]
  (loop [i 0]
    (when (< i to)
      (println i)
      (recur (inc i)))))


; mandatory fib recursion example

; slow version (from rosetta code)
(defn slow-fib [n]
  (case n
    0 0
    1 1
    (+ (slow-fib (- n 1))
       (slow-fib (- n 2)))))

; memoized (from rosetta code)
(def mem-fib
  (memoize
    (fn [n]
      (case n
        0 0
        1 1 
        (+ (mem-fib (- n 1))
           (mem-fib (- n 2)))))))

; fast with the "doubling algorithm" (rosetta code)
(defn fast-fib [n]
  (letfn [(fast-fib* [n]
            (if (zero? n)
              [0 1]
              (let [[a b] (fast-fib* (quot n 2))
                    c (*' a (-' (*' 2 b) a))
                    d (+' (*' b b) (*' a a))]
                (if (even? n)
                  [c d]
                  [d (+' c d)]))))]
    (first (fast-fib* n))))

(count 10)

(println "naive fib vs memoized naive fib vs fast fibonacci")

(def x 30)

(println "naive:    " (time (slow-fib x)))
(println "memoized: " (time (mem-fib  x)))
(println "fast:     " (time (fast-fib x)))
