module Lib where

import Stringhelpers
import System.IO

processFile :: String -> IO()
processFile filepath = do
    { 
    input <- openFile filepath ReadMode;
    output <- openFile (replace ".c" "-final.c" filepath) WriteMode;
    
    test <- processLine input output 1;
    print test;

    hClose input;
    hClose output;
}

--states:
    -- 0 - end
    -- 1 - normal
    -- 2 - inside multiline comm

processLine :: Handle -> Handle -> Int -> IO ()
processLine input output state = do {
    isEof <- hIsEOF input;
    if(isEof)
        then return ();
        else do
            {
                getline <- hGetLine input;
                let line = preprocessLine getline
                in case () of
                  _ | state == 1 && containsStartOrEndOfCommBlock line -> do {    --beginging of multiline comm
                                                                        let clearline = removeBlockComment line
                                                                        in hPutStr output clearline;
                                                                        processLine input output 2;

                                                                        processLine input output state;
                                                                    }
                    | state == 2 && not (containsStartOrEndOfCommBlock line) -> processLine input output 2   --inside multiline comm
                    | state == 2 && containsStartOrEndOfCommBlock line -> do {    --end of multiline comm
                                                                        let clearline = removeBlockComment line
                                                                        in hPutStr output clearline;
                                                                    }
                    | otherwise -> do {
                                hPutStr output line;
                                processLine input output state
                                }                                     
            }
}

preprocessLine :: String -> String
preprocessLine l
    | trimmed == "" = ""
    | containsStartAndEndOfCommBlock line = removeBlockComment line
    | otherwise = line ++ "\n"
    where
        line = removeLineComment l
        trimmed = trim line

