(ns clojure.examples.exceptions
  (:gen-class))

(defn exception-handling []

  (println "catching no such file/directory exception")
  (try
    (def text (slurp "non-existant-file.txt"))
    (println text)
    (catch Exception e (println (str "caught: " (.getMessage e)))))

  
  (println "catching array out of bounds excetion")
  (try
    (aget (int-array [1 2 3]) 9)
    (catch Exception e (println (str "caught: " (.toString e))))
    (finally (println "finally always runs, with or without exception."))))

(exception-handling)
