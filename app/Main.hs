module Main where

import Lib
import System.Environment
import Control.Concurrent

main :: IO ()
main = do 
    {
    getArgs >>= mapM_ (\file -> forkIO $ processFile file);
    line <- getLine;
    putStrLn ("Good bye!");
}
