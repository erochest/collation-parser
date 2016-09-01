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
outputOpt = strOption (  short 'o' <> long "output" <> metavar "OUTPUT_FILE"
                      <> help "The file to write back to.")

inputOpt :: Parser FilePath
inputOpt = strOption (  short 'i' <> long "input" <> metavar "INPUT_FILE"
                     <> help "The input file to process.")

parseOpts' :: Parser Actions
parseOpts' = Parse <$> outputOpt <*> inputOpt

opts :: ParserInfo Actions
opts = info (helper <*> parseOpts')
            (  fullDesc
            <> progDesc "Parsing Markdown-ish files."
            <> header "collation-parser - Parsing Markdown-ish files.")

parseOpts :: IO Actions
parseOpts = execParser opts
