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