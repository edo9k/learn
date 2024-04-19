{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BlockArguments #-}
module Main where

import Web.Scotty 
import System.Information.CPU
import System.Information.Memory
import Data.Aeson (object, (.=), encode)
import Control.Monad.IO.Class (liftIO) 

main :: IO ()
main = scotty 3000 $ do
  -- get "/" $ do 
  --  html "Hello, World! (from Haskell)" 

    get "/system-info" $ do 
        cpuInfo <- liftIO getCpuInfo
        memInfo <- liftIO getMemInfo
        
        let jsonInfo = object
          [ "cpu" .= cpuInfo
          , "memory" .= memInfo
          ]


        -- serve json reponse
        addHeader "Content-Type" "application/json" 
        raw $ encode jsonInfo 
