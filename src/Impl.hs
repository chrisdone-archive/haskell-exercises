module Impl where

import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import           Data.Vector (Vector)
import qualified Data.Vector as V
import           Lib
import           Prelude hiding (sum, reverse, foldr, foldl)

-- Remember that [a] is syntactic sugar for List a.
-- data [a] = [] | a : [a]
-- which is like
-- data List a = Nil | Cons a (List a)

listToMaybe :: [a] -> Maybe a
listToMaybe = incomplete

sum :: [Integer] -> Integer
sum = incomplete

reverse :: [Integer] -> [Integer]
reverse = incomplete

foldr :: (e -> acc -> acc) -> acc -> [e] -> acc
foldr = incomplete

foldl :: (acc -> e -> acc) -> acc -> [e] -> acc
foldl = incomplete

addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes = incomplete

mapFromList :: Ord k => [(k,v)] -> Map k v
mapFromList = incomplete

histogram :: Ord k => [k] -> Map k Int
histogram = incomplete
