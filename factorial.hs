factorial :: Integer -> Integer
factorial n
    | n < 0 = error "Only non-negative integers"
    | n == 0 = 1
    | otherwise = n * factorial (n - 1)

main :: IO ()
main = do
    print $ factorial 10  -- returns 3628800
    print $ factorial (-5)  -- throws error