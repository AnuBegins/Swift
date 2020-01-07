//
//  ViewController.swift
//  Tipster
//
//  Created by Arun Ram on 7/7/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var preTipTotalLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet weak var tipPercentLabel_A: UILabel!
    @IBOutlet weak var tipAmtLabel_A: UILabel!
    @IBOutlet weak var grossTotalLabel_A: UILabel!
    
    @IBOutlet weak var tipAmtLabel_B: UILabel!
    @IBOutlet weak var grossTotalLabel_B: UILabel!
    @IBOutlet weak var tipPercentLabel_B: UILabel!
    
    @IBOutlet weak var tipPercentLabel_C: UILabel!
    @IBOutlet weak var tipAmtLabel_C: UILabel!
    @IBOutlet weak var grossTotalLabel_C: UILabel!
    
    var preTipTotal = ""
    var tipPercent_A = 5.0
    var tipPercent_B = 10.0
    var tipPercent_C = 15.0
  //  let tipOptions = [["A",5],["B", 10],["C", 15]]
    
    
    @IBAction func calculatorAction(_ sender: UIButton) {
        if sender.tag == 10 {
            tipAmtLabel_A.text = "-"
            tipAmtLabel_B.text = "-"
            tipAmtLabel_C.text = "-"
            
            grossTotalLabel_A.text = "-"
            grossTotalLabel_B.text = "-"
            grossTotalLabel_C.text = "-"
            
            preTipTotal = ""
            preTipTotalLabel.text = String(preTipTotal)
        }
        
        else if sender.tag == 12 {
            preTipTotal += "."
            preTipTotalLabel.text = String(preTipTotal)
        }
        else {
            preTipTotal += String(sender.tag)
            preTipTotalLabel.text = String(preTipTotal)
        }
    }
    

    @IBAction func tipSliderAction(_ sender: UISlider) {
        let sliderVal           = Double(sender.value)
        let groupSize           = Double(groupSizeLabel.text!) ?? 1
        
        let tipAmount_A         = (Double(preTipTotal) ?? 0) * (Double(sliderVal + tipPercent_A)/100)
        let tipAmount_B         = (Double(preTipTotal) ?? 0) * (Double(sliderVal + tipPercent_B)/100)
        let tipAmount_C         = (Double(preTipTotal) ?? 0) * (Double(sliderVal + tipPercent_C)/100)
        
        tipPercentLabel_A.text  = String(format: "%.1f", Double(sliderVal + tipPercent_A)) + "%"
        tipAmtLabel_A.text      = String(format: "%.2f", tipAmount_A/groupSize)
        grossTotalLabel_A.text  = String(format: "%.2f", (tipAmount_A + Double(preTipTotal)!)/groupSize)
        
        tipPercentLabel_B.text  = String(format: "%.1f", Double(sliderVal + tipPercent_B)) + "%"
        tipAmtLabel_B.text      = String(format: "%.2f", tipAmount_B/groupSize)
        grossTotalLabel_B.text  = String(format: "%.2f", (tipAmount_B + Double(preTipTotal)!)/groupSize)
        
        tipPercentLabel_C.text  = String(format: "%.1f", Double(sliderVal + tipPercent_C)) + "%"
        tipAmtLabel_C.text      = String(format: "%.2f", tipAmount_C/groupSize)
        grossTotalLabel_C.text  = String(format: "%.2f", (tipAmount_C + Double(preTipTotal)!)/groupSize)
        
    }
    
    
    @IBAction func groupSizeSliderAction(_ sender: UISlider) {
        groupSizeLabel.text     = String(Int(sender.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupSizeLabel.text     = "1"
        tipPercentLabel_A.text  = String(tipPercent_A) + "%"
        tipPercentLabel_B.text  = String(tipPercent_B) + "%"
        tipPercentLabel_C.text  = String(tipPercent_C) + "%"
    }




}

