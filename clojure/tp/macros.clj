(ns clojure.examples.macros)

(defn macro-fns [] 

  ; defmacro creates a macro
  (defmacro spaced-hello [] 
    (println "\n\n h e l l o \n\n"))

  ; macroexapand places the macro code inline
  (macroexpand '(spaced-hello))

  ; naturally, macros can have arguments
  (defmacro covid-year [year]
    (println "It's the Covid Year of Our Lord of " year "."))

  ; executing with macroexpand
  (macroexpand '(covid-year 2022)))

(macro-fns)

