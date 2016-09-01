{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Actions where


import           Control.Error

import           CollationParser.Actions.Parse

import           Types


action :: Actions -> Script ()

action Parse{..} = parseAction defaultInput defaultOutput
