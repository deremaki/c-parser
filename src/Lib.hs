module Lib where

import Stringhelpers
import System.IO

processFile :: String -> IO()
processFile filepath = do
    { 
    input <- openFile filepath ReadMode;
    output <- openFile (replace ".c" "-final.c" filepath) WriteMode;
    
    --contents <- hGetContents input;
    --print contents;

    test <- processLine input output;
    print test;

    hClose input;
    hClose output;
}

processLine :: Handle -> Handle -> IO String
processLine input output = do {
    isEof <- hIsEOF input;
    if(isEof)
        then return "done";
        else do
            {
                line <- hGetLine input;
                print "Line copied";
                hPutStrLn output line;
                processLine input output
            }
}

preprocessLine :: String -> String
preprocessLine line = line