'''
Documentation, License etc.

@package Design_Patterns
'''

import flyBehavior
FlyBehavior = flyBehavior.FlyBehavior
FlyWithWings = flyBehavior.FlyWithWings
FlyNoWay = flyBehavior.FlyNoWay

import quackBehavior
QuackBehavior = quackBehavior.QuackBehavior
Quack = quackBehavior.Quack
MuteQuack = quackBehavior.MuteQuack
Squeek = quackBehavior.Squeek

import duck
Duck = duck.Duck

 
class MallardDuck(Duck):
  flyBehavior = FlyWithWings()
  quackBehavior = Quack()
  
  def display(self):
    print("I am a real Mallard Duck!")
    
class ModelDuck(Duck):
  def __init__(self):
      self.performFly = FlyNoWay()
      self.quackBehavior = Quack()
      

  def display():
    print("I am a model duck")
      
    
class MiniDuckSimulator(object):
  def __init__(self):
      mallard = MallardDuck()
      mallard.performQuack()
      mallard.performFly()
      mallard.setQuackBehavior(Squeek())
      mallard.performQuack()
      
      
def main():
  duck = MiniDuckSimulator()
  
if __name__ == "__main__":
    main()    