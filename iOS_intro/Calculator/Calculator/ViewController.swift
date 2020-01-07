//
//  ViewController.swift
//  Calculator
//
//  Created by Arun Ram on 7/8/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayNum: Double      = 0
    var previousNum: Double     = 0
    var isCalculating           = false
    var mathOperator            = 0

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var decimalKeyBtn: UIButton!
    
    @IBAction func calcBtnAction(_ sender: UIButton) {   // when Calculator buttons with numbers are pressed
        
        if isCalculating == true {
            displayLabel.text   = String(sender.tag)
            isCalculating       = false
        }
        else {
            displayLabel.text   = displayLabel.text! + String(sender.tag)
        }
        
        displayNum = Double(displayLabel.text!)!
    }
    
    @IBAction func mathBtnAction(_ sender: UIButton) {
        if displayLabel.text != nil && sender.tag != 10 && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 && sender.tag != 18 {
            
            decimalKeyBtn.isEnabled = true
            previousNum = Double(displayLabel.text!)!
            print("|previousNum: \(previousNum)|")
            
            if sender.tag == 13 {                       // division
                displayLabel.text = "/"
            }
            else if sender.tag == 14 {                  // multiplication
                displayLabel.text = "x"
            }
            else if sender.tag == 15 {                  // subtraction
                displayLabel.text = "-"
            }
            else if sender.tag == 16 {                  // addition
                displayLabel.text = "+"
            }
            
            mathOperator = sender.tag
            isCalculating = true
            print("|mathOperator: \(mathOperator)|")
        }
        
        else if sender.tag == 11 {                      // opposite sign
            let oppositeVal = (previousNum * -1)
            displayLabel.text = String(oppositeVal )
            isCalculating = false
        }
        
        else if sender.tag == 12 {                      //percentage button
            let percentage = previousNum/100
            displayLabel.text = String(percentage)
            isCalculating = false
        }
        
        else if sender.tag == 18 {                      // decimal !
            displayLabel.text = displayLabel.text! + "."
            print(displayLabel.text!)
            isCalculating = false
            decimalKeyBtn.isEnabled = false
        }
        
        // if the '=' button is pressed
        else if sender.tag == 17 {
            
            print("|displayNum: \(displayNum)|")
            
            if mathOperator == 13 {
                let quotient        = previousNum/displayNum
                print("|Quotient: \(quotient)|")
                displayLabel.text   = String(quotient)
            }
            else if mathOperator == 14 {
                let product         = previousNum * displayNum
                print("|Product: \(product) |")
                displayLabel.text   = String(product)
            }
            else if mathOperator == 15 {
                let difference      = previousNum - displayNum
                print("|difference: \(difference) |")
                displayLabel.text   = String(difference)
            }
            else if mathOperator == 16 {
                let sum             = previousNum + displayNum
                print("|sum: \(sum)|")
                displayLabel.text   = String(sum)
            }
            
            print("|displayLabel: \(displayLabel.text!) |" )
            isCalculating = false
        }
        
        //  When the 'Clear' button is pressed
        else if sender.tag == 10 {
            displayLabel.text   = ""
            previousNum         = 0
            displayNum          = 0
            mathOperator        = 0
            isCalculating       = false
            decimalKeyBtn.isEnabled = true
            
            print("|previousNum: \(previousNum)| |displayNum: \(displayNum)| |mathOperator: \(mathOperator)| ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

