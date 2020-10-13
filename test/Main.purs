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
    it "Devanagari ०१२३४५६७८९" (westernizeNumerals "०१२३४५६७८९" `shouldEqual` "0123456789")
    it "Bengali ০১২৩৪৫৬৭৮৯" (westernizeNumerals "০১২৩৪৫৬৭৮৯" `shouldEqual` "0123456789")
    it "Gurmukhi ੦੧੨੩੪੫੬੭੮੯" (westernizeNumerals "੦੧੨੩੪੫੬੭੮੯" `shouldEqual` "0123456789")
    it "Gujurati ૦૧૨૩૪૫૬૭૮૯" (westernizeNumerals "૦૧૨૩૪૫૬૭૮૯" `shouldEqual` "0123456789")
    it "Oriya ୦୧୨୩୪୫୬୭୮୯" (westernizeNumerals "୦୧୨୩୪୫୬୭୮୯" `shouldEqual` "0123456789")
    it "Tamil ௦௧௨௩௪௫௬௭௮௯" (westernizeNumerals "௦௧௨௩௪௫௬௭௮௯" `shouldEqual` "0123456789")
    it "Telugu ౦౧౨౩౪౫౬౭౮౯" (westernizeNumerals "౦౧౨౩౪౫౬౭౮౯" `shouldEqual` "0123456789")
    it "Kannada ೦೧೨೩೪೫೬೭೮೯" (westernizeNumerals "೦೧೨೩೪೫೬೭೮೯" `shouldEqual` "0123456789")
    it "Malayalam ൦൧൨൩൪൫൬൭൮൯" (westernizeNumerals "൦൧൨൩൪൫൬൭൮൯" `shouldEqual` "0123456789")
    it "Sinhala ෦෧෨෩෪෫෬෭෮෯" (westernizeNumerals "෦෧෨෩෪෫෬෭෮෯" `shouldEqual` "0123456789")
    it "Thai ๐๑๒๓๔๕๖๗๘๙" (westernizeNumerals "๐๑๒๓๔๕๖๗๘๙" `shouldEqual` "0123456789")
    it "Lao ໐໑໒໓໔໕໖໗໘໙" (westernizeNumerals "໐໑໒໓໔໕໖໗໘໙" `shouldEqual` "0123456789")
    it "Myanmar ႐႑႒႓႔႕႖႗႘႙ " (westernizeNumerals "႐႑႒႓႔႕႖႗႘႙" `shouldEqual` "0123456789")
    it "Ethiopic numerals should not be supported ፩፪፫፬፭፮፯፰፱" (westernizeNumerals "፩፪፫፬፭፮፯፰፱" `shouldEqual` "፩፪፫፬፭፮፯፰፱")
