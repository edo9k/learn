(ns clojure.examples.hello
  (:gen-class))

(defn text-utils []
  (println "clojure builtin text utilities")
  (println "dumb mnemonics as comments") 

  ; str concats string lists
  (println (str "Pen" "Pineapple" "Apple" "Pen"))

  ; fmt formats strings (using java.lang.String.format)
  (println (format "Second in an day %06d" (* 24 60 60)))
  (println (format "The name is %s, %s %s." "Bond" "James" "Bond"))

  ; count gets the length of a string
  (println "Love is a")
  (println (count "love"))
  (println "letter word.")

  ; subs extracts substrings
  (println "the quick brown fox jumps over the lazy dog")
  (println (subs "the quick brown fox jumps over the lazy dog" 3 8))
  (println (subs "the quick brown fox jumps over the lazy dog" 8 13))

  ; compare logically compares two strings, returns codepoint difference
  (println (compare "A" "a"))
  (println (compare "A" "A"))
  (println (compare "a" "A"))
  (println (compare "a" "b"))

  ; lower-case 
  (println 
    "OVERLY EXITED TEXT -> "
    (clojure.string/lower-case "OVERLY EXITED TEXT"))

  ; upper-case
  (println
    "not excited enough text -> "
    (clojure.string/upper-case "not exited enough text"))

  ; join, works like Javascript's [0, 1, 2].join(", ") 
  (println (clojure.string/join ", " [0 1 2 3 4]))

  ; split (the last parameter is a regex that chooses where to split)
  (println (clojure.string/split "I am sleepy." #""))

  ; split-lines
  (println (clojure.string/split-lines "line 1\nline 2\nline 3"))

  ; reverse
  (println (reverse "Black Sabbath Loves Satan"))

  ; replace (replaces all matched occurences)
  (println (clojure.string/replace "Java, Javascript, Clojure, Julia." #"J" "W"))

  ; trim, triml (left), trimr (right)
  (println "->"                       "   unecessary spaces       "  "<-" )
  (println "->" (clojure.string/trim  "   unecessary spaces       ") "<-" )
  (println "->" (clojure.string/triml "   unecessary spaces       ") "<-" )
  (println "->" (clojure.string/trimr "   unecessary spaces       ") "<-" ))

(text-utils)

