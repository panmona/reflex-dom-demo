module Counter (getInitialValue, getNewCount) where

-- Imagine that this fun does something more complex or asynchronous
getInitialValue :: () -> Int
getInitialValue () = 0

-- Imagine that this fun does something more complex
getNewCount :: Int -> Int -> Int
getNewCount val previousCount = previousCount + val
