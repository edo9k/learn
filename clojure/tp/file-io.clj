(ns clojure.examples.hello
  (:gen-class))

; read all file contents, and print
(defn get-full-content []
  (def content (slurp "example-file.txt"))
  (println content))

(get-full-content)

; read file one line at a time
(defn get-each-line []
  (with-open [rdr (clojure.java.io/reader "example-file.txt")]
    (println (reduce conj [] (line-seq rdr)))))

(get-each-line)


; write to file
(defn write-full-content []
  (spit "hi.txt"
        "This is the full content of a the file."))

(write-full-content)


; write to file one line at a time
(defn write-each-line []
  (with-open [w (clojure.java.io/writer "hi-again.txt" :append true)]
    (.write w (str "hello, " "world!"))))

(write-each-line)


; check if file exists
(defn does-the-file-exist []
  (print "Checks if there's a file named 'hello.clj' in this directory -> ")
  (println (.exists (clojure.java.io/file "hello.clj"))))

(does-the-file-exist)

; reading from standard input 
(defn prompt-user-for-name []
  (println "What's is your name? ")
  (let [name (read-line)]
    (println "Hello, " name "!")))

(prompt-user-for-name)

