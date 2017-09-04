module ModelData where

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

data Person = Nobody
    | Person {
        firstName :: String,
        lastName :: String,
        age :: String,
        phoneNumber :: String
    } deriving (Show, Read) 

data ArvBin element = Null
    | Node element (ArvBin element) (ArvBin element) deriving (Show, Read)

-- Receives a tree node and return its Person
getPersonNode :: ArvBin Person -> Person
getPersonNode Null = Nobody
getPersonNode (Node y left right) = y

-- Receives new person to be inserted and the main tree, returns new main tree 
insertPersonTree :: Person -> ArvBin Person -> ArvBin Person
insertPersonTree x Null = (Node x Null Null)
insertPersonTree x (Node y left right)
    | firstName x == firstName y = (Node y left right)
    | firstName x < firstName y = (Node y (insertPersonTree x left) right)
    | otherwise = (Node y left (insertPersonTree x right))

-- Receives the main tree and returns a list of people in the tree
emOrdem :: ArvBin Person -> [Person]
emOrdem Null = []
emOrdem (Node x left right) = (emOrdem left) ++ [x] ++ (emOrdem right)

--Receives a list of people and print on the screen
showPerson :: [Person] -> IO ()
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

-- Receives a person's name and the main tree, return its instance of Person 
searchPerson :: String -> ArvBin Person -> Person
searchPerson _ Null = Nobody
searchPerson x (Node y left right)
    | x == firstName y = y
    | x < firstName y = searchPerson x left
    | x > firstName y = searchPerson x right
