module Test.Fixtures.Environment where

import Prelude

import Effect.Class (class MonadEffect, liftEffect)
import Node.Process (setEnv, unsetEnv)

set ∷ ∀ m. MonadEffect m ⇒ String → String → m Unit
set name = liftEffect <<< setEnv name

unset ∷ ∀ m. MonadEffect m ⇒ String → m Unit
unset = liftEffect <<< unsetEnv
