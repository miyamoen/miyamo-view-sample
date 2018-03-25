module Update exposing (init, update)

import Rocket exposing ((=>))
import Types exposing (..)


update : Msg -> Model -> ( Model, List (Cmd Msg) )
update msg model =
    case msg of
        NoOp ->
            model => []

        Load ->
            { model | state = Loading } => []

        EndLoading ->
            { model | state = Completed } => []

        EndCompleted ->
            { model | state = Idle } => []


init : ( Model, List (Cmd Msg) )
init =
    { state = Idle } => []
