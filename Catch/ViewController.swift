//
//  ViewController.swift
//  Catch
//
//  Created by Jamie on 2020/09/12.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var btc1: UIImageView!
    @IBOutlet weak var btc2: UIImageView!
    @IBOutlet weak var btc3: UIImageView!
    @IBOutlet weak var btc4: UIImageView!
    @IBOutlet weak var btc5: UIImageView!
    @IBOutlet weak var btc6: UIImageView!
    @IBOutlet weak var btc7: UIImageView!
    @IBOutlet weak var btc8: UIImageView!
    @IBOutlet weak var btc9: UIImageView!
    
    var score = 0
    var timeLimit = 5
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreLabel.text = "Score: \(score)"
        
        btc1.isUserInteractionEnabled = true
        btc2.isUserInteractionEnabled = true
        btc3.isUserInteractionEnabled = true
        btc4.isUserInteractionEnabled = true
        btc5.isUserInteractionEnabled = true
        btc6.isUserInteractionEnabled = true
        btc7.isUserInteractionEnabled = true
        btc8.isUserInteractionEnabled = true
        btc9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        btc1.addGestureRecognizer(recognizer1)
        btc2.addGestureRecognizer(recognizer2)
        btc3.addGestureRecognizer(recognizer3)
        btc4.addGestureRecognizer(recognizer4)
        btc5.addGestureRecognizer(recognizer5)
        btc6.addGestureRecognizer(recognizer6)
        btc7.addGestureRecognizer(recognizer7)
        btc8.addGestureRecognizer(recognizer8)
        btc9.addGestureRecognizer(recognizer9)

         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)

    }
    
    @objc func increaseScore() {
        
        score += 1
        //print("Score: \(score)")
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func timerFunc() {
        
        timeLimit -= 1
        
        timeLabel.text = "Time: \(timeLimit)"
        
        if timeLimit == 0 {
            
            timer.invalidate()
            timeLabel.text = "Time over"
            
            let alert = UIAlertController(title: "Time Over", message: "Wanna play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "REPLAY", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //replay func
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
}

