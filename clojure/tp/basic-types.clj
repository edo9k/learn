(ns clojure.examples.hello
  (:gen-class))

; some elementary types
(defn Example []
  ; declaring an integer
  (def year 2022)

  ; declaring a float
  (def bad-pi 3.14)

  ; and a string
  (def question "why learn another language, mate?")

  ; displaying
  (println year)
  (println bad-pi)
  (println question))

; call function (or Java class? not sure) 
(Example)

