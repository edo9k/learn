module Post exposing (Post, PostId, postDecoder, postsDecoder)

import Json.Decode as Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (required)


type alias Post =
  { id : PostId
  , title : String
  , authorName : String
  , authorUrl : String
  }

type PostId
  = PostId int

postsDecoder : Decoder (List Post)
postsDecoder = 
  list postDecoder


idDecoder : Decoder PostId
idDecoder =
  Decode.map PostId int


postDecoder : Decoder Post
postDecoder = 
  Decode.succeed Post
    |> required "id" idDecoder
    |> required "title" string
    |> required "authorName" string
    |> required "authorUrl" string

