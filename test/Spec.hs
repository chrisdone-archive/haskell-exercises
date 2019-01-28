{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE BangPatterns #-}
import qualified Data.Set as Set
import           Data.Set (Set)
import           Data.List
import qualified Data.Map.Strict as M
import           Data.Map.Strict (Map)
import           Control.Exception
import           Lib
import           Data.Maybe
import qualified Impl
import           Test.Hspec.Core.Spec
import           Test.Hspec
import           Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: SpecWith ()
spec = do basics

basics :: SpecWith ()
basics =
  describe
    "Basics"
    (do describe "Lists" lists
        describe "Maps" maps
        describe "Sets" sets)

sets :: SpecM () ()
sets = do
  it'
    "From list"
    (Impl.setFromList :: [Int] -> Set Int)
    (property (\xs -> Impl.setFromList xs == Set.fromList (xs :: [Int])))
  it'
    "Unique function"
    (Impl.unique :: [Int] -> [Int])
    (property (\xs -> Impl.unique xs == Set.toList (Set.fromList (xs :: [Int]))))

maps :: SpecM () ()
maps = do
  it'
    "From list"
    (Impl.mapFromList :: [(Int, v)] -> Map Int v)
    (property (\xs -> Impl.mapFromList xs == M.fromList (xs :: [(Int, Int)])))
  it'
    "Histogram"
    (Impl.histogram :: [Int] -> Map Int Int)
    (property
       (\xs ->
          Impl.histogram xs ==
          foldl' (\m i -> M.insertWith (+) i 1 m) mempty (xs :: [Int])))

lists :: SpecM () ()
lists = do
  it'
    "Head of a list"
    Impl.listToMaybe
    (property (\xs -> Impl.listToMaybe xs == listToMaybe (xs :: [Integer])))
  it'
    "Sum a list"
    Impl.sum
    (property (\xs -> Impl.sum xs == sum (xs :: [Integer])))
  it'
    "Reverse a list"
    Impl.sum
    (property (\xs -> Impl.reverse xs == reverse (xs :: [Integer])))
  it'
    "Right-fold: sum"
    Impl.foldr
    (property (\xs -> Impl.foldr (+) 0 xs == foldr (+) 0 (xs :: [Integer])))
  it'
    "Right-fold: recons"
    Impl.foldr
    (property (\xs -> Impl.foldr (:) [] xs == foldr (:) [] (xs :: [Integer])))
  it'
    "Left-fold: reverse"
    Impl.foldl
    (property (\xs -> Impl.foldl (flip (:)) [] xs == foldl (flip (:)) [] (xs :: [Integer])))
  it' "addMaybes"
      Impl.addMaybes
      (property (\x y -> Impl.addMaybes x y == ((+) <$> x <*> y)))

it' :: (Example a1, Arg a1 ~ ()) => String -> a2 -> a1 -> SpecM () ()
it' title f inner = do
  result <- runIO (try (evaluate f))
  case result of
    Left (_ :: Incomplete) -> it title (pendingWith "incomplete")
    Right _ -> it title inner
