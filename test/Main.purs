module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import NumeralsConversion (westernizeNumerals)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "westernize numerals" do 
    it "empty string" (westernizeNumerals "" `shouldEqual` "")
    it "hello, no change" (westernizeNumerals "hello" `shouldEqual` "hello")
    it "0123456789 no change" (westernizeNumerals "0123456789" `shouldEqual` "0123456789")
    it "keep spaces" (westernizeNumerals " \t" `shouldEqual` " \t")
    it "Eastern Arabic ٠١٢٣٤٥٦٧٨٩" (westernizeNumerals "٠١٢٣٤٥٦٧٨٩" `shouldEqual` "0123456789")
    it "Persian ۰۱۲۳۴۵۶۷۸۹" (westernizeNumerals "۰۱۲۳۴۵۶۷۸۹" `shouldEqual` "0123456789")
    it "Hindi ०१२३४५६७८९" (westernizeNumerals "०१२३४५६७८९" `shouldEqual` "0123456789")
    it "Gujurati ૦૧૨૩૪૫૬૭૮૯" (westernizeNumerals "૦૧૨૩૪૫૬૭૮૯" `shouldEqual` "0123456789")
  