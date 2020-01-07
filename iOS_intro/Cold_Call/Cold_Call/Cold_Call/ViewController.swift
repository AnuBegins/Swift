//
//  ViewController.swift
//  Cold_Call
//
//  Created by Arun Ram on 7/6/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    let names = ["Bono", "Tupac", "Biggie", "Jay-Z", "Beyonce", "Madonna", "Elvis", "John Mellencamp"]
    
    
    @IBAction func callBtnPressed(_ sender: UIButton) {
        randDisplay()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randDisplay()
    }

    func randDisplay() {
        let len = UInt32(names.count)
        let rand = Int(arc4random_uniform(len))
        nameLabel.text = names[rand]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

