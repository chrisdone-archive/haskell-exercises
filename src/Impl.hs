module Impl where

import Lib

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
