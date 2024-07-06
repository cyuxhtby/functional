-- A Semigroup is a type class that is a superclass of Monoid.
-- It provides an associative function `<>` that lets you combine any two values of the same type into one.
-- More formally: A Semigroup represents a set with an associative binary operation.
import Data.Semigroup (Semigroup, (<>))

-- A Monoid is similar to a Semigroup, but it also requires an identity element. 
-- The identity element is a value which, when combined with any other value, returns the other value unchanged.
-- The identity element is represented as `mempty`
import Data.Monoid (Monoid, mempty)

data Sum = Sum Int
    deriving (Show) -- Derived from the std lib and just lets us print to console

-- Before we can make our Sum type a Monoid, we must first make it an instance of Semigroup.
-- In this case, we are defining our "associative binary operation" to be addition.
instance Semigroup Sum where
    (Sum x) <> (Sum y) = Sum(x + y)

-- Since `Sum` is of type Int, our identity element is 0. If it were an array it would be an empty list, for a Product it would be 1, etc.
instance Monoid Sum where
    mempty = Sum 0

main :: IO ()
main = do
    let a = Sum 5
    let b = Sum 10
    let c = a <> b
    let d = a <> mempty
    putStrLn $ "a <> b = " ++ show c
    putStrLn $ "a <> mempty = " ++ show d


-- Output:
-- a <> b = Sum 15
-- a <> mempty = Sum 5


