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


weekday dayNumber = 
  case dayNumber of
    0 -> "Sunday"
    1 -> "Monday"
    2 -> "Tuesday"
    3 -> "Wednesday"
    4 -> "Thursday"
    5 -> "Friday"
    6 -> "Saturday"
    _ -> "Unknown day"

hashtag dayNumber =
  case weekday dayNumber of 
    "Sunday"    -> "#SinDay"
    "Monday"    -> "#MondayBlues"
    "Tuesday"   -> "#TakeMeBackTuesday"
    "Wednesday" -> "#Humpday"
    "Thursday"  -> "#ThrowbackThursday"
    "Friday"    -> "#FlashbackFriday"
    "Saturday"  -> "#Caturday"
    _           -> "#NonExistingOption"



revelation = 
  """
  This is an example of a multiline string in Elm. 
  It's just like the ones in Pyhthon, I think. You 
  can even use regular "quotes" inside it.
  """


main = 
  Html.text revelation



{--
main = 
  Html.text <| hashtag 5

main =
  escapeEarth 10 6.7 "low"
    |> Html.text
    
main = 
  computeTime 2 3
    |> computeSpeed 7.67
    |> escapeEarth 11
    |> Html.text
--}

