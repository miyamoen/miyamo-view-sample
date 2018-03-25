module Styles exposing (Styles(..), styleSheet)

import Color exposing (Color, rgba)
import Color.Convert exposing (colorToCssRgba)
import Miyamo.Color as COlor
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Sheet exposing (mix)
import Style.Transition as Transition exposing (Transition)


type Styles
    = None
    | VarN Int
    | VarI Int


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ style None []
        , style (VarN 8) [ varN 8 ]
        , List.range 0 7
            |> List.map (\i -> style (VarI i) [ varI i ])
            |> mix
        ]


varN : Int -> Property style variation
varN n =
    prop "--miyamoen-n" <| toString n


varI : Int -> Property style variation
varI n =
    prop "--miyamoen-i" <| toString n


zIndex : Int -> Property style variation
zIndex n =
    prop "z-index" (toString n)
