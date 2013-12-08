class QuackBehavior():
  '''
  interface method, declare me later 
  '''
  def quack(self):
    raise NotImplementedError( "Should have implemented this" )

class Quack(QuackBehavior):
  def quack(self):
      print("Quack!")
      
class MuteQuack(QuackBehavior):
  def quack(self):
    print("<< Silence >>")

class Squeek(QuackBehavior):
  def quack(self):
      print("Squeek!")
