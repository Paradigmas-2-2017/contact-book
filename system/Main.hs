{-# LANGUAGE LambdaCase #-} -- Language extension to use a control structure with IO Bool

module Main where

-- Haskell modules
import System.IO.Unsafe
import System.Directory

-- Personal modules
import Menu
import ModelData

main = do
    doesFileExist "../database/contacts.txt" >>= \case -- Must use LambdaCase because doesFileExist return IO Bool
        True -> do
            -- Using unsafePerformIO to readFile into a string and not into IO String.
            -- In this line below, the file is readed and his content
            -- is parsed from a String to an ArvBin Person.
            let main_tree = read (unsafePerformIO . readFile $ "../database/contacts.txt") :: ArvBin Person
            menu main_tree
        False -> do
            let main_tree = Null
            menu main_tree
