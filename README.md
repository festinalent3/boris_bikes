Objects:          Messages:
  person
  bikes           release from docking
  good bikes      check if bike is working


good bikes ---> bikes ----> person
          check         release bike
          if bike
          is working


walkthrough answer:

Objects:                  Messages:
person
bike                      working?
DockingStation            release bike



Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike


test
test2
