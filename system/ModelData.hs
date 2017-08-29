module ModelData where

data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: String,
    phoneNumber :: String
} deriving (Show) 

data ArvBin element = Null
    | Node element (ArvBin element) (ArvBin element) deriving (Show)

insert :: Ord a => a -> ArvBin a -> ArvBin a
insert x Null = (Node x Null Null)
insert x (Node y left right)
    | x == y = Node y left right
    | x < y = Node y (insert x left) right
    | otherwise = Node y left (insert x right)

