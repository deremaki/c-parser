{-|
Module      : Main
Description : Main module

Main module launching the logic for each file in new thread.
-}

module Main where

import Lib
import System.Environment
import Control.Concurrent

-- | Main - is running processFile for each file from args, each in new thread.
main :: IO ()
main = do 
    {
    getArgs >>= mapM_ (\file -> forkIO $ processFile file);
    line <- getLine;
    putStr ("Good bye!");
}
