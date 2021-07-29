{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty

import Data.Monoid (mconcat)

main = scotty 3000 $
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat [ "{ \"message\": \"woof\", \"word\": \"", beam, "\" }"]

