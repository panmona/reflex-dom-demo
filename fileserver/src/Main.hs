import Network.Wai.Application.Static
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
  _ <- putStrLn "Listening on port 8000"
  run 8000 (staticApp (defaultFileServerSettings path))
  where
    path = "serve"
