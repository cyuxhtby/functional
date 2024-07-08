import Control.Monad (Monad, (>>=), return)

-- Defining our `Optional` monad that allows for handling empty data
-- `a` is of type `Optional`, it is either passed into the `Some` constructor, or there is no data at all
data Optional a = Some a | None
    deriving (Show)

-- `Functor` is a type class that allows you to map a function over a wrapped value. 
instance Functor Optional where
    -- The function `fmap` applies the function `f` to the value inside the `Optional`
    -- `f x` applies `f` to `x`, and `Some (f x)` wraps the result back in the `Some` constructor
    fmap f (Some x) = Some (f x)
    fmap _ None = None -- If the value is `None`, `fmap` returns `None`

-- `Applicative` is a type class that allows for function application within a context
-- Applicative provides the following:
    -- The `pure` method, which takes a value and wraps it in a functor
    -- The `<*>` operator, which takes a functor containing a function and a functor containing a value, and applies the function to the value.
instance Applicative Optional where
    pure = Some -- Wraps a value in `Some`
    (Some f) <*> (Some x) = Some (f x) -- Applies a function `f` wrapped in `Some` to a value `x` wrapped in `Some`
    _ <*> _ = None -- If either the function or the value is `None`, the result is `None`

-- We can now define `Optional` as an instance of `Monad`
-- `Monad` is a type class that allows for chaining operations on wrapped values
instance Monad Optional where   
    (Some x) >>= f = f x
    None >>= _ = None
    return = Some

-- Lets now use the `Optional` monad to handle nullable strings
-- The funciton takes in a `Maybe String` type and converts it to an `Optional String`
handleNull :: Maybe String -> Optional String
handleNull (Just x) = Some x -- `Just` is a constructor for the `Maybe` type, used to wrap the value `x`. This converts it to `Some`.
handleNull Nothing = None --`Nothing` is a constructor for the `Maybe` type, representing the absence of a value. This converts it to `None`.


main :: IO ()
main = do
    let name1 = Just "Alice"
    let name2 = Nothing
    
    let result1 = handleNull name1
    let result2 = handleNull name2
    
    putStrLn $ "Result 1: " ++ show result1
    putStrLn $ "Result 2: " ++ show result2 
    
    
-- Output:
-- Result 1: Some "Alice"
-- Result 2: None
