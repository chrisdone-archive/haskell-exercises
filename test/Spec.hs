{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE BangPatterns #-}
import           Control.Exception
import           Lib
import           Data.Maybe
import qualified Impl
import Test.Hspec.Core.Spec
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
    (do it'
          "Head of a list"
          Impl.listToMaybe
          (property
             (\xs -> Impl.listToMaybe xs == listToMaybe (xs :: [Integer])))
        it'
          "Sum a list"
          Impl.sum
          (property (\xs -> Impl.sum xs == sum (xs :: [Integer])))
        it'
          "Reverse a list"
          Impl.sum
          (property (\xs -> Impl.reverse xs == reverse (xs :: [Integer]))))

it' :: (Example a1, Arg a1 ~ ()) => String -> a2 -> a1 -> SpecM () ()
it' title f inner = do
  result <- runIO (try (evaluate f))
  case result of
    Left (_ :: Incomplete) -> it title (pendingWith "incomplete")
    Right _ -> it title inner
