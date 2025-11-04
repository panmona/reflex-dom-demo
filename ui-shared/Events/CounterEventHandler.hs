module Events.CounterEventHandler (getInitialValue, handleCounterEvent) where

import qualified Counter
import Events.EventTypes

getInitialValue :: () -> Int
getInitialValue () = Counter.getInitialValue ()

handleCounterEvent :: CounterEvent -> Int -> Int
handleCounterEvent ev prevState = case ev of
  CounterUp -> Counter.getNewCount 1 prevState
  CounterDown -> Counter.getNewCount (-1) prevState
