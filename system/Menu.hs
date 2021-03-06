module Menu (menu) where

-- Haskell modules
import System.IO
import Control.Monad

-- Personal modules
import Crud
import ModelData
import File

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

menu :: ArvBin Person -> IO ()
menu main_tree = do
    clearScreen
    putStrLn "|======================| Menu |======================|"
    putStrLn "1 - Cadastrar contato"
    putStrLn "2 - Remover contato"
    putStrLn "3 - Visualizar todos os contatos"
    putStrLn "4 - Pesquisar contato"
    putStrLn "0 - Sair"
    putStrLn ""
    putStr "Opção: "
    opcao <- getLine
    case opcao of
        "1" -> do
            main_tree <- createPerson main_tree
            removeIfExists "../database/contacts.txt"
            writeFile "../database/contacts.txt" (show main_tree)
            menu main_tree
        "2" -> do
            clearScreen
            putStr "Nome do contato a ser deletado: "
            toDelete <- getLine
            main_tree <- (erasePerson toDelete main_tree)
            --show (erasePerson toDelete main_tree)
            removeIfExists "../database/contacts.txt"
            writeFile "../database/contacts.txt" (show main_tree)
            clearScreen
            putStrLn "Contato deletado com sucesso!"
            putStrLn "Pressione qualquer tecla para continuar."
            getChar >>= putChar
            menu main_tree
        "3" -> do
            clearScreen
            putStrLn "Os contatos serão exibidos em ordem alfabética."
            putStrLn "Pressione qualquer tecla para continuar."
            getChar >>= putChar
            showPerson (emOrdem main_tree)
            menu main_tree
        "4" -> do
            clearScreen
            putStr "Buscar por: "
            query <- getLine
            let result = searchPerson query main_tree
            clearScreen
            putStrLn ("|======================| Exibindo resultados para '" ++ query ++ "' |======================|")
            putStrLn ("Nome: " ++ firstName result)
            putStrLn ("Sobrenome: " ++ lastName result)
            putStrLn ("Idade: " ++ age result)
            putStrLn ("Telefone: " ++ phoneNumber result)
            putStrLn ""
            putStrLn "Pressione qualquer tecla para continuar."
            getChar >>= putChar
            menu main_tree
        "0" -> do
            clearScreen
            putStrLn "Sistema finalizado com sucesso!"
        _ -> do
            menu main_tree
