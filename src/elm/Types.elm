module Types exposing (..)


type alias Model =
    { state : State }


type State
    = Loading
    | Completed
    | Idle


type Msg
    = NoOp
    | Load
    | EndLoading
    | EndCompleted
