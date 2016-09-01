module Types where


data Actions
        = Parse { defaultOutput :: !FilePath
                , defaultInput  :: !FilePath
                }
        deriving (Show, Eq)
