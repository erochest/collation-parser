{-# LANGUAGE LambdaCase #-}


module Opts
    ( Actions(..)
    , opts
    , execParser
    , parseOpts
    ) where


import           Options.Applicative

import           Types


outputOpt :: Parser FilePath
outputOpt = strOption (mconcat [ short 'o'
                               , long "output"
                               , metavar "OUTPUT_FILE"
                               , help "The file to write back to."
                               ])

inputOpt :: Parser FilePath
inputOpt = strOption (mconcat [ short 'i'
                              , long "input"
                              , metavar "INPUT_FILE"
                              , help "The input file to process."
                              ])

parseOpts' :: Parser Actions
parseOpts' = liftA2 Parse outputOpt inputOpt

opts :: ParserInfo Actions
opts = info (liftA2 ($) helper parseOpts')
            (mconcat [ fullDesc
                     , progDesc "Parsing Markdown-ish files."
                     , header "collation-parser - Parsing Markdown-ish files."
                     ])

parseOpts :: IO Actions
parseOpts = execParser opts
