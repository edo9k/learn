(ns clojure.examples.regex
  (:gen-class))

(defn regular-expressions []
  
  ; re-pattern returns an intance of java.util.regex.Pattern
  ; which can later be applied to strings
  (def numbers (re-pattern "\\d+"))
  (println "regex that matches numbers: " numbers)

  ; re-find returns the next match of a pattern (if any)
  ; it uses java.util.regex.Matcher.find()
  (def example-text "The year is 2022 now. Last year was 2021.")
  (println (re-find numbers example-text))

  ; replace does what the name says with the matched pattern
  ; it replaces all occurences in the text
  (println (clojure.string/replace example-text numbers "1453"))

  ; replace-first replaces only the first occurence
  (println (clojure.string/replace-first example-text numbers "1453")))





(regular-expressions)
