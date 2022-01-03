(ns clojure.examples.hello
  (:gen-class))

; basic if-else
(defn If []
  (if (= 2 2)
    (println "values are equal")
    (println "values are not equal")))

; if-do block
(defn IfDo []
  (if (= 2 2)
    (do 
      (println "values are equal")
      (println "other statements..."))
    (do
      (println "values are not equal")
      (println "other statements..."))))


; case structure
(defn CaseBlock []
  (def year 2022)
  (case year 
    2022 (println "current year")
    2021 (println "previous year")
    2023 (println "following year")
    (println "year was not provided")))

; cond statement
(defn CondBlock []
  (def number-of-legs 2)
  (cond
    (= number-of-legs 4) (println "quadruped")
    (= number-of-legs 2) (println "biped")
    :else (println "spider? snake?")))

(If)
(IfDo)
(CaseBlock)
(CondBlock)

