//: Playground - noun: a place where people can play

import UIKit


class Animal {
    var name: String
    var health: Int
    init(name: String) {
        self.name = name
        self.health = 100
    }
    func displayHealth() {
        print(self.health)
    }
}

class Cat: Animal {
    override init(name: String) { // need the override keyword on init b/c it has the same parameter name as Animal init method
        super.init(name: name)   // super.init allows us to call upon the superclass's initialization method.
        self.health = 150           // super.init must be called after initialization of child class properties but before any overrides of inherited properties
    }
    
    func growl() {
        print("Rawr!")
    }
    func run() {
        print("Running")
        self.health -= 10
    }
}

class Cheetah: Cat {
    override func run() {
        if self.health >= 50 {
            print("Running Fast")
            self.health -= 50
        }
        else {
            print("Not enough health to run")
        }
    }
    
    func sleep() {
        if self.health <= 150 {
            self.health += 50
        }
    }
}


class Lion: Cat {
    override init(name: String) {
        super.init(name: name)
        self.health = 200
    }
    override func growl() {
        print("ROAR!!! I am the King of the Jungle. King Kong aint got shit on me.")
    }
}

var cheetah = Cheetah(name: "Chester")
cheetah.run()
cheetah.run()
cheetah.run()
cheetah.run()
print(cheetah.health)

var lion = Lion(name: "Leo")
lion.run()
lion.run()
lion.run()
lion.growl()



//    Animals
//Objective
//The objective of this assignment is to help you understand inheritance and how classes can be used to help organize your code. Apple gives us access to the iOS framework to build mobile applications, and the different APIs in the framework are built on heavy OOP principles that involve inheritance. Therefore, it is extremely important to understand inheritance so that you can navigate the iOS landscape more easily.
//
//To Do
//First, create a class called Animal
//
//Give Animal a property "name"
//Give Animal a property "health" with a default value of 100
//Give Animal an initialization that takes in a name and sets the name property appropriately
//Give the animal a displayHealth method
//Next, create a subclass of Animal called Cat
//
//Give the Cat a method "growl" that prints to the screen "Rawr!"
//Modify the Cat's health to be 150
//Give the Cat a method "run" that prints to the screen "Running" and deducts 10 health
//Next, create two subclasses of Cat - Cheetah and Lion
//
//Override the growl method of the Lion to make it print "ROAR!!!! I am the King of the Jungle"
//Override Lion's health to be 200
//Override the Cheetah's run method to print "Running Fast" and deduct 50 health
//Add a sleep function to the Cheetah class that adds 50 health, make sure its health doesn't go over 200.
//Create a Cheetah. Have the Cheetah run 4 times. Display the Cheetah's health. Now modify the Cheetah's run method so that it cannot run if it does not have the required health.
//
//Create a Lion. Have the Lion run 3 times. Have the Lion growl.
