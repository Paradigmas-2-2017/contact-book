module Crud where

-- Haskell modules
import System.IO
import Control.Monad

-- Personal modules
import ModelData

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

-- Receives the main tree and returns an action of main tree with new person 
createPerson :: ArvBin Person -> IO (ArvBin Person)
createPerson main_tree = do
    -- Defining strings to get their size and move cursor rightly
    let nameString = "Nome do contato: "
    let lastNameString = "Sobrenome do contato: "
    let ageString = "Idade do contato: "
    let phoneNumberString = "Telefone do contato: "

    -- Printing menu
    clearScreen
    putStrLn "|======================| Cadastro de contato |======================|"
    putStrLn nameString
    putStrLn lastNameString
    putStrLn ageString
    putStr phoneNumberString

    -- Reading values and controlling cursor
    cursorUpLine 3 >> cursorForward (length nameString)
    auxFirstName <- getLine
    cursorForward (length lastNameString)
    auxLastName <- getLine
    cursorForward (length ageString)
    auxAge <- getLine
    cursorForward (length phoneNumberString)
    auxPhoneNumber <- getLine
    -- Showing new person to user
    let person = Person { firstName = auxFirstName, lastName = auxLastName, age = auxAge, phoneNumber = auxPhoneNumber }
    clearScreen
    putStrLn "|======================| Cadastro de contato |======================|"
    putStrLn ("Nome: " ++ firstName person)
    putStrLn ("Sobrenome: " ++ lastName person)
    putStrLn ("Idade: " ++ age person)
    putStrLn ("Telefone: " ++ phoneNumber person)
    putStrLn ""
    clearScreen
    putStrLn "Cadastro confirmado com sucesso!"
    putStrLn "Pressione qualquer tecla para continuar."
    getChar >>= putChar
    let new_tree = insertPersonTree person main_tree
    return new_tree

-- Calls removePerson and returns it as an action of main tree
erasePerson :: String -> ArvBin Person -> IO (ArvBin Person)
erasePerson x y = do
    let result = remove x y
    return result
-- Receives name of person to be deleted and main tree, returns new main tree without the person
removePerson :: String -> ArvBin Person -> ArvBin Person 
removePerson x Null = Null
remove x (Node y left right)
    | x == firstName y = deletePerson (Node y left right)
    | x < firstName y = (Node y (remove x left) right)
    | otherwise = (Node y left (remove x right))

-- Receives tree node of person to be deleted, returns new tree without the person 
deletePerson :: ArvBin Person -> ArvBin Person
deletePerson (Node y Null right) = right
deletePerson (Node y left Null) = left
deletePerson (Node y left right) = (Node (getLeftmost right) left (remove (firstName(getLeftmost right)) right))

-- Receives tree node and returns its leftmost node's person
getLeftmost :: ArvBin Person -> Person 
getLeftmost (Node y Null right) = y
getLeftmost (Node y left right) = getLeftmost left
        
