(ns clojure.examples.structmap)

(defn struct-map-fns []

  ; defining and prnting a struct 
  (defstruct Employee :EmployeeName :EmployeeId)
  (println Employee)

  ; creating an object from the struct
  (def emp1 (struct Employee "John" 1))
  (println emp1) 

  ; struct-map does the same, but explicitates keys
  (def emp2 (struct-map Employee :EmployeeName "Mary" :EmployeeId 2))
  (println emp2)

  ; keys can be used to get specific fields
  (println (:EmployeeName emp1))
  (println (:EmployeeId emp1))

  ; structs are immutable
  (println "you can't reassign any value in a struct, they are immutable")
  (println emp1)
  (println "trying to change name from " (:EmployeeName emp1) " to Sam")
  (assoc emp1 :EmployeeName "Sam")
  (println emp1)

  ; 
  (println "the only way to 'change' a struct, is to create a new one")
  (println "with the desired changes already backed-in")

  (def emp1-updated (assoc emp1 :EmployeeName "Sam"))
  (println emp1-updated)


  ; adding a new value follows the same logic
  (println "to add a new key-value pair, you need to create a new struct too")
  (def emp1-ranked (assoc emp1 :EmployeeRank "S"))
  (println emp1-ranked))

(struct-map-fns)

