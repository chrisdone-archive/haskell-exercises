# Setup

* Run `stack test --file-watch`
* Then implement the functions in `src/Impl.hs`
* Save your file to see whether your function is correct.

# Workflow

The output looks like:

    Basics
      Head of a list
        # PENDING: incomplete
      Sum a list
        # PENDING: incomplete
      Reverse a list
        # PENDING: incomplete

    Finished in 0.0001 seconds
    3 examples, 0 failures, 3 pending

There are 3 tests. 0 failures, but 3 are pending implementation. So
you should implement the pending ones. The `src/Impl.hs` file looks
like:

``` haskell
module Impl where

import Lib

listToMaybe :: [a] -> Maybe a
listToMaybe = incomplete

sum :: [Integer] -> Integer
sum = incomplete

reverse :: [Integer] -> [Integer]
reverse = incomplete
```

If you implement `listToMaybe` as `listToMaybe _ = Nothing`, then you
get:

    Basics
      Head of a list FAILED [1]
      Sum a list
        # PENDING: incomplete
      Reverse a list
        # PENDING: incomplete

    Failures:

      test/Spec.hs:42:16:
      1) Basics Head of a list
           Falsifiable (after 3 tests and 2 shrinks):
             [0]

      To rerun use: --match "/Basics/Head of a list/"

    Randomized with seed 1538165626

    Finished in 0.0003 seconds
    3 examples, 1 failure, 2 pending

There is 1 failure. The test suite tells you what input failed:

      1) Basics Head of a list
           Falsifiable (after 3 tests and 2 shrinks):
             [0]

So that helps you to go back to your code and consider the case `[0]`.
