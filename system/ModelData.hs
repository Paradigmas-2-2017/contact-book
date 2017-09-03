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

--insert :: Ord a => a -> ArvBin a -> ArvBin a
--insert x Null = (Node x Null Null)
--insert x (Node y left right)
--    | x == y = Node y left right
--    | x < y = Node y (insert x left) right
--    | otherwise = Node y left (insert x right)

insertPersonTree :: Person -> ArvBin Person -> ArvBin Person
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

--searchPerson :: (Ord a) => (Tree a) -> a ->
searchPerson _ Null = Nobody
searchPerson x (Node y left right)
    | x == firstName y = y
    | x < firstName y = searchPerson x left
    | x > firstName y = searchPerson x right

getPersonNode Null = Nobody
getPersonNode (Node y left right) = y

removePerson x (Node y left right) = do
    let person = searchPerson x (Node y left right)    
    let list = emOrdem (Node y left right)
    let new_list = removeItem person list
    let main_tree = insertPersonFromList new_list Null
    return main_tree

--insertPersonFromList :: [Person] -> ArvBin Person -> ArvBin Person
insertPersonFromList [] x = return x
insertPersonFromList (x:xs) y = do
    let main_tree = insertPersonTree x y
    insertPersonFromList xs main_tree

removeItem _ [] = []
removeItem x (y:ys)
    | firstName x == firstName y = removeItem x ys
    | otherwise = y : removeItem x ys
