module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import NumeralsConversion as NumeralsConversion

westernizeNumerals :: String -> String
westernizeNumerals = NumeralsConversion.westernizeNumerals


main :: Effect Unit
main = do
  log "Welcome to numerals conversion app"
