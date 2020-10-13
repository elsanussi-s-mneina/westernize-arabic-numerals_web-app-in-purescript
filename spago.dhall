{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "westernize-arabic-numerals"
, dependencies = [ "console", "effect", "psci-support", "spec", "strings" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
