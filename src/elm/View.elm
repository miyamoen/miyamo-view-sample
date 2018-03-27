module View exposing (view)

import AnimationEvents exposing (AnimationEvent, animationEnd, considerAnimationEvent)
import Css.Inline exposing (Transforms(Rotate), transforms)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (..)
import Html exposing (Html)
import Rocket exposing ((=>))
import Styles exposing (Styles(..), styleSheet)
import Types exposing (..)


view : Model -> Html Msg
view model =
    Element.viewport styleSheet <|
        column None
            [ width <| fill
            , height <| fill
            , center
            , verticalCenter
            ]
            [ text "Hello, Style Elements"
            , loadingButton model
            ]


loadingButton : Model -> Element Styles variation Msg
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
        , el (VarN Styles.n)
            [ width <| px 120
            , height <| px 120
            , classList [ "loading-a" => True ]
            ]
            empty
            |> within
                (List.range 0 (Styles.n - 1)
                    |> List.map (loadingCircle Styles.n)
                )
        ]


loadingCircle : Int -> Int -> Element Styles variation msg
loadingCircle n index =
    row (VarI index)
        [ width fill
        , height fill
        , padding 2
        , center
        , classList [ "item" => True ]
        , inlineStyle [ transforms [ Rotate <| degrees (toFloat index * 360 / toFloat n) ] ]
        ]
        [ el None
            [ width <| px 20
            , height <| px 20
            , classList [ "ball" => True ]
            ]
            empty
        ]


attrWhen : Bool -> Attribute variation msg -> Attribute variation msg
attrWhen bool attr =
    if bool then
        attr
    else
        classList []
