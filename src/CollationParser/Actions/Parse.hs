{-# LANGUAGE OverloadedStrings #-}


module CollationParser.Actions.Parse where


import           Control.Error
import qualified Data.Text as T
import qualified Data.Text.IO as TIO


parseAction :: FilePath -> FilePath -> Script ()
parseAction input output = scriptIO $ do
    contents <- TIO.readFile input
    TIO.writeFile output $ T.pack $ show $ length $ T.lines contents
