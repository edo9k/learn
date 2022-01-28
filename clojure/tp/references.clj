(ns clojure.examples.references)

(defn ref-fns [] 

  ; ref creates a reference
  ; you can also provide a validator function
  (def world-population (ref 7923430772 :valiador pos?))
  (println @world-population)
  
  ; ref-set changes the reference state
  (dosync (ref-set world-population (+ @world-population 76569228)))
  (println @world-population) 

  ; dosync is needed because the function might runs on a different thread
  ; dosync is akin to a database transaction

  ; alter also changes the state of a reference, but in a safe manner
  
  (def beatles (ref []))

  (defn add-beatle [new-beatle]
    (dosync 
      (alter beatles conj new-beatle)))
  
  (add-beatle "John Lennon")
  (add-beatle "Paul McCartney")
  (add-beatle "George Harrison")
  (add-beatle "the drummer")

  (println (clojure.string/join ", " @beatles))


  ; commute is a special version of alter
  ; alter preserves information about who or where a transation was
  ; started, commute does not care about that (which can be faster in 
  ; some situations). but usually alter is used more (says stackoverflow)
  (def counter (ref 0))

  (defn inc-counter [counter]
    (dosync
      (commute counter inc)))

  (inc-counter counter)
  (println @counter)

  (inc-counter counter)
  (println @counter))

(ref-fns)

