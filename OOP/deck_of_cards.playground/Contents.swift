//: Playground - noun: a place where people can play

import UIKit
import Foundation
import CoreGraphics

var str = "Hello, playground"

struct Card {
    var Roll: Int       //Give the Card a property "Roll" which will hold a random value that represents the side of the die that will trigger that card.
    
    var Color: String  //Give the Card struct a property "Color" which will hold the color values associated with the card (Red, Blue, or Green). This value should be a String or an Enum
    init(Color: String) {
        self.Color      = Color
        if Color        == "Blue" {
            self.Roll = Int(arc4random_uniform(2)) + 1
        }
        else if Color   == "Red" {
            self.Roll = Int(arc4random_uniform(2)) + 3
        }
        else {
            self.Roll = Int(arc4random_uniform(2)) + 5
        }
        //Blue cards should have a roll value of either 1 or 2
        //Red cards should have a roll value of either 3 or 4
        //Green cards should have a roll value of 5 or 6
    }
}

class Deck {
    var cards = [Card]()   //Give the Deck class a property called "cards" of type [Card]
    init() {               //When initializing the deck make sure that it has 10 cards of each color for a total of 30
        for _ in 1...10 {
            let blueCard    = Card(Color: "Blue")
            let redCard     = Card(Color: "Red")
            let greenCard   = Card(Color: "Green")
            self.cards.append(blueCard)
            self.cards.append(greenCard)
            self.cards.append(redCard)
        }
    }
    
    func deal() -> Card {   // method deal selects the "top-most" card, removes it, and returns it
        print("< Last card: ", self.cards.removeLast()," >")
        return self.cards.removeLast()
    }
    
    func isEmpty() -> Bool {       // method isEmpty returns true if deck has run out of cards,  false otherwise
        if self.cards.count > 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func shuffle() {               //shuffle method randomly reorders the deck's cards
        var last = self.cards.count - 1
        while (last > 0) {
            let rand = Int(arc4random_uniform(UInt32(self.cards.count)))
            self.cards.swapAt(last,rand)
//            print(self.cards)
            last -= 1
        }
    }
}


class Player {
    var name: String        //Give the Player class a property 'name' of type String
    var hand = [Card]()     // property 'hand' of type [Card]
    init(name: String) {
        self.name = name
    }
    
    func draw(deck: Deck) -> Card { //method 'draw' of type (Deck) -> Card draws card from a deck, adds it to player's hand, then returns it
        let dealt_card = deck.deal()
        self.hand.append(dealt_card)
        return dealt_card
    }
    
    func rollDice() -> Int {
        let rand = Int(arc4random_uniform(5)) + 1
        return rand
    }
    
    func matchingCards(Color: String, Roll: Int) -> Int {
        var count = 0
        for card in self.hand {
            if (card.Color == Color) && (card.Roll == Roll) {
                count += 1
            }
        }
        return count
    }
}

var deck_1 = Deck()
//print(deck_1.cards)

var player = Player(name: "The Dude")
print(player.name)

deck_1.shuffle()
//print(deck_1.cards)

print(player.hand)
var card = player.draw(deck: deck_1)
print(player.hand)
print(card)



//Deck of Cards
//Objective
//In Swift Structs and Classes are used extensively. This assignment is designed to help you understand the differences between Classes and Structs so that you can choose the best construct for your needs when building your own applications. It is natural to question whether to use a Class or a Struct, and this will become more and more clear as you use both and see the differences.
//
//With this assignment we will be building the basic structure of a simple game we are going to call "Machi". For this game there are 30 cards of 3 different colors each with a value that matches one of the potential rolls of a six-sided dice.
//
//
//To Do
//Create a struct called "Card"
//
//Give the Card struct a property "Color" which will hold the color values associated with the card (Red, Blue, or Green). This value should be a String or an Enum
//Give the Card a property "Roll" which will hold a random value that represents the side of the die that will trigger that card.
//Blue cards should have a roll value of either 1 or 2
//Red cards should have a roll value of either 3 or 4
//Green cards should have a roll value of 4, 5 or 6
//
//
//Next, create a class called "Deck"
//
//Give the Deck class a property called "cards" of type [Card]
//When initializing the deck make sure that it has 10 cards of each color for a total of 30
//Give the Deck a deal method that selects the "top-most" card, removes it, and returns it
//Give the Deck a isEmpty method that returns true or false in regards to if the deck has ran out of cards.
//Give the Deck a shuffle method that randomly reorders the deck's cards
//
//
//Finally, create a class called "Player"
//
//Give the Player class a name property
//Give the Player a hand property of type [Card]
//Give the Player a draw method of type (Deck) -> Card which draws a card from a deck, adds it to the players hand, and returns it
//Note how we are passing the Deck by reference here since it is a class.
//Give the Player a rollDice method that returns a random number between 1 and 6
//Give the Player a matchingCards method of (String, Int) -> Int that will count all the card the player has which match the given color string and roll integer.

