//  ViewController.swift
//  TicTacToe
//
//  Created by Arun Ram on 7/7/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
    var activePlayer = 1
    var squareState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    var gameActive = true
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if (squareState[sender.tag - 1] == 0) && (gameActive == true) {
            
            squareState[sender.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                sender.backgroundColor = UIColor.blue
                activePlayer = 2
            }
            else {
                sender.backgroundColor = UIColor.red
                activePlayer = 1
            }
        }
        
        
        // Treat each combo in winningCombos as an array of position values. If the values in squareState are all equal at the positions specified in a given combo, then we have a winner.
        
        for combo in winningCombos {
            if squareState[combo[0]] != 0 && (squareState[combo[0]] == squareState[combo[1]]) && (squareState[combo[1]] == squareState[combo[2]]) {
                gameActive = false
                if squareState[combo[0]] == 1 {
                    winnerLabel.text = "Blue wins!"
                }
                else {
                    winnerLabel.text = "Red wins!"
                }
                winnerLabel.isHidden = false
            }
        }
        
        // First, 'pause' the game by setting gameActive to False.
        // Next, check if any squares in grid have yet to be pressed. If so, then re-activate game b/c game still isn't finished.
        // if every square in grid has been pressed, then match is a draw by definition  ** code doesn't handle case in which last remaining square, when pressed, completes a winning combination
        
        for square in squareState {
            gameActive = false
            if square == 0 {
                gameActive = true
                break
            }
        }
        
        if gameActive == false {
            winnerLabel.text = "Draw. Play again."
            winnerLabel.isHidden = false
        }

    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        squareState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        activePlayer = 1
        winnerLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton  // for view objects with tag value in range [1,9], instantiate as a UIButton object
            button.backgroundColor = UIColor.lightGray
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


