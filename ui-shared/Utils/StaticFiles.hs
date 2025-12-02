module Utils.StaticFiles (cssFiles) where

import qualified Data.Text as T

basePath :: T.Text
basePath = "static"

cssBasePath :: T.Text
cssBasePath = basePath <> "/css"

cssFiles :: [T.Text]
cssFiles =
  [ cssBasePath <> "/external/normalize.css",
    cssBasePath <> "/main.css",
    cssBasePath <> "/todoPage.css"
  ]
