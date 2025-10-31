module Test.Main where

import Prelude

import Data.Either (blush)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (message, try)
import Effect.Class (liftEffect)
import Node.Process (setEnv, unsetEnv)
import Node.Process.Environment (Environment(..), lookup, require)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)

main ∷ Effect Unit
main = runSpecAndExitProcess [ consoleReporter ] do
  describe "require" do
    it "looks up an environment variable" do
      liftEffect $ setEnv "NODE_ENV" "production"
      env ← require "NODE_ENV"
      env `shouldEqual` "production"

    it "throws an error if the environment variable is missing" do
      liftEffect $ unsetEnv "NODE_ENV"
      error ← try $ require "NODE_ENV"
      (message <$> blush error) `shouldEqual`
        Just "Missing environment variable: NODE_ENV"

  describe "lookup" do
    it "parses the NODE_ENV environment variable" do
      liftEffect $ setEnv "NODE_ENV" "production"
      env ← lookup
      env `shouldEqual` Production

    it "defaults to Development" do
      liftEffect $ setEnv "NODE_ENV" "..."
      env ← lookup
      env `shouldEqual` Development
