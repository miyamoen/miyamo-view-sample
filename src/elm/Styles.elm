module Styles exposing (Styles(..), Variation(..), n, styleSheet)

import Style exposing (..)
import Style.Sheet exposing (mix)


n : Int
n =
    24


type Styles
    = None


type Variation
    = VarN Int
    | VarI Int


styleSheet : StyleSheet Styles Variation
styleSheet =
    Style.styleSheet
        [ style None <|
            List.concat
                [ List.range 1 n
                    |> List.map (\n -> variation (VarN n) [ varN n ])
                , List.range 0 (n - 1)
                    |> List.map (\i -> variation (VarI i) [ varI i ])
                ]
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
