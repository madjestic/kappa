import flyBehavior

FlyBehavior = flyBehavior.FlyBehavior

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

class Duck(object):
  
  flyBehavior = FlyBehavior()
  quackBehavior = QuackBehavior()
  
  def setFlyBehavior(self, flyBehavior = FlyBehavior()):
    self.flyBehavior = flyBehavior
    
  def setQuackBehavior(self, quackBehavior = QuackBehavior()):
    self.quackBehavior = quackBehavior
    
  
  def duck(self):
    raise NotImplementedError( "Should have implemented this" )

    
  def performFly(self):
    self.flyBehavior.fly() 
    
  def performQuack(self):
    self.quackBehavior.quack()
    
  def swim(self):
    print("All ducks float, even decoys")