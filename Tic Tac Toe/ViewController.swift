//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by admin on 03/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    var lastTurn = "o"
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var buttonsArray:[UIButton] = []
    
    var thereIsWinner = false

    
    @IBAction func tap(_ sender: UIButton) {

        switch lastTurn {
        case "o":
            sender.setImage(UIImage(named: "x.png"), for: [])
            sender.tag = 11
            sender.adjustsImageWhenDisabled = false
            sender.isEnabled = false
            lastTurn = "x"
            checkForWinner()
        case "x":
            sender.setImage(UIImage(named: "o.png"), for: [])
            sender.tag = 22
            sender.adjustsImageWhenDisabled = false
            sender.isEnabled = false
            lastTurn = "o"
            checkForWinner()

        default:
            print("reached tap() switch default")
        }
    }
    
    func checkForWinner(){
        // horizontal win
        if (button1.tag == button2.tag) && (button1.tag == button3.tag) {
            print("1,2,3 won!!")
            theWinnerIs()
        }
        if (button4.tag == button5.tag) && (button4.tag == button6.tag) {
            print("4,5,6 won!!")
            theWinnerIs()
        }
        if (button7.tag == button8.tag) && (button7.tag == button9.tag) {
            print("7,8,9 won!!")
            theWinnerIs()
        }
        
        // vertical win
        if (button1.tag == button4.tag) && (button1.tag == button7.tag) {
            print("1,4,7 won!!")
            theWinnerIs()
        }
        if (button2.tag == button5.tag) && (button2.tag == button8.tag) {
            print("2,5,8 won!!")
            theWinnerIs()
        }
        if (button3.tag == button6.tag) && (button3.tag == button9.tag) {
            print("3,6,9 won!!")
            theWinnerIs()
        }
        
        // diagonal win
        if (button1.tag == button5.tag) && (button1.tag == button9.tag) {
            print(" 1,5,9 won!!")
            theWinnerIs()
        }
        if (button3.tag == button5.tag) && (button3.tag == button7.tag) {
            print("3,5,7 won!!")
            theWinnerIs()
        }
        
        if finishedGame(){
            if !thereIsWinner{
                tieGame()
                print("tie game")
            }
        }
    }
    
    func finishedGame() -> Bool{
        
        for button in buttonsArray {
            if button.tag < 11 {
                return false
            }
        }
        return true
    }
    
    func theWinnerIs(){
        thereIsWinner = true
        resultLabel.isHidden = false
        playButton.isHidden = false
        resultLabel.text = lastTurn + " won!"
        resultLabel.textColor = UIColor.blue
        
        // disable all buttons so u can't win again
        for button in buttonsArray{
            button.isEnabled = false
        }
        //show
        UIView.animate(withDuration: 1, animations: {
            self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 1000, y: self.resultLabel.center.y)
            self.playButton.center = CGPoint(x: self.playButton.center.x - 1000, y: self.playButton.center.y)
        })
    }
    
    func tieGame(){
        resultLabel.isHidden = false
        playButton.isHidden = false
        resultLabel.text =  "Tie Game!"
        resultLabel.textColor = UIColor.red
        //show
        UIView.animate(withDuration: 1, animations: {
            self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 1000, y: self.resultLabel.center.y)
            self.playButton.center = CGPoint(x: self.playButton.center.x - 1000, y: self.playButton.center.y)
        })
    }
   
    
    @IBAction func playAgain(_ sender: Any) {
        print("play again pressed")
        // reset vars
        lastTurn = "o"
        thereIsWinner = false
        
        //reset all button tags
        var tagNum = 1
        
        for button in buttonsArray {
            button.tag = tagNum
            button.isEnabled = true
            button.setImage(UIImage(named: ""), for: [])
            tagNum += 1
        }
        
        // hide resultLabel and playButton
        UIView.animate(withDuration: 1, animations: {
            self.resultLabel.center = CGPoint(x: self.resultLabel.center.x - 1000, y: self.resultLabel.center.y)
            self.playButton.center = CGPoint(x: self.playButton.center.x + 1000, y: self.playButton.center.y)
        })
        resultLabel.isHidden = true
        playButton.isHidden = true
    }
    
    func loadButtonsToArray(){
        buttonsArray = [ button1, button2, button3, button4, button5, button6, button7, button8, button9]
        print("buttons loaded to array")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButtonsToArray()
        resultLabel.isHidden = true
        playButton.isHidden = true
        // resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
        // playButton.center = CGPoint(x: playButton.center.x - 500, y: playButton.center.y)
    }

}
