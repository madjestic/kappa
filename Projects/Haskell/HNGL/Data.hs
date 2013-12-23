module HNGL.Data where

import Graphics.Rendering.OpenGL (Vertex2(..))


-- | basic shapes types should be of 2 kinds:
-- | Shapes  positioned by center
-- | Shapes' positioned by bottom-left corner
data Instanceable = Circle Position Radius
                  | Square Position Side           
                  deriving Show


data Editable = Triangle [Vertex]
              | Polygon  [Vertex]
              deriving Show
                       

type Vertex   = Vertex2 Float
type Position = Vertex2 Float
type Radius   = Float
type Side     = Float
type Drawable = [Vertex]

vertex :: Float -> Float -> Vertex
vertex x y = Vertex2 x y

triangle ::  [Vertex] -> Editable
triangle = Triangle

toDrawable :: Instanceable -> Drawable
toDrawable (Square p side) = [
    Vertex2 (-0.90) (-0.90),  -- Triangle 1
    Vertex2   0.85  (-0.90),
    Vertex2 (-0.90)   0.85 ,
    Vertex2   0.90  (-0.85),  -- Triangle 2
    Vertex2   0.90    0.90 ,
    Vertex2 (-0.85)   0.90 ]

v1 = vertex (-0.90) (-0.90)
v2 = vertex 0.85  (-0.90)
v3 = vertex (-0.90)   0.85
