(ns clojure.examples.hello
  (:gen-class))

; while loop
(defn WhileLoop []
  (println "counting with `while`")
  (def x (atom 1))
  (while (< @x 5)
    (do
        (println @x)
        (swap! x inc))))


; loop keyword
(defn LoopKeyword []
  (println "using the `loop` keyword")
  (loop [x 5]
    (when (> x 0)
      (println x)
      (recur (- x 1)))))


; dotimes keyword
(defn DoTimesKeyword []
  (println "using the `dotimes` keyword")
  (dotimes [n 5]
    (println n)))


; doseq keyword
(defn DoSeqKeyword []
  (println "using the `doseq` keyword")
  (doseq [n [0 1 2 3]]
    (println n)))

(WhileLoop)
(LoopKeyword)
(DoTimesKeyword)
(DoSeqKeyword)

