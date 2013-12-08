'''
Documentation, License etc.

@package Command
'''

class Light(object):
  
  def __init__(self):
      pass
    
  def on(self):
    print("Light On")
    
  def off(self):
    print "Light is off"
      

class Command(object):
  
  def execute(self):
    raise NotImplementedError ("Should have implemented this")


class LightOnCommand(Command):
  
  light = None
  
  def __init__(self, light):
    self.light = light
  
  def execute(self):
    self.light.on()
    
    
class SimpleRemoteControl(object):
  slot = None
  
  def __init__(self):
      pass
    
  def setCommand(self, command):
    self.slot = command
    
  def buttonWasPressed(self):
    self.slot.execute()
    

def main():
  
  remote = SimpleRemoteControl()
  light = Light()
  lightOn = LightOnCommand(light)
  
  remote.setCommand(lightOn)
  remote.buttonWasPressed()

if __name__ == "__main__":
  main()