(ns clojure.example.predicates
  (:gen-class))

(defn predicates []

  ; predicates return true|false to test something about a value

  (def tests [ 2022 2021 0 1 -273 ])
  (println "values where testing: " tests)

  (println "even? " (map even? tests))
  (println "odd?  " (map odd?  tests))

  (println "pos?  " (map pos? tests))
  (println "neg?  " (map neg? tests))

  ; every-pred returns a function that return true if all 
  ; elements tested pass the test
  (println ((every-pred number? even?) 2 4 6))
  (println ((every-pred number? odd? ) 2 4 6))

  ; every? returns true if all values passed test true
  (println (every? even? '(2 4 6)))
  (println (every? odd?  '(2 4 6)))

  ; some returns true if at least one value passes the test
  ; otherwise retruns falsy nil (but not *false* per se)
  (println (some even? '(1 2 3 4)))
  (println (some even? '(5 7 9 1)))

  ; not-any? returns true if "not any" pass the test
  (println (not-any? even? '(2 4 6))))

(predicates)

