module Lib (incomplete, Incomplete) where

import Control.Exception
import Data.Typeable

incomplete :: a
incomplete = throw Incomplete

data Incomplete = Incomplete
 deriving (Show, Typeable)
instance Exception Incomplete
