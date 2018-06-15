{-|
Module      : Stringhelpers
Description : Module handling all string pure functions needed in project.

Helper, utility modelu. Handling all string pure functions needed in project. It is used to make things more clear in main modules.
-}

module Stringhelpers  where

import Data.Char
import Data.List
import Data.Maybe

-- | Function to replace found sublist with new list in list.
replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace needle replacement haystack
  = case begins haystack needle of
      Just remains -> replacement ++ remains
      Nothing      -> case haystack of
                        []     -> []
                        x : xs -> x : replace needle replacement xs

-- | Helper function for replace.
begins :: Eq a => [a] -> [a] -> Maybe [a]
begins haystack []                = Just haystack
begins (x : xs) (y : ys) | x == y = begins xs ys
begins _        _                 = Nothing

-- | Function to trim string.
trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

-- | Function to find occurance of sublist in list. Returns index if found, or -1 if not found.
findSubstring :: Eq a => [a] -> [a] -> Int
findSubstring pat str = case findIndex (isPrefixOf pat) (tails str) of
                            Just n  -> n
                            Nothing -> (-1)

-- | Function to remove one line comment from string. Everything after // to end of the line is removed.
removeLineComment :: String -> String
removeLineComment line 
        | isInfixOf "//" line = take n line
        | otherwise = line
        where n = findSubstring "//" line

-- | Function to check if string contains "/*" or "*/".
containsStartOrEndOfCommBlock :: String -> Bool
containsStartOrEndOfCommBlock line
        | isInfixOf "/*" line && not (isInfixOf "*/" line) = True
        | isInfixOf "*/" line && not (isInfixOf "/*" line) = True
        | otherwise = False

-- | Function to check if string contains "/*" and "*/".
containsStartAndEndOfCommBlock :: String -> Bool
containsStartAndEndOfCommBlock line
        | isInfixOf "/*" line && isInfixOf "*/" line = True
        | otherwise = False

-- | Function to remove appropriate part of block comment in string
removeBlockCommentNotTrimmed :: String -> String
removeBlockCommentNotTrimmed line
        | isInfixOf "/*" line && isInfixOf "*/" line = (take nl line) ++ (reverse . take nr . reverse $ line)
        | isInfixOf "/*" line = take nl line
        | isInfixOf "*/" line = reverse . take nr . reverse $ line
        | otherwise = line
        where trimmed = trim line
              nl = findSubstring "/*" line
              nr = length line - findSubstring "*/" line - 2

-- | Same as removeBlockCommentNotTrimmed but additinally handles trimming of the string.
removeBlockComment :: String -> String
removeBlockComment line = 
        let nottrimmed = removeBlockCommentNotTrimmed line
        in case () of
          _ | trimmed == "" -> ""
            | otherwise -> nottrimmed
            where trimmed = trim nottrimmed

-- | Similar as removeBlockComment but handles only case when block comment is in one line.
removeInLineBlockComment :: String -> String
removeInLineBlockComment line 
        | containsStartAndEndOfCommBlock line = removeBlockComment line
        | otherwise = line

-- | Function to transfer while loop into for loop.
forifyWhile :: String -> String
forifyWhile line
        | isInfixOf "while" line = replace "while(" "for(;;" line
        | otherwise = line

-- | Function to check if string contains {.
containsOpenCurlyBracket :: String -> Bool
containsOpenCurlyBracket line 
        | isInfixOf "{" line = True
        | otherwise = False 

-- | Function to add { before the line.
wrapWithOpenCurlyBracket :: String -> String
wrapWithOpenCurlyBracket line = "{\n" ++ line

-- | Function to add } after the line.
wrapWithClosingCurlyBracket :: String -> String
wrapWithClosingCurlyBracket line = line ++ "}\n"

-- | Check if line contains possible start of not opened one liner block.
containsPossibleOneLiner :: String -> Bool
containsPossibleOneLiner line 
        | (isInfixOf "for(" line && not (isInfixOf "{" line)) = True
        | (isInfixOf "for (" line && not (isInfixOf "{" line)) = True
        | (isInfixOf "if(" line && not (isInfixOf "{" line)) = True
        | (isInfixOf "if (" line && not (isInfixOf "{" line)) = True
        | (isInfixOf "else(" line && not (isInfixOf "{" line)) = True
        | (isInfixOf "else (" line && not (isInfixOf "{" line)) = True
        | otherwise = False

-- | Function to split block statring in the same line into two lines. If not found then nothing happens.
splitPossibleBlockInOneLine :: String -> String
splitPossibleBlockInOneLine line 
        | (isInfixOf "for(" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | (isInfixOf "for (" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | (isInfixOf "if(" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | (isInfixOf "if (" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | (isInfixOf "else(" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | (isInfixOf "else (" line && isInfixOf "{" line) = replace "{" "\n{" line 
        | otherwise = line
