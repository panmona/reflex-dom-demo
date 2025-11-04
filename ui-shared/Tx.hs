-- Always import this qualified for easy and clear access.
module Tx
  ( pageTitle,
    plusButton,
    minusButton,
  )
where

import qualified Data.Text as T

pageTitle :: T.Text
pageTitle = "Reflex Demo"

plusButton :: T.Text
plusButton = "+"

minusButton :: T.Text
minusButton = "-"
