(ns clojure.examples.sets
  (:require [clojure.set])
  (:gen-class))

(defn set-functions []
  (println "set and related functions")

  ; set creates a set (by definition, no repeated elements)
  (println (set '(2 0 2 2)))

  ; sorted-set creates a set, but sorted
  (println (sorted-set 5 4 3 2 1))

  ; get gets and element from nth position in the set
  (println (get (set '(2020 2021 2022)) 2))

  ; contains? checks if a set contains an provided element
  (println (contains? (set '(1 2 3)) 5))
  (println (contains? (set '(1 2 3)) 1))

  ; conj appends an element to a set
  (println (conj (set '(1 2 3)) 666))

  ; disj disjoin (ie removes) an element from a set (returns new set)
  (println (disj (set '(1 2 3)) 3))


  ; example sets that will be used for union/diff/intersection

  (def a #{1 2 3})
  (def b #{3 4 5})
  (def c #{1 3})

  ; union returns the union of two sets (probably any number of sets)
  (println (clojure.set/union a b))

  ; intersection does what the name says
  (println (clojure.set/intersection a b))

  ; subset? checks if one set is a subset of the other
  (println (clojure.set/subset? a b))
  (println (clojure.set/subset? c a))

  ; superset? checks if the first set is a superset of the other
  (println (clojure.set/superset? a b))
  (println (clojure.set/superset? a c)))


(set-functions)

