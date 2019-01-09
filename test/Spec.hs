import           Data.Maybe
import qualified Impl
import           Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: SpecWith ()
spec = do basics

basics :: SpecWith ()
basics =
  describe
    "Basics"
    (do it
          "Head of a list"
          (property
             (\xs -> Impl.listToMaybe xs == listToMaybe (xs :: [Integer])))
        it
          "Sum a list"
          (property
             (\xs -> Impl.sum xs == sum (xs :: [Integer])))
        it
          "Reverse a list"
          (property
             (\xs -> Impl.reverse xs == reverse (xs :: [Integer]))))
