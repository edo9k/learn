(ns clojure.examples.javainterop)

; importing a java lib
(import java.util.Stack)

(defn using-java []
  
  ; since clojure runs on the JVM, naturally, it can use all the
  ; java ecosystem. for that we use the "dot notation"


  ; some string functions
  (def phrase "java inretop baby!")

  (println (.toUpperCase phrase))
  (println "the bang is located at index: "
    (.indexOf phrase "!"))

  ; creating Java objects
  (def java-string (new String "destroy all classes!!!"))
  (println "this is a java String objet: " java-string)

  (def java-integer (new Integer 8086))
  (println "this is a java Integer object: " java-integer)

  ; using an lib imported from Java
  (let [s (Stack.)]
    (.push s "first element")
    (.push s "second element")
    (println (first s)))

  ; built-in constants
  (println "Java PI constant: " (. Math PI))

  ; system properties
  (println "Java version: " (.. System getProperties (get "java.version"))))


(using-java)

