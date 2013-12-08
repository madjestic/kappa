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
    

class LightOffCommand(Command):
  
  light = None
  
  def __init__(self, light):
    self.light = light
  
  def execute(self):
    self.light.off()

    
class SimpleRemoteControl(object): # It's simple, because all it does is switches the light on
  slot = None
  
  def __init__(self):
      pass
    
  def setCommand(self, command):
    self.slot = command
    
  def buttonWasPressed(self):
    self.slot.execute()
    
    
class ComplexRemoteControl(object): # It has many functions (can switch on/off various machinery)
  def __init__(self):
      self.commandSlot = []
      
  def addCommandSlot(self, command_id, commandOn, commandOff):
    self.commandSlot.append(command_id, commandOn, commandOff)
    
  def buttonWasPressed(self, command_id, commandType):
    self.commandSlot[]
    

def main():
  
  simpleRemote = SimpleRemoteControl()
  light = Light()
  lightOn = LightOnCommand(light)
  
  simpleRemote.setCommand(lightOn)
  simpleRemote.buttonWasPressed()
  
  complexRemote = ComplexRemoteControl()
  lightOff = LightOffCommand(light)
  
  complexRemote.setCommand(lightOff)
  complexRemote.
  

if __name__ == "__main__":
  main()