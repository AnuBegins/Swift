//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// Please create a playground and finish these exercises before uploading.

//First, create a loop (either for or while) that prints all of the values from 1-255
//Next, create a program that prints all of the values from 1-100 that are divisible by 3 or 5 but not both
//Now modify that program to print "Fizz" when the number is divisible by 3 and "Buzz" when the number is divisible by 5 as well as "FizzBuzz" when the number is divisible by both! (See Below)


var start   = 1
var end     = 255
// loop from start to end including end
for i in start...end {
    print(i)
}

var div1 = 3
var div2 = 5
start = 1
end = 100

for i in start...end {
    if ((i % div1 == 0) || (i % div2 == 0)) && (i % (div1 * div2) != 0){
        print(i)
    }
}

for i in start...end {
    if (i % (div1 * div2) == 0) {
        print("FizzBuzz")
    }
    else if( i % div1 == 0){
        print("Fizz")
    }
    else if (i % div2 == 0) {
        print("Buzz")
    }
}



