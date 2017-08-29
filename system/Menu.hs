module Menu (menu) where

-- Haskell modules
import System.IO
import Control.Monad

-- Personal modules
import Crud
import ModelData

-- Installed modules
import System.Console.ANSI -- ansi-terminal on cabal

menu :: IO()
menu = do
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
        "1" -> createPerson >> menu
        "2" -> menu
        "3" -> menu
        "4" -> menu
        "0" -> clearScreen >> putStrLn "Sistema finalizado com sucesso!"
        x -> menu
