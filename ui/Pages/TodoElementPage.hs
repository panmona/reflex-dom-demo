{-# LANGUAGE RecursiveDo #-}

module Pages.TodoElementPage (view) where

import Reflex.Dom
import qualified Tx
import qualified Data.Text as T

view :: MonadWidget t m => () -> m ()
view () = elClass "div" "todo-container" $ do
  todoItem "buy coffee"
  todoItem "buy oat milk"
  todoItem "buy sugar"
  return ()

todoItem :: MonadWidget t m => Dynamic t T.Text -> m (Event t ())
todoItem textDyn = elClass "div" "todo-item" $ mdo
  elDynClass "div" removeClassDyn $ 
    dynText textDyn

  removeEv <- button Tx.removeButton
  removeClassDyn <- holdDyn "" $
    "removed" <$ removeEv

  pure removeEv
