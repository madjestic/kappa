'''
Documentation, License etc.

@package Command
'''

class Command(object):
  
  def execute(self):
    raise NotImplementedError ("Should have implemented this")
  

class GarageDoor(object):
  
  def __init__(self):
      pass
    
  def up(self):
    print "Door is opening"
  
  def down(self):
    pass
  
  def stop(self):
    pass
  
  def lightOn(self):
    pass
  
  def lightOff(self):
    pass


class Light(object):
  
  def __init__(self):
      pass
    
  def on(self):
    print("Light On")
    
  def off(self):
    print "Light is off" 
    
    
class DoorOpenCommand(Command):
  
  door = None
  
  def __init__(self, door):
      self.door = door
      
  def execute(self):
    self.door.up()


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
  
  door = GarageDoor()
  doorOpen = DoorOpenCommand(door)
  
  remote.setCommand(lightOn)
  remote.buttonWasPressed()
  
  remote.setCommand(doorOpen)
  remote.buttonWasPressed()

if __name__ == "__main__":
  main() 