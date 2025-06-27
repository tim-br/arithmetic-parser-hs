module Main (main) where

import Data.Char (digitToInt, isDigit)

type Result = Int

factor :: [Char] -> (Result, [Char])
factor (x : xs) =
    if isDigit x
        then (digitToInt x, xs)
        else
            if x == '('
                then
                    let (y, ys) = expr xs
                     in if not (null ys) && (head ys) == ')' then (y, tail ys) else if null ys then (y, "") else (0, "ERROR: EXPECTED )")
                else (0, "ERROR EXPECTED (")

term :: [Char] -> (Result, [Char])
term input =
    let (res, rem) = factor input
     in if not (null rem) && (head rem) == '*'
            then
                let (rhs, rem2) = term (tail rem)
                 in (res * rhs, rem2)
            else (res, rem)

expr :: [Char] -> (Result, [Char])
expr input =
    let (res, rem) = term input
     in if not (null rem) && (head rem) == '+'
            then
                let (rhs, rem2) = expr (tail rem)
                 in (res + rhs, rem2)
            else (res, rem)

main :: IO ()
main = do
  let tests =
        [ ("2+3*4",         14)
        , ("6*2+1",         13)
        , ("(1+2)*3",        9)
        , ("2*(3+4)",       14)
        , ("(1+(2*3))+4",   11)
        , ("(1+2)*3+4",     13)
        , ("3*(1+2+4)",     21)
        , ("3*2*3",         18)
        ]
  mapM_ runTest tests

runTest :: (String, Int) -> IO ()
runTest (input, expected) =
  let (actual, rem) = expr input
      status = if actual == expected && null rem then "✅ PASS" else "❌ FAIL"
  in putStrLn $ status ++ " | " ++ input ++ " = " ++ show actual ++ " (expected " ++ show expected ++ ")"
