{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}


module CollationParser.Parser where


import Control.Applicative
import Text.Trifecta
import Text.Trifecta.Delta
import qualified Data.ByteString.Char8 as B
-- import Text.Parser.Token
import Prelude hiding (sequence)

import CollationParser.Types

{-
 - data Maybe a = Just a
 -              | Nothing
 -
 - class Functor f where
 -     fmap :: (a -> b) -> f a -> f b
 -
 - instance Functor Maybe where
 -     fmap f (Just a) = Just (f a)
 -     fmap _ Nothing  = Nothing
 -
 - fmap show (Just 4) => Just "4"
 - fmap show Nothing  => Nothing
 -
 - class Functor f => Applicative f where
 -     pure :: x -> f x
 -     (<*>) :: f (a -> b) -> f a -> f b
 -
 - instance Applicative Maybe where
 -     pure x = Just x
 -
 -     (Just f) <*> (Just x) = Just (f x)
 -     Nothing <*> _ = Nothing
 -     _ <*> Nothing = Nothing
 -}


parseCollation :: B.ByteString -> String
               -> Either String CollationParagraph
parseCollation name input =
    result $ parseString paragraph d input
    where
        d = Directed name 0 0 0 0

        result :: Result a -> Either String a
        result (Success a) = Right a
        result (Failure e) = Left  (show e)

paragraph :: Parser CollationParagraph
paragraph = do
    f    <- format
    seqs <- sequences
    pure $ CP f seqs

sequences :: Parser [Sequence]
sequences = commaSep1 sequence

-- signatures: [A]^2^ B--C^4^ D^2^
signatures :: Parser [Signature]
signatures = sepBy1 signature space

signature :: Parser Signature
signature = do
    (isBracket, letter) <- bracketed letter
    undefined

bracketed :: Parser a -> Parser (Bool, a)
bracketed p =   (char '[' *> (fmap (True,) p) <* char ']')
            <|> fmap (False,) p

-- signing statement: [\$1--2 (-D2) signed];
-- leaf count: 12 leaves,
-- pagination: pp. [1--2]

sequence :: Parser Sequence
sequence = undefined

format :: Parser Format
format = formatNumber <* string "^o^:" <* spaces1

spaces1 :: Parser ()
spaces1 = space *> spaces

formatNumber :: Parser Format
formatNumber = (char '8' *> pure Octavo) <|> (char '4' *> pure Quarto)
