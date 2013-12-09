import Graphics.Rendering.OpenGL as GL
import Graphics.UI.GLFW as GLFW
import Graphics.Rendering.OpenGL (($=))
import Data.IORef
import Control.Monad
import System.Environment (getArgs, getProgName)

data Action = Action (IO Action)

initResources =
  return undefined

resizeWindow =
  \ size@(GL.Size w h) ->
    do
      GL.viewport   $= (GL.Position 0 0, size)
      GL.matrixMode $= GL.Projection
      GL.loadIdentity
      GL.ortho2D 0 (realToFrac w) (realToFrac h) 0

main = do
  -- invoke either active or passive drawing loop depending on command line argument
  args <- getArgs
  prog <- getProgName
  main'
 
main' = do
  GLFW.initialize
  -- open window
  GLFW.openWindow (GL.Size 400 400) [GLFW.DisplayAlphaBits 8] GLFW.Window
  GLFW.windowTitle $= "GLFW Demo"
  GL.shadeModel    $= GL.Smooth
  GL.clearColor $= Color4 1 0 0 1 
  GLFW.windowSizeCallback $= resizeWindow
  r <- initResources >>= newIORef
  draw
  -- finish up
  GLFW.closeWindow
  GLFW.terminate

draw = do
  GL.clearColor $= Color4 1 0 0 1
  GL.clear [ColorBuffer]
  GLFW.swapBuffers
  p <- GLFW.getKey GLFW.ESC
  unless (p == GLFW.Press) $
    do
            -- perform action
            --Action action' <- action
            -- sleep for 1ms to yield CPU to other applications
            GLFW.sleep 0.001
 
            -- only continue when the window is not closed
            windowOpen <- getParam Opened
            unless (not windowOpen) $
              draw -- loop with next action
  

