module Update exposing (init, update)

import Rocket exposing ((=>))
import Types exposing (..)


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []


init : ( Model, List (Cmd Msg) )
init =
    {} => []
