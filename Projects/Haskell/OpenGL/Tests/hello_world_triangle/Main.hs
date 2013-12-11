import Graphics.Rendering.OpenGL as GL hiding (vertexAttrib)
import Graphics.Rendering.OpenGL.Raw.Core31 as GLRW
import Graphics.UI.GLFW as GLFW
import Control.Monad
import Data.IORef
import Foreign.Storable
import Foreign.Marshal.Alloc
import Foreign.Ptr
import Foreign.Marshal.Array
import Foreign.Marshal.Utils


data GLIds = GLIds { progId :: !GLuint, vertexArrayId :: !GLuint
                   , vertexBufferId :: !GLuint, colorBufferId :: !GLuint
                   , mvpMatrixUniform :: !GLint
                   , vertexAttrib :: !GLuint, colorAttrib :: !GLuint}

vertexBufferData :: [GLfloat]
vertexBufferData =  [ 0.0,  0.8, 
                     -0.8, -0.8, 
                      0.8, -0.8]

                    
-- initResources = undefined


resizeWindow :: Size -> IO ()
resizeWindow =
  \ size@(GL.Size w h) ->
    do
      GL.viewport   $= (GL.Position 0 0, size)
      GL.matrixMode $= GL.Projection
      GL.loadIdentity
      GL.ortho2D 0 (realToFrac w) (realToFrac h) 0


withNewPtr :: Storable b => (Ptr b -> IO a) -> IO b
withNewPtr f = alloca (\p -> f p >> peek p)


bindBufferToAttrib :: GLuint -> GLuint -> IO ()
bindBufferToAttrib bufId attribLoc = do
  GLRW.glEnableVertexAttribArray attribLoc
  GLRW.glBindBuffer gl_ARRAY_BUFFER bufId
  GLRW.glVertexAttribPointer attribLoc  -- attribute location in the shader
                        2  -- 3 components per vertex
                        gl_FLOAT  -- coordinates type
                        (fromBool False)  -- normalize?
                        0  -- stride
                        nullPtr  -- vertex buffer offset


fillNewBuffer :: [GLfloat] -> IO GLuint
fillNewBuffer list = do
  bufId <- withNewPtr (GLRW.glGenBuffers 1)
  GLRW.glBindBuffer gl_ARRAY_BUFFER bufId
  withArrayLen list $ \length ptr ->
    glBufferData gl_ARRAY_BUFFER (fromIntegral (length *
                                  sizeOf (undefined :: GLfloat)))
                 (ptr :: Ptr GLfloat) gl_STATIC_DRAW
  return bufId


main :: IO ()
main = do
  GLFW.initialize
  GLFW.openWindow (GL.Size 640 480) [] GLFW.Window
  GLFW.windowTitle $= "GLFW Demo"
  GLFW.windowSizeCallback $= resizeWindow
  bufferPtr <- malloc
  GLRW.glGenBuffers 1 bufferPtr
  bufferID <- peek bufferPtr  
  GLRW.glBindBuffer gl_ARRAY_BUFFER bufferID
  --withArrayLen vertexBufferData $ \length ptr ->
   -- GLRW.glBufferData gl_ARRAY_BUFFER (fromIntegral (length *
   --                               sizeOf (undefined :: GLfloat)))
   --              (ptr :: Ptr GLfloat) gl_STATIC_DRAW
  GLRW.glBufferData gl_ARRAY_BUFFER (fromIntegral (length vertexBufferData * sizeOf (undefined :: GLfloat))) ( undefined :: Ptr GLfloat) gl_STATIC_DRAW
  GLRW.glEnableVertexAttribArray 0
  GLRW.glVertexAttribPointer 0 2 gl_FLOAT (fromBool False) 0 bufferPtr
  --vertexBufferId <- fillNewBuffer vertexBufferData
  --bindBufferToAttrib vertexBufferId (1 :: GLuint)
  
  onDisplay
  GLFW.closeWindow
  GLFW.terminate


onDisplay :: IO ()
onDisplay = do
  GL.clearColor $= Color4 1 0 0 1
  GL.clear [ColorBuffer]
  --GLFW.swapBuffers
  GLRW.glViewport 0 0 640 480
  GLRW.glDrawArrays gl_TRIANGLES 0 3
  GLFW.swapBuffers

  p <- GLFW.getKey GLFW.ESC
  unless (p == GLFW.Press) $ 
    onDisplay

