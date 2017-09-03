module Crud where

-- Haskell modules
import System.IO
import Control.Monad

-- Personal modules
import ModelData

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

--createPerson :: Ord a => a -> IO a
--createPerson actual_tree = do
createPerson main_tree = do
    -- Defining strings to get their size and move cursor rightly
    let nameString = "Nome do contato: "
    let lastNameString = "Sobrenome do contato: "
    let ageString = "Idade do contato: "
    let phoneNumberString = "Telefone do contato: "

    clearScreen
    putStrLn "|======================| Cadastro de contato |======================|"
    putStrLn nameString
    putStrLn lastNameString
    putStrLn ageString
    putStr phoneNumberString

    cursorUpLine 3 >> cursorForward (length nameString)
    auxFirstName <- getLine
    cursorForward (length lastNameString)
    auxLastName <- getLine
    cursorForward (length ageString)
    auxAge <- getLine
    cursorForward (length phoneNumberString)
    auxPhoneNumber <- getLine

    let person = Person { firstName = auxFirstName, lastName = auxLastName, age = auxAge, phoneNumber = auxPhoneNumber }
    clearScreen
    putStrLn "|======================| Cadastro de contato |======================|"
    putStrLn ("Nome: " ++ firstName person)
    putStrLn ("Sobrenome: " ++ lastName person)
    putStrLn ("Idade: " ++ age person)
    putStrLn ("Telefone: " ++ phoneNumber person)
    putStrLn ""
    -- Aqui o contato é salvo no arquivo e inserido na árvore
    -- let aux_tree = actual_tree
    -- let actual_tree = newPerson person aux_tree
    clearScreen
    putStrLn "Cadastro confirmado com sucesso!"
    putStrLn "Pressione qualquer tecla para continuar."
    getChar >>= putChar
    let new_tree = insertPersonTree person main_tree
    return new_tree

--removePerson :: String -> Arvbin a -> Arvbin a
removePerson x Null = Null
remove x (Node y left right)
    | x == firstName y = deletePerson (Node y left right)
    | x < firstName y = (Node y (remove x left) right)
    | otherwise = (Node y left (remove x right))

deletePerson (Node y Null right) = right
deletePerson (Node y left Null) = left
deletePerson (Node y left right) = (Node (getLeftmost right) left (remove (firstName(getLeftmost right)) right))

getLeftmost (Node y Null right) = y
getLeftmost (Node y left right) = getLeftmost left
        
