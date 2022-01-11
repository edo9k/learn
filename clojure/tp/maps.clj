(ns clojure.example.maps
  (:require [clojure.set])
  (:gen-class))

(defn clojure-maps []
  (println "clojure comes with built-in HashMaps and SortedMaps")

  ; hash-map 
  (def plain-hashmap (hash-map "year" "2022" "month" "january" "day" "10"))
  (println plain-hashmap)

  ; sorted-map
  (def sorted-hashmap (sorted-map "year" "2022" "month" "january" "day" "10"))
  (println sorted-hashmap)

  ; get to retrieve value from provided key
  (println (get plain-hashmap "year"))

  ; contains? checks if key exists in the hashmap
  (println (contains? plain-hashmap "day"))
  (println (contains? plain-hashmap "time"))

  ; find returns the [key value] pair for provided key
  (println (find plain-hashmap "month"))
  (println (find plain-hashmap "time"))

  ; keys returns a list of keys in the map
  (println (keys plain-hashmap))

  ; vals returns a list of values in the map
  (println (vals plain-hashmap))

  ; dissoc returns a new map with a key-value removed
  (println (dissoc plain-hashmap "year"))

  ; merge merges two maps
  (def hour-map (hash-map "hour" "22" "minute" "27" "second" "55"))
  (println (merge plain-hashmap hour-map))

  ; merge-with merges two maps, appling an operation for keys that exist
  ; in both maps (like sum, subtraction, etc)
  (def a (hash-map :x 10 :y 20 :z 666))
  (def b (hash-map :x  9 :y 21))
  (println "merging two maps, subtracting value that exists in both")
  (println "map a" a)
  (println "map b" b)
  (println "merged with subtraction: " (merge-with - a b))

  ; select-keys returns a map only with the selected entries
  (println (select-keys plain-hashmap ["day" "month"]))

  ; rename-keys returns a new map with the renamed keys
  (println (clojure.set/rename-keys plain-hashmap {"year" "current-year"}))

  ; map-invert transform keys in values, and values in keys
  (println (clojure.set/map-invert plain-hashmap)))

(clojure-maps)

