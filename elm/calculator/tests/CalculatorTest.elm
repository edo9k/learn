module CalculatorTest exposing (all)

import Main
import ProgramTest exposing (
    ProgramTest, clickButton, expectViewHas, 
    fillIn, update, within)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class, text)


start : ProgramTest Main.Model Main.Msg (Cmd Main.Msg)
start = 
  ProgramTest.createDocument
    { init = Main.init
    , update = Main.update
    , view = Main.view
    }
    |> ProgramTest.start ()


clickCalcBtn : String -> ProgramTest model msg effect -> ProgramTest model msg effect
clickCalcBtn btnText = 
  within (Query.find [ class "section" ]) (clickButton btnText)


all : Test
all =
  describe "basic arithmetic"
    [ test "20 * 3 = 60" <|
      \() -> 
        start
          |> clickCalcBtn "2"
          |> clickCalcBtn "0"
          |> clickCalcBtn "Enter"
          |> clickCalcBtn "3"
          |> clickCalcBtn "*"
          |> expectViewHas
            [ text "60"
            ]
    ] 

