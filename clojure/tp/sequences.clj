(ns clojure.example.sequences
  (:gen-class))

(defn clojure-sequences [] 

  ; seq creates sequences
  (println (seq [1 2 3]))

  ; cons adds an element to the head of a sequence
  (println (cons 0 (seq [1 2 3])))

  ; conj adds an element to the end of a sequence
  (println (conj [1 2 3] 4))

  ; concat joins two sequences in a new one
  (def a (seq [0 1 2 3 4]))
  (def b (seq [5 6 7 8 9]))

  (println (concat a b))

  ; dinstinct returns a new sequence without duplicate elements
  (println (distinct (seq [ 1 2 2 3 3 3 4 4 4 4 ])))

  ; reverse reverses the elements on a sequence
  (println (reverse (seq [ 0 1 2 3 4 5 6 ])))

  ; first gets the first element of a sequence
  (println (first [ 1 2 3 ]))

  ; last gets the last element of a sequence
  (println (last [ 1 2 3 ]))

  ; rest gets all elements except head (haskell's tail)
  (println (rest [ 1 2 3 ]))

  ; sort returns a sorted sequence
  (println (sort [ 1 0 2 9 3 8 4 5 7 6 ]))

  ; drop returns a new sequence with n elements dropped
  (println (drop 2 (seq [ 5 4 3 2 1 ])))

  ; take-last takes n elements from the end of a sequence
  (println (take-last 2 (seq [ 5 4 3 2 1 ])))

  ; take takes the n elements from the start of a sequence
  (println (take 2 (seq [ 5 4 3 2 1 ])))

  ; split-at splits a sequence at specified index
  (println (split-at 2 (seq [ 1 2 3 4 ]))))


(clojure-sequences)
