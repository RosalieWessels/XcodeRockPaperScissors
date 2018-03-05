//
//  ViewController.swift
//  RPS
//
//  Created by Rosalie Wessels on 06/01/2018.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        update(gamestate: GameState.Start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //outlets
    //actions
    @IBOutlet weak var computerTurnLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
  
    @IBAction func rockPressed(_ sender: Any) {
        play(sign: .rock)
    }
    
    @IBAction func playAgainPressed(_ sender: Any) {
        update(gamestate: .Start)
    }
    @IBAction func paperPressed(_ sender: Any) {
        play(sign: .paper)
    }
    
    @IBAction func scissorsPressed(_ sender: Any) {
        play(sign: .scissors)
    }
    
    
    
    func play(sign: Sign){
        
        let com = randomSign()
        let state = sign.gameState(computer: com)
        computerTurnLabel.text = com.TextValue
        update(gamestate: state)
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        rockButton.isEnabled = false
        if sign == .rock{
            scissorsButton.isHidden = true
            paperButton.isHidden = true
            rockButton.isHidden = false
        }
        if sign == .paper{
            scissorsButton.isHidden = true
            paperButton.isHidden = false
            rockButton.isHidden = true
        }
        if sign == .scissors{
            scissorsButton.isHidden = false
            paperButton.isHidden = true
            rockButton.isHidden = true
        }
        playAgainButton.isHidden = false
    }
    
    func update(gamestate: GameState) {
        if gamestate == GameState.Draw{
            statusLabel.text = "You both win! It's a draw!"
            view.backgroundColor = UIColor(red: 0.310, green: 0.427, blue: 0.627, alpha: 1.000)
        }
        if gamestate == GameState.Lose{
            statusLabel.text = "You lose. Next time will go better"
            view.backgroundColor = UIColor(red: 0.627, green: 0.506, blue: 0.714, alpha: 1.000)
        }
        if gamestate == GameState.Win{
            statusLabel.text = "You win! Nice job!"
            view.backgroundColor = UIColor(red: 0.784, green: 0.290, blue: 0.447, alpha: 1.000)
        }
        if gamestate == GameState.Start{
           statusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1.000)
            computerTurnLabel.text = "🤖"
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isHidden = false
            paperButton.isEnabled = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = true
        }
    }
}



