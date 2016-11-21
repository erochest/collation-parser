{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}


module CollationParser.Types where


import           Data.Data
import qualified Data.Text    as T
import           GHC.Generics hiding (to)


data Format
    = Quarto
    | Octavo
    deriving (Show, Eq, Data, Typeable, Generic)

data CollationParagraph
    = CP
    { cpFormat    :: !Format
    , cpSequences :: ![Sequence]
    } deriving (Show, Eq, Data, Typeable, Generic)

data SeqNo
    = SeqNo !Int
    | Pi
    | Chi
    deriving (Show, Eq, Data, Typeable, Generic)

data Sequence
    = Sequence !SeqNo [Gathering]
    deriving (Show, Eq, Data, Typeable, Generic)

data Gathering
    = Gathering
    { gatheringSignings :: !Signature
    , gatheringLeaves   :: !Leaves
    } deriving (Show, Eq, Data, Typeable, Generic)

newtype Leaves
    = Leaves { unLeaves :: [Leaf] }
    deriving (Show, Eq, Data, Typeable, Generic)

data Leaf
    = Leaf !Page !Page
    deriving (Show, Eq, Data, Typeable, Generic)

data Case = Upper | Lower
    deriving (Show, Eq, Data, Typeable, Generic)

data NumStyle
    = Arabic
    | Roman !Case
    deriving (Show, Eq, Data, Typeable, Generic)

data Page
    = PageNumbered !NumStyle !Int
    | PageInferred !NumStyle !Int
    | PageSymbol !T.Text
    | PageUninferred
    deriving (Show, Eq, Data, Typeable, Generic)

data Signature
    = SigLettered !Bool !Case !Int !Char
    | SigNumbered !Bool !NumStyle !Int
    | SigSymbol   !Bool !T.Text
    deriving (Show, Eq, Data, Typeable, Generic)
