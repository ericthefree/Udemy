//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cookTimer: Timer?

    
    var eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
     
        let result = eggTimes[hardness]!
        
        countdownEggTime(Minutes: result)
    }

    @IBOutlet weak var minuteCountdown: UILabel!
    @IBOutlet weak var secondsCountdown: UILabel!
    
    @objc func countdownEggTime(Minutes: Int) {
        
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            let minutesToCount = Minutes
            let secondsToCount = 0
            
            
            
        }

        
    }
    
    
    
}
