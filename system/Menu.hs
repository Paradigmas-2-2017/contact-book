module Menu (menu) where

-- Haskell modules
import System.IO
import Control.Monad

-- Personal modules
import Crud
import ModelData

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

--menu :: IO()
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
    if opcao == "1"
        then do
            main_tree <- createPerson main_tree
            menu main_tree
        else if opcao == "3"
            then do
                clearScreen
                putStrLn "Os contatos serão exibidos em ordem alfabética."
                putStrLn "Pressione qualquer tecla para continuar."
                getChar >>= putChar
                showPerson (emOrdem main_tree)
                menu main_tree
            else if opcao == "4"
                then do
                    clearScreen
                    putStrLn "Buscar por: "
                    query <- getLine
                    let result = searchPerson query main_tree
                    print (firstName result ++ " " ++ lastName result)
                    getChar >>= putChar
                    menu main_tree
                else if opcao == "0"
                    then do
                        clearScreen
                        putStrLn "Sistema finalizado com sucesso!"
                     else menu main_tree
