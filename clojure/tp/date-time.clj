(ns clojure.examples.datetime)

(defn date-time-fns []

  ; printing current time using the Java Date class
  (def date (new java.util.Date))
  (println (.toString date))

  ; formating the date with java.text.SimpleDateFormat
  (println (.format (java.text.SimpleDateFormat. "dd/MM/yyy") date))

  ; .getTime gets milliseconds since Unix Epoch
  (println (.getTime date))) 

(date-time-fns)

