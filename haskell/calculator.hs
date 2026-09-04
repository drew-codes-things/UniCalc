import System.Environment (getArgs)
import System.Exit (exitFailure)
import Text.Read (readMaybe)

formatResult :: Double -> String
formatResult r
  | r == fromIntegral (round r :: Integer) = show (round r :: Integer)
  | otherwise = show r

main :: IO ()
main = do
  args <- getArgs
  case args of
    [aStr, op, bStr] -> case (readMaybe aStr :: Maybe Double, readMaybe bStr :: Maybe Double) of
      (Just a, Just b) -> case op of
        "+" -> putStrLn (formatResult (a + b))
        "-" -> putStrLn (formatResult (a - b))
        "*" -> putStrLn (formatResult (a * b))
        "/" -> if b == 0
                 then putStrLn "Error: division by zero" >> exitFailure
                 else putStrLn (formatResult (a / b))
        _   -> putStrLn "Error: unknown operator" >> exitFailure
      _ -> putStrLn "Error: invalid number" >> exitFailure
    _ -> putStrLn "Error: expected 3 arguments <a> <op> <b>" >> exitFailure
