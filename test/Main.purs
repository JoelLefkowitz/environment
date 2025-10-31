module Test.Main where

import Prelude

import Effect (Effect)
import Test.Spec (describe, it)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)

main ∷ Effect Unit
main = runSpecAndExitProcess [ consoleReporter ] do
  describe "nothing" do
    it "does nothing" do
      pure unit
