module Main where

import System.Exit
import System.Environment
import Text.Read
import System.IO
import Control.Exception

help :: IO ()
help = putStrLn "USAGE: ./imageCompressor n [a] [--check|--unique|--clean]\n\n\t--check\tcheck if a sequence is a de Bruijin sequence\n\t--unique\tcheck if 2 sequences are distinct\n\t--clean\tlist cleaning\n\tn\torder of the sequence\n\ta\talphabet [def: \"01\"]"

check_debruj :: [String] ->IO ()
check_debruj n = do
  seq <- getLine
  if seq == ""
    then exitWith (ExitFailure 84)
    else return()

clean_debruj :: [String] ->IO ()
clean_debruj n = do
    seq <- getLine
    if seq == ""
      then exitWith (ExitFailure 84)
      else putStrLn "OK"


unique_debruj :: [String] ->IO ()
unique_debruj n = do
    seq <- getLine
    if seq == "" || seq == "END"
      then exitWith (ExitFailure 84)
      else putStrLn "OK"


process2args :: [String] -> IO ()
process2args a = do
    check_first_arg a
    let arg = a!!0 :: String
    let n = (read arg)::Int
    if n <= 0
      then exitWith (ExitFailure 84)
      else case a!!1 == "--check" of
      True -> check_debruj a
      otherwise -> case a!!1 == "--clean" of
        True -> clean_debruj a
        otherwise -> case a!!1 == "--unique" of
          True -> unique_debruj a
          otherwise -> exitWith (ExitFailure 84)

check_first_arg :: [String] -> IO ()
check_first_arg args = do
    let n = args!!0 :: String
    case isNumber n of
      False -> exitWith (ExitFailure 84)
      True -> return ()

process3args :: [String] -> IO ()
process3args a = do
  check_first_arg a
  let arg = a!!0 :: String
  let n = (read arg)::Int
  if n <= 0
    then exitWith (ExitFailure 84)
    else case a!!2 == "--check" of
      True -> check_debruj a
      otherwise -> case a!!2 == "--clean" of
        True -> clean_debruj a
        otherwise -> case a!!2 == "--unique" of
          True -> unique_debruj a
          otherwise -> exitWith (ExitFailure 84)

isNumber :: String -> Bool
isNumber str =
    case (reads str) :: [(Double, String)] of
      [(_, "")] -> True
      _         -> False


main :: IO ()
main = do
  args <- getArgs
  case (length args) of
      0 -> help
      2 -> process2args args
      3 -> process3args args
      otherwise -> exitWith (ExitFailure 84)
