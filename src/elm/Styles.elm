module Styles exposing (Styles(..), styleSheet)

import Color exposing (Color, rgba)
import Color.Convert exposing (colorToCssRgba)
import Miyamo.Color as COlor
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Transition as Transition exposing (Transition)


type Styles
    = None


styleSheet : StyleSheet Styles variation
styleSheet =
    Style.styleSheet
        [ style None []
        ]


zIndex : Int -> Property class variation
zIndex n =
    prop "z-index" (toString n)
