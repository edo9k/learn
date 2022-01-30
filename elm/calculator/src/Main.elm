module Main exposing (Model, Msg, init, main, update, view) 

import Browser
import Browser.Events exposing (onKeyDown)
import Html exposing (Html, button, div, pre, h1, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Json.Decode as D
import Keyboard.Event as KE exposing (KeyboardEvent, decodeKeyboardEvent)
import Keyboard.Key as KK

type alias Model =
  { stack : List Float
  , currentNum : String
  , error : Maybe String
  , dirty : Bool
  }


init : () -> ( Model, Cmd Msg )
init () =
  ( { stack = []
    , currentNum = "0"
    , error = Nothing
    , dirty = False
    }
  , Cmd.none
  )


subscriptions : Model -> Sub Msg
subscriptions model = 
  onKeyDown (D.map HandleKeyboardEvent decodeKeyboardEvent)


type Operator 
  = Div
  | Mult
  | Sub
  | Add


operatorToString : Operator -> String
operatorToString operator = 
  case operator of
    Div   -> "/"
    Mult  -> "*"
    Sub   -> "-"
    Add   -> "+"


operatorFunction : Operator -> (Float -> Float -> Float)
operatorFunction op = 
  case op of
    Div   -> (/)
    Mult  -> (*)
    Sub   -> (-)
    Add   -> (+)


type Msg
  = InputOperator Operator
  | InputNumber Float
  | Clear
  | ClearAll
  | Back
  | Enter
  | SetDecimal
  | SetSign 
  | HandleKeyboardEvent KeyboardEvent


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of

    SetDecimal ->
      if String.contains "." model.currentNum then
        ( model, Cmd.none )
      else 
        ( { model | currentNum = model.currentNum ++ "." }, Cmd.none )

    ClearAll  -> 
      init ()

    Clear  -> 
      ( { model | currentNum = "0", dirty = False }, Cmd.none )

    SetSign -> 
      if model.currentNum == "0" then
        ( model, Cmd.none )
      else if String.startsWith "-" model.currentNum then
        ( { model | currentNum = String.dropLeft 1 model.currentNum }, Cmd.none )
      else 
        ( { model | currentNum = "-" ++ model.currentNum }, Cmd.none )

    Back -> 
      let
        newNum = String.dropRight 1 model.currentNum
      in
        ( { model
          | currentNum = 
            if String.isEmpty newNum then
              "0"
            else
              newNum
          }
          , Cmd.none 
        )

    Enter     -> 
      let 
        maybeNumber =
          String.toFloat model.currentNum
      in
        case maybeNumber of
          Nothing -> 
            ( { model | error = Just "PARSE ERR" }, Cmd.none )

          Just num -> 
            ( { model | stack = num :: model.stack, dirty = True }, Cmd.none )

    InputOperator operator -> 
      case model.stack of
        [] ->
          ( model, Cmd.none )

        x :: xs -> 
          let 
            op = 
              operatorFunction operator 

            maybeNumber = 
              String.toFloat model.currentNum
          in
          case maybeNumber of 
            Nothing -> 
              ( { model | error = Just "PARSE ERR" }, Cmd.none )

            Just num ->
              let
                newNum =
                  op num x

              in
                ( { model
                  | stack = xs
                  , currentNum = String.fromFloat newNum
                  , dirty = True
                 }
                , Cmd.none
                )


    InputNumber num ->
      let
        newModel = 
          if model.currentNum == "0" then
            { model | currentNum = String.fromFloat num }
          else if model.dirty then
            { model | currentNum = String.fromFloat num, dirty = False }

          else 
          { model | currentNum = model.currentNum ++ String.fromFloat num } 
      in
        ( newModel, Cmd.none )


    HandleKeyboardEvent event ->
      case event.keyCode of
        KK.Multiply -> update (InputOperator Mult) model
        KK.Divide   -> update (InputOperator Div) model
        KK.Add      -> update (InputOperator Add) model
        KK.Subtract -> update (InputOperator Sub) model

        KK.Decimal   -> update SetDecimal model
        KK.Enter     -> update Enter model
        KK.Backspace -> update Back model

        KK.NumpadZero   -> update (InputNumber 0) model
        KK.NumpadOne    -> update (InputNumber 1) model
        KK.NumpadTwo    -> update (InputNumber 2) model
        KK.NumpadThree  -> update (InputNumber 3) model
        KK.NumpadFour   -> update (InputNumber 4) model
        KK.NumpadFive   -> update (InputNumber 5) model
        KK.NumpadSix    -> update (InputNumber 6) model
        KK.NumpadSeven  -> update (InputNumber 7) model
        KK.NumpadEight  -> update (InputNumber 8) model
        KK.NumpadNine   -> update (InputNumber 9) model

        _ -> ( model, Cmd.none ) 

-- view

type Color 
  = Yellow
  | Gray
  | White


colorToString : Color -> String
colorToString color = 
  case color of
    Yellow  -> "bg-yellow"
    Gray    -> "bg-gray"
    White   -> "bg-white"


type Size
  = Single
  | Double
  | Triple


sizeToString : Size -> String
sizeToString size = 
  case size of 
    Single -> "single"
    Double -> "double"
    Triple -> "triple"


cell : Html.Attribute Msg -> Size -> Color -> String -> Html Msg 
cell attr size color content =
  button 
    [ class <|
        String.join " " <|
          [ "cell", sizeToString size, colorToString color ]
    , attr
    ]
    [ text content ]


section : Html Msg
section = 
  div [ class "section" ]
      [ cell (onClick Back) Single Gray     "←"
      , cell (onClick Clear) Single Gray    "C"
      , cell (onClick ClearAll) Single Gray "CE"

      , cell (onClick <| InputOperator Div) Single Yellow  "/"
      , cell (onClick <| InputNumber 7) Single White "7"
      , cell (onClick <| InputNumber 8) Single White "8"
      , cell (onClick <| InputNumber 9) Single White "9"

      , cell (onClick <| InputOperator Mult) Single Yellow  "*"
      , cell (onClick <| InputNumber 4) Single White   "4"
      , cell (onClick <| InputNumber 5) Single White   "5"
      , cell (onClick <| InputNumber 6) Single White   "6"

      , cell (onClick <| InputOperator Sub) Single Yellow  "-"
      , cell (onClick <| InputNumber 1) Single White   "1"
      , cell (onClick <| InputNumber 2) Single White   "2"
      , cell (onClick <| InputNumber 3) Single White   "3"

      , cell (onClick <| InputOperator Add) Single Yellow  "+"
      , cell (onClick <| InputNumber 0) Single White   "0"

      , cell (onClick SetDecimal) Single White   "."
      , cell (onClick SetSign) Single White "+/-"
      , cell (onClick Enter) Single Yellow  "Enter"
      ]


emptyBox : Html Msg
emptyBox =
  div 
    [ class "input-box"
    ]
    [ span [ class "empty" ] [ text "empty" ]
    ]


stackBox : Float -> Html Msg
stackBox num = 
  div 
    [ class "input-box"
    ]
    [ text <| String.fromFloat num
    ]


inputBox : Html Msg -> Html Msg
inputBox num =
  div 
    [ class "input-box"
    ]
    [ num
    ]


view : Model -> Browser.Document Msg
view model = 
  { title = "Calculator (in Elm)"
  , body =
    [ div []
      [ h1 [ class "h1" ] [ text "Calculator" ]
      , div
        [ class "calculator" ]
        (List.repeat (3 - List.length model.stack) emptyBox
          ++ List.map stackBox (List.reverse <| List.take 3 model.stack)
          ++ [ inputBox <| 
                case model.error of
                  Nothing -> 
                    text model.currentNum

                  Just err -> 
                    span [ class "error" ] [ text err ] 
              , section
              ]
        )
      -- , pre [] [ text <| Debug.toString model ]
      ]
    ]
  }



main : Program () Model Msg
main =
  Browser.document
    { view = view
    , init = init
    , update = update
    , subscriptions = subscriptions
    }

