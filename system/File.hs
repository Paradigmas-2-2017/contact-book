module File where

import Prelude hiding (catch)
import System.Directory
import Control.Exception
import System.IO.Error hiding (catch)

removeIfExists :: FilePath -> IO ()
removeIfExists fileName = removeFile fileName `catch` handleExists
  where handleExists e
          | isDoesNotExistError e = return ()
          | otherwise = throwIO e
