module Lib where

import System.IO

processFile :: String -> IO()
processFile filepath = do
    { 
    --putStrLn filepath;
    --putStrLn (replace ".c" "-final.c" filepath);

    input <- openFile filepath ReadMode;
    output <- openFile (replace ".c" "-final.c" filepath) WriteMode;
    
    contents <- hGetContents input;
    print contents;

    hClose input;
}

replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace needle replacement haystack
  = case begins haystack needle of
      Just remains -> replacement ++ remains
      Nothing      -> case haystack of
                        []     -> []
                        x : xs -> x : replace needle replacement xs

begins :: Eq a => [a] -> [a] -> Maybe [a]
begins haystack []                = Just haystack
begins (x : xs) (y : ys) | x == y = begins xs ys
begins _        _                 = Nothing