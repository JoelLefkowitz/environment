module Node.Process.Environment where

import Prelude

import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Exception (throw)
import Node.Process (lookupEnv)

data Environment = Development | Production

derive instance eqEnvironment ∷ Eq Environment

instance showEnvironment ∷ Show Environment where
  show Production = "Production"
  show Development = "Development"

missing ∷ ∀ a. String → Effect a
missing name = throw $ "Missing environment variable: " <> name

require ∷ ∀ m. MonadEffect m ⇒ String → m String
require name = liftEffect $ maybe (missing name) pure =<< lookupEnv name

lookup ∷ ∀ m. MonadEffect m ⇒ m Environment
lookup = do
  environment ← require "NODE_ENV"
  pure case environment of
    "production" → Production
    _ → Development
