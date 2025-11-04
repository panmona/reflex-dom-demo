-- Disabled so that we don't need to **always** touch the Main body element constraints when something in the children change
{-# OPTIONS_GHC -Wno-redundant-constraints #-}

module Main (main) where

import qualified Data.Map.Strict as Map
import qualified Page.Page as Page
import Reflex.Dom
import qualified Tx
import Utils.StaticFiles (cssFiles)

main :: IO ()
main = mainWidgetWithHead headElement bodyElement

headElement :: (DomBuilder t m) => m ()
headElement = do
  el "title" $ text Tx.pageTitle
  elAttr "meta" ("name" =: "viewport" <> responsiveHeader) blank
  _ <- mapM styleSheet $ cssFiles
  return ()
  where
    responsiveHeader = ("content" =: "width=device-width, initial-scale=1.0")
    styleSheet href =
      elAttr
        "link"
        ( Map.fromList
            [ ("rel", "stylesheet"),
              ("type", "text/css"),
              ("href", href)
            ]
        )
        $ return ()

bodyElement :: (MonadWidget t m) => m ()
bodyElement = Page.view ()
