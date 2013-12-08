module Main where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLFW as GLFW hiding (swapBuffers)
import Graphics.UI.GLUT
import Data.IORef
import Control.Monad
import System.Environment (getArgs, getProgName)

initResources = return undefined

-- | this block makes animation possible
update r = do
  postRedisplay Nothing

display :: IO ()
display = do
  clearColor $= Color4 1 0 0 1 
  clear [ColorBuffer]
  swapBuffers

main = do 
  initialDisplayMode $= [DoubleBuffered]
  (progname,_) <- getArgsAndInitialize
  initialWindowSize $= Size 400 300
  createWindow "Hello World"
  r <- initResources >>= newIORef
  displayCallback $= display
  idleCallback $= Just (update r)
  mainLoop
