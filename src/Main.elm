module Main exposing (..)

import Html
import Rocket exposing ((=>), batchInit, batchUpdate)
import Subscriptions exposing (subscriptions)
import Types exposing (..)
import Update exposing (init, update)
import View exposing (view)


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init |> batchInit
        , update = update >> batchUpdate
        , subscriptions = subscriptions
        }
