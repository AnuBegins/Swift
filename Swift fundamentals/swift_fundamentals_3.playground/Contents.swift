//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Swift Fundamentals III
//In this set of exercises, we'll be adding to our knowledge of the basic building blocks by incorporating Arrays.
//
//Complete the following exercises in a playground and upload your code below.
//
//1. Write a program that adds the numbers 1-255 to an array

//2. Swap two random values in the array
//Hint: you can use the arc4random_uniform(UInt32) function to get a random number from 0 to the number passed in. The arc4random_uniform function takes in one parameter that is of the UInt32 type and returns a random number that is of the UInt32 type. How can you deal with this using your knowledge of types?

//3. Now write the code that swaps random values 100 times (You've created a "Shuffle"!)

//4. Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.


var int_array = [Int]()
var start = 1
var end = 255
for i in start...end {
    int_array.append(i)
}
print(int_array)


// ------------------------------------------------------------
func random(_ n:Int) -> Int
{
    return Int(arc4random_uniform(UInt32(n)))
}

var rand1 = random(end)
var rand2 = random(end)
print("rand1 is: ", rand1)
print("rand2 is: ", rand2)

let rand1_pos = int_array.index(of: rand1)
let rand2_pos = int_array.index(of: rand2)
int_array.swapAt(rand1_pos!, rand2_pos!)

//int_array[rand1_pos!] = rand2
//int_array[rand2_pos!] = rand1

print(int_array)

//--------------------------------------------------------------

var last = int_array.count - 1

while(last > 0)
{
    let rand = Int(arc4random_uniform(UInt32(last)))
    print("swap int_array[\(last)] = \(int_array[last]) with int_array[\(rand)] = \(int_array[rand])")
    int_array.swapAt(last, rand)
    last -= 1
}
 print(int_array)
//--------------------------------------------------------------

if let popped = int_array.index(of: 42) {
    print("we have found the answer..... at index \(popped)")
}

