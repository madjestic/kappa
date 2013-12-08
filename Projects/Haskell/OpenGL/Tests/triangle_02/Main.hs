module Main where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Foreign.Storable (sizeOf)
import Control.Concurrent (threadDelay)
import Control.Applicative
import Graphics.GLUtil
import System.Exit (exitWith, ExitCode(ExitSuccess))
import Data.IORef (IORef, newIORef, readIORef, modifyIORef)

data Shaders = Shaders {  vertexShader   :: Shader
                        , fragmentShader :: Shader
                        , program'       :: Program
                        , positionA      :: AttribLocation }

data Resources = Resources {  vertexBuffer  :: BufferObject
                            , elementBuffer :: BufferObject
                            , shaders       :: Shaders
                            , fadeFactor    :: GLfloat }

vertexBufferData :: [GLfloat]
vertexBufferData = [-1.0, -1.0, 
                     1.0, -1.0, 
                     0.0, 1.0]

elementBufferData :: [GLuint]
elementBufferData = [0..3]

initShaders = do 

                 vs <- loadShader "shaders/hello-gl.vert"
                 fs <- loadShader "shaders/hello-gl.frag"
-- |  program = glCreateProgram();
-- |  glAttachShader(program, vs);
-- |  glAttachShader(program, fs);
-- |  glLinkProgram(program);
                 p  <- linkShaderProgram [vs, fs]
                 Shaders vs fs p
                   <$> get (attribLocation p "position")

makeResources :: IO Resources
makeResources =  Resources
              <$> makeBuffer ArrayBuffer vertexBufferData
              <*> makeBuffer ElementArrayBuffer elementBufferData
              <*> initShaders
              <*> pure 0.0


setupGeometry :: Resources -> IO ()
setupGeometry r = let posn = positionA (shaders r)
                      stride = fromIntegral $ sizeOf (undefined::GLfloat) * 2
                      vad = VertexArrayDescriptor 2 Float stride offset0
                  in do bindBuffer ArrayBuffer   $= Just (vertexBuffer r)
                        vertexAttribPointer posn $= (ToFloat, vad)
                        vertexAttribArray posn   $= Enabled

draw :: IORef Resources -> IO ()
draw r' = do clearColor $= Color4 1 1 1 1
             clear [ColorBuffer]
             --r <- readIORef r'
             -- currentProgram $= Just (program' (shaders r))
             -- setupGeometry r
             -- bindBuffer ElementArrayBuffer $= Just (elementBuffer r)
             -- drawElements TriangleStrip 4 UnsignedInt offset0
             swapBuffers

basicKMHandler :: Key -> KeyState -> Modifiers -> Position -> IO ()
basicKMHandler (Char '\27') Down _ _ = exitWith ExitSuccess
basicKMHandler _            _    _ _ = return ()

main = do initialDisplayMode $= [DoubleBuffered]
          initialWindowSize $= Size 500 500
          (progname,_) <- getArgsAndInitialize
          createWindow "GLSL Triangle"
          r <- makeResources >>= newIORef
          displayCallback $= draw r
          idleCallback $= Nothing
          keyboardMouseCallback $= Just basicKMHandler
          mainLoop
