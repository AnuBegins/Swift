//: Playground - noun: a place where people can play

import UIKit

//Heads or Tails
//In this exercise, we are going to focus on writing clean and organized code using functions! When using functions it is important to be descriptive and to organize your code to have a separation of concerns. Let's see this in action:
//
//1. Create a function tossCoin() -> String
//  Have this function print "Tossing a Coin!"
//  Next have the function randomly pick either "Heads" or "Tails"
//  Have the function print the result
//  Finally, have the function return the result
//
//2. Now create another function tossMultipleCoins(Int) -> Double
//   Have this function call the tossCoin function multiple times based on the Integer input
//  Have the function return a Double that reflects the ratio of head toss to total toss

func random(_ n:Int) -> Int
{
    return Int(arc4random_uniform(UInt32(n)))
}

func tossCoin() -> String {
    let outcomes = ["Heads", "Tails"]
    let outcome = outcomes[Int(arc4random_uniform(UInt32(outcomes.count)))]
    print("Flipping a coin...")
    print("Outcome: ",outcome)
    
    return outcome
}

tossCoin()


func tossCoins(flips: Int = 5 ) -> Double {
    var tosses = flips
    var heads_count = 0
    while tosses > 0 {
        let result = tossCoin()
        if result == "Heads" {
            heads_count += 1
        }
        tosses -= 1
    }
    var ratio = Double(heads_count)/Double(flips)
    print("\(heads_count) heads in \(flips) is: ", ratio)
    return Double(heads_count)/Double(flips)
}

tossCoins(flips: 10)

