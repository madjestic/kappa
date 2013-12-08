class FlyBehavior(object):
  '''
  interface method, declare me later
  '''
  def fly(self):
    raise NotImplementedError( "Should have implemented this" )

class FlyWithWings(FlyBehavior):
  def fly(self):
    print("I fly with wings")
    
class FlyNoWay(FlyBehavior):
  def fly(self):
    print("I can't fly")