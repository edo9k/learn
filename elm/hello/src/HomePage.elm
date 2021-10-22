module HomePage exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

view model = 
  div [ class "jumbotron" ]
      [ h1 [] [ text "First Elm test page. " ]
      , p []
          [ text "More filler text, something, something." 
          , strong [] [ text "Strong text" ]
          , text <|
            """
            and more normal text.
            Which can be go on for multiple lines.
            And stuff.
            """
          ]
      ]

main = 
  view "dummy model"

