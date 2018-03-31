module Showcase exposing (..)

import Element exposing (..)
import Element.Attributes exposing (..)
import Rocket exposing ((=>))
import Styles exposing (Styles(..), Variation)


type alias Size =
    { width : Length, height : Length }


view : Size -> List (Element Styles Variation msg) -> Element Styles Variation msg
view size items =
    wrappedRow None
        [ width size.width
        , height size.height
        , padding 5
        , spread
        , classList [ "showcase" => True ]
        ]
    <|
        List.map box items


box : Element Styles Variation msg -> Element Styles Variation msg
box item =
    column None
        [ classList [ "box" => True ]
        , padding 10
        , inlineStyle [ "width" => "fit-content", "height" => "fit-content" ]
        ]
        [ item ]
