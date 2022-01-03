(ns clojure.example.hello
  (:gen-class))

; a lambda / anonymous function
(defn Anon []
  (println ((fn [x] (+ 2 x)) 2020)))

(Anon)

; a variadic function (varying number of arguments)
(defn Variadic [message & others]
  (println message (clojure.string/join " " others)))

(Variadic "~>" "this example" "comes from" "a" "variadic function")

; defn vs def fn 
(println "`defn` is a abbreviation of `(def name (fn [arg] (...)))`")

(defn abbrev       [] (println "printed from defn abbrev function" ))
(def  unabbrev (fn [] (println "printed from def(fn unabbrev) function" )))

(abbrev)
(unabbrev)

; higher order function
(println "filtering even numbers in 1~10 with higher order function")
(println "a lot like in Javascript, Haskell, etc.")

(println (filter even? (range 0 10)))

