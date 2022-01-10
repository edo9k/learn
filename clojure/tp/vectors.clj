(ns clojure.examples.vector
  (:gen-class))

(defn vector-examples []
  (println "creating a vector o covid years (so far)")
  (println (vector 2020 2021 2022))

  ; vector-of specifies the type of vector being created
  (println (vector-of :double 2020 2021 2022))

  ; nth returns item in nth position
  (println (nth (vector 665 666 667) 1))

  ; get seems to do the same, but i've read there are different behaviors
  ; for lists and vectors, when using nth and get
  (println (get (vector 665 666 667) 1))

  ; conj returns a new vector with an element appended to it
  (println (conj (vector 2021 2022) 2023))

  ; pop returns a vector without the last item (for queues/lists get the 1st)
  (println (pop (vector 1 2 3)))

  ; subvec returns a subvector from positions start to end
  (println (subvec (vector 0 1 2 3 4 5 6 7 8 9) 3 6)))


(vector-examples)
