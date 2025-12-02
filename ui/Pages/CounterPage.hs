{-# LANGUAGE RecursiveDo #-}

module Pages.CounterPage (view) where

import Events.CounterEventHandler (getInitialValue, handleCounterEvent)
import Events.EventTypes
import Reflex.Dom
import qualified Tx
import Utils.Utils (tshow)

view :: (MonadWidget t m) => () -> m ()
-- Elements are rendered in the order they are declared.
-- Creates a "main" html element that has the class "container". 
-- "=:" creates a map with one element
view () = mdo
  -- Creates a very simple button. Returns the event of when it gets clicked.
  plusEv <- button Tx.plusButton
  -- Shows the current counter value (which is defined below). We can do this because we have recursive do enabled (see the mdo at the start of the function)
  -- We need to use tshow to convert the value to the type T.Text.
  -- We need to use fmap (<$>) as curVal has a Dynamic type and the type that the Dynamic contains should be changed.
  dynText (tshow <$> curVal)
  minusEv <- button Tx.minusButton

  -- Assigns a value to the unit events. Creates a list of these events and returns the leftmost one in the list if multiple occur at the same time (impossible in this case so it doesn't matter which one it returns first)
  let counterEv = leftmost [CounterUp <$ plusEv, CounterDown <$ minusEv]
  -- foldDyn has type: (a -> b -> b) -> b -> Event t a -> m (Dynamic t b)
  -- So we give a folding function that takes the event and the last state, and then returns the new state.
  -- Then we give the initial state.
  -- And the last parameter is the event.
  curVal <- foldDyn handleCounterEvent (getInitialValue ()) counterEv

  return ()
