import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Test" $ do
    it "should test" $ do
      let actual :: String = "x"
      actual `shouldBe` "x"
