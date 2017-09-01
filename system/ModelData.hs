module ModelData where

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: String,
    phoneNumber :: String
} deriving (Show) 

data ArvBin element = Null
    | Node element (ArvBin element) (ArvBin element) deriving (Show)

--insert :: Ord a => a -> ArvBin a -> ArvBin a
--insert x Null = (Node x Null Null)
--insert x (Node y left right)
--    | x == y = Node y left right
--    | x < y = Node y (insert x left) right
--    | otherwise = Node y left (insert x right)

insertPersonTree x Null = (Node x Null Null)
insertPersonTree x (Node y left right)
    | firstName x == firstName y = (Node y left right)
    | firstName x < firstName y = (Node y (insertPersonTree x left) right)
    | otherwise = (Node y left (insertPersonTree x right))

emOrdem Null = []
emOrdem (Node x left right) = (emOrdem left) ++ [x] ++ (emOrdem right)

showPerson [] = return ()
showPerson (x:xs) = do
    clearScreen
    putStrLn "|======================| Contato |======================|"
    putStrLn ("Nome: " ++ (firstName x))
    putStrLn ("Sobrenome: " ++ (lastName x))
    putStrLn ("Idade: " ++ (age x))
    putStrLn ("Telefone: " ++ (phoneNumber x))
    putStrLn ""
    putStrLn "Pressione qualquer tecla para continuar."
    getChar >>= putChar
    showPerson xs
