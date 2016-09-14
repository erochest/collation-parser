{-# LANGUAGE OverloadedStrings #-}


module Main where


import           Control.Error

import           Actions
import           Opts


main :: IO ()
main = do
    opt <- parseOpts
    runScript (action opt)
