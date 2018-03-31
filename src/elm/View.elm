module View exposing (view)

import AnimationEvents exposing (AnimationEvent, animationEnd, considerAnimationEvent)
import Css.Inline exposing (Transforms(Rotate), transforms)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (..)
import Html exposing (Html)
import Loading exposing (blinkingCircle)
import Rocket exposing ((=>))
import Showcase
import Styles exposing (Styles(..), Variation(..), styleSheet)
import Types exposing (..)


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            [ width fill
            , height fill
            , center
            , verticalCenter
            , padding 10
            ]
            [ text "View Sample"
            , Showcase.view { width = fill, height = fill } [ blinkingCircle 12 ]
            ]


loadingButton : Model -> Element Styles Variation Msg
loadingButton { state } =
    column None
        [ center
        , verticalCenter
        , attrWhen (state == Idle) <| onClick Load

        -- , on animationEnd <|
        --     considerAnimationEvent
        --         (\{ name } ->
        --             if name == AnimationName.fadeOut then
        --                 Just EndOpeningAnimation
        --             else
        --                 Nothing
        --         )
        ]
        [ button None [] <| text "Load"
        , blinkingCircle 12
        ]


attrWhen : Bool -> Attribute variation msg -> Attribute variation msg
attrWhen bool attr =
    if bool then
        attr
    else
        classList []
