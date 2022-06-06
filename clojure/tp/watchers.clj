(ns clojure.examples.watchers)

(defn watcher-fns [] 
  
  ; watchers, apparently, are the way clojure implements the obeserver pattern.

  ; add-watch attaches a watcher to an atom, agent, variable, or reference.
  (def year (atom 2021))

  (add-watch year :watcher
             (fn [key atom old-state new-state]
               (println "that state of atom 'year' has changed")
               (println "old state was: " old-state)
               (println "new state is: " new-state)))

  (reset! year 2020) ; another covid loop 


  ; remove-watch removes a watcher
  (remove-watch year :watcher)

  (println "now it won't be triggered when we change the state of the atom")
  (reset! year 1984)

  (println "year was set to -> " @year "(no watcher triggered)" ))


(watcher-fns)

