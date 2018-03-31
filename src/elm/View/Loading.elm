module Loading exposing (..)

import Css.Inline exposing (Transforms(Rotate), transforms)
import Element exposing (..)
import Element.Attributes exposing (..)
import Rocket exposing ((=>))
import Styles exposing (Styles(..), Variation(..), styleSheet)


blinkingCircle : Int -> Element Styles Variation msg
blinkingCircle n =
    el None
        [ width <| px 120
        , height <| px 120
        , vary (VarN n) True
        , classList [ "blinking-circle" => True ]
        ]
        empty
        |> within
            (List.range 0 (n - 1)
                |> List.map (blinkingBall n)
            )


blinkingBall : Int -> Int -> Element Styles Variation msg
blinkingBall n index =
    row None
        [ width fill
        , height fill
        , padding 2
        , center
        , vary (VarI index) True
        , inlineStyle
            [ transforms
                [ Rotate <| degrees (toFloat index * 360 / toFloat n) ]
            ]
        ]
        [ el None
            [ width <| px 20
            , height <| px 20
            , classList [ "blinking-ball" => True ]
            ]
            empty
        ]
