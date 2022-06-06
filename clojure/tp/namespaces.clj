(ns clojure.examples.namespaces
  (:gen-class))

(defn namespace-utils []
  (println "clojure namespace related functions")

  ; *ns* prints the current namespaces
  (println "current namespace: " *ns*)

  ; alias adds an alias for another namespace in the current one
  (alias 'string 'clojure.core)

  ; all-ns returns a list of all namespaces
  (println (all-ns))

  ; find-ns finds and returns a particular namespace
  (println (find-ns 'clojure.string'))

  ; ns-name returns the name of a namespace
  (println (ns-name 'clojure.string))

  ; ns-aliases returns aliases associated with namespaces
  (println (ns-aliases 'clojure.core))

  ; ns-map returns all namespace mappings
  (println (ns-map 'clojure.core))

  ; un-alias removes one alias from the namespace
  (alias 'string 'clojure.core)
  (ns-unalias 'clojure.core 'string))


(namespace-utils)

