(ns clojure.example.metadata)

(defn metada-fns [] 

  ; metadata is used to anotate objects. 
  ; it seems this is used 'under the hood' a bit like Javascript 
  ; Symbol methods and properties. 
  ; apparently this is used extensively by the Clojure interpreter
  ; to control behavior, pass macros around, mark objects and etc. 

  ; with-meta adds metadata to an object
  (def years [2020 2021 2022])
  (def annotated (with-meta years {:description "covid years so far"}))

  ; meta retrieves any metadata associated to an object
  (println annotated)
  (println (meta annotated))

  ; vary-meta returns new object with same value and type, but with 
  ; combined metadata

  (def map1 (with-meta [1 2 3] {:prop "values"}))
  (println (meta map1))

  (def map2 (vary-meta map1 assoc :newprop "new values"))
  (println (meta map2)))

(metada-fns)

