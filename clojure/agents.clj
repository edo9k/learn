(ns clojure.example.agents)

(defn agent-fns [] 

  ; agent defines an agent, followed by it's initial value
  (def counter (agent 0))
  (println counter)
  
  ; @agent-name prints the value stored in that agent (without the status)
  (println @counter)

  ; send connect an agent with a callback function, able to alter it's value
  (send counter + 256)
  (println "incrementing counter:")
  (println @counter) ; still prints zero

  ; shutdown-agents stops all running agents
  ; (shutdown-agents)
  ; (println @counter) ; now it prints 256

  ; await-for waits for the agent to be update before executing
  (send-off counter - 128)
  (println (await-for 100 counter))
  (println @counter)

  ; await blocks thread until agent dispatches all actions
  (send-off counter + 2)
  (await counter)
  (println @counter)

  ; agent-error raises an exception if an agent fails
  (def my-date (agent (java.util.Date.)))
  (send my-date + 100)
  (await-for 100 my-date)
  (println (agent-error my-date))

  (shutdown-agents))

(agent-fns)

