module Stringhelpers  where

import Data.Char
import Data.List
import Data.Maybe

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


trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

findSubstring :: Eq a => [a] -> [a] -> Int
findSubstring pat str = case findIndex (isPrefixOf pat) (tails str) of
                            Just n  -> n
                            Nothing -> (-1)

removeLineComment :: String -> String
removeLineComment line 
        | isInfixOf "//" line = take n line
        | otherwise = line
        where n = findSubstring "//" line

containsStartOrEndOfCommBlock :: String -> Bool
containsStartOrEndOfCommBlock line
        | isInfixOf "/*" line && not (isInfixOf "*/" line) = True
        | isInfixOf "*/" line && not (isInfixOf "/*" line) = True
        | otherwise = False

containsStartAndEndOfCommBlock :: String -> Bool
containsStartAndEndOfCommBlock line
        | isInfixOf "/*" line && isInfixOf "*/" line = True
        | otherwise = False
        
removeBlockCommentNotTrimmed :: String -> String
removeBlockCommentNotTrimmed line
        | containsStartAndEndOfCommBlock line = (take nl line) ++ (reverse . take nr . reverse $ line)
        | isInfixOf "/*" line = take nl line
        | isInfixOf "*/" line = reverse . take nr . reverse $ line
        where trimmed = trim line
              nl = findSubstring "/*" line
              nr = length line - findSubstring "*/" line - 2

removeBlockComment :: String -> String
removeBlockComment line = 
        let nottrimmed = removeBlockCommentNotTrimmed line
        in case () of
          _ | trimmed == "" -> ""
            | otherwise -> nottrimmed ++ "\n"
            where trimmed = trim nottrimmed

forifyWhile :: String -> String
forifyWhile line
        | isInfixOf "while" line = replace "while(" "for(;;" line
        | otherwise = line