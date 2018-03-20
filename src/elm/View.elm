module View exposing (view)

import Element exposing (..)
import Element.Attributes as Attrs exposing (..)
import Element.Events exposing (..)
import Html exposing (Html)
import Styles exposing (Styles(..), styleSheet)
import Types exposing (..)


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            [ width <| fill
            , height <| fill
            , spacing 10
            , center
            , verticalCenter
            ]
            [ text "Hello, Style Elements"
            ]
