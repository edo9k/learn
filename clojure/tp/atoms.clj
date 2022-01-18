(ns clojure.examples.atoms)

(defn atom-fns []

  ; atoms are used to manage "shared, synchronous, independent" state in clojure.
  ; apparently they are thread safe, because they on a transactional model, just
  ; a relational database does. which prevents race conditions. 

  ; defining a simple atom
  (def atom-year (atom 2022))
  (println @atom-year)

  ; reset! overwrites the atom value
  (reset! atom-year 1984)
  (println @atom-year)

  (println "---")

  ; compare-and-set! only sets the atom if the comparison passes
  ; returns true if able to set
  ; returns false if unable to set
  (println "if atom value is 2022, set to 2077")
  (println "current atom value: " @atom-year)
  (println "was it able to set? " (compare-and-set! atom-year 2022 2077))
  (println "atom value after trying to set" @atom-year)
  (println "---")

  (println "if atom value is 1984, set to 2077")
  (println "current atom value: " @atom-year)
  (println "was it able to set? " (compare-and-set! atom-year @atom-year 2077))
  (println "atom value after trying to set" @atom-year)
  (println "---")

  ; swap! applies a function to the value, and sets the value returned
  (swap! atom-year inc) 
  (println @atom-year))


(atom-fns)

