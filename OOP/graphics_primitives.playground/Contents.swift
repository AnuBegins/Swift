//: Playground - noun: a place where people can play

import UIKit
import Foundation
import CoreGraphics

var str = "Hello, playground"



struct Point {
    var x: Int
    var y: Int
}


struct Line {
    var start   = Point(x: Int, y: Int)
    var end     = Point(x: Int, y: Int)
    
    func length() -> Double  {
        return sqrt(Double(pow((start.x - end.x),2) + pow((start.y - end.y),2)))
    }
}

struct Triangle {
    var base: Double
    var height: Double
    
    func area() -> Double {
        return (base * height)/2
    }
}


