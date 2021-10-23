module Playground exposing (main)

import Html

escapeEarth myVelocity mySpeed fuelStatus = 
  let 
    -- escape velocity in km/s
    escapeVelocity = 11.186
  
    -- orbital speed in km/s
    orbitalSpeed = 7.67

    whereToLand =
      if fuelStatus == "low" then
        "Land on droneship"
      else
        "Land on launchpad"

  in

  if myVelocity > escapeVelocity  then
    "Goodspeed"

  else if mySpeed == orbitalSpeed then
    "Stay in orbit"

  else 
    whereToLand 

computeSpeed distance time = 
  distance / time


computeTime startTime endTime = 
  endTime - startTime


main =
  escapeEarth 10 6.7 "low"
    |> Html.text
    


{--
main = 
  computeTime 2 3
    |> computeSpeed 7.67
    |> escapeEarth 11
    |> Html.text
--}

