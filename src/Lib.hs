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

processLine :: Handle -> Handle -> IO ()
processLine input output = do {
    isEof <- hIsEOF input;
    if(isEof)
        then return ();
        else do
            {
                line <- hGetLine input;
                let test = preprocessLine line
                in hPutStr output test;
                
                processLine input output
                
            }
}

preprocessLine :: String -> String
preprocessLine line
    | trimline == "" = line
    | otherwise = line ++ "\n"
    where
        trimline = trim line
