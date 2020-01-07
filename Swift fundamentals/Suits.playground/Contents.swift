//: Playground - noun: a place where people can play

import UIKit
var str = "Hello, playground"

//["Clubs": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Diamonds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Hearts": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Spades": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]]


let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
let cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
var deckOfCards = [String: [Int]]()

for suit in suits{
    deckOfCards[suit] = cards
}


print(deckOfCards)



