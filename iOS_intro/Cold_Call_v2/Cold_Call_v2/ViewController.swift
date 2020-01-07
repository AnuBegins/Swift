//
//  ViewController.swift
//  Cold_Call_v2
//
//  Created by Arun Ram on 7/6/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    let names = ["Bono", "Madonna", "Jay-Z", "Beyonce", "The Edge", "Prince", "John Mellencamp", "The New Radicals"]
    
    @IBAction func coldCallBtnPressed(_ sender: UIButton) {
        randDisplay()
    }
    
    func randDisplay() {
        let len = UInt32(names.count)
        let rand = Int(arc4random_uniform(len))
        nameLabel.text = names[rand]
        
        let rand2 = Int(arc4random_uniform(4) + 1)
        
        if (rand2 == 1) || (rand2 == 2) {
            numberLabel.textColor = UIColor.red
        }
        else if (rand2 == 3) || (rand2 == 4) {
            numberLabel.textColor = UIColor.orange
        }
        else {
            numberLabel.textColor = UIColor.green
        }
        
        numberLabel.text = String(rand2)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randDisplay()
    }

}

