(ns clojure.examples.lists
  (:gen-class))

(defn list-functions []
  (println "list related functions")

  ; list creates a list (surprisinly enough)
  (println "list of pandemic years so far:")
  (println (list 2020 2021 2022))

  ; list* creates a new list by appending param-1 to param-2 
  (println (list* 'will [ 'this, 'pandemic, 'ever, 'end ]))

  ; first gets the first element of a list
  (println (first (list 'lisp 'clojure 'racket)))

  ; nth gets the nth element of a list
  (println (nth (list 'lisp 'clojure 'racket) 1))

  ; cons returns new list an element added to the head
  (println (cons 'javascript (list 'c 'java 'rust)))

  ; conj returns a new list, old list the first parameter
  ; elements to be added come after that
  (println (conj (list 'linux 'macos) 'windows 'kolibrios 'templeos))

  ; rest same as 'tail' in a bunch of functional languages
  (println (rest (list 'lisp 'clojure 'racket))))


(list-functions)

