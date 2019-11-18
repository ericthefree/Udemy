//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var player: AVAudioPlayer!
    var secondsRemaining = 0
    var minutesRemaining = 0
    var totalTime = 0
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var timePassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        timePassed = 0
        timerLabel.text = ""
        timer.invalidate()

        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]! * 60
        
     
        minutesRemaining = eggTimes[hardness]!
        secondsRemaining = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil,repeats: true)
        
    }
    
    @objc func updateTimer() {

        if minutesRemaining > 0 {
            if secondsRemaining > 0 {
                timerLabel.text = "\(minutesRemaining) MIN  \(secondsRemaining) SEC"
                let percentageProgress = Float(timePassed) / Float(totalTime)
                progressBar.progress = Float(percentageProgress)
                timePassed += 1
                secondsRemaining -= 1
            
            } else if secondsRemaining == 0 {
                timerLabel.text = "\(minutesRemaining) MIN \(secondsRemaining) SEC"
                
                let percentageProgress = Float(timePassed) / Float(totalTime)
                progressBar.progress = Float(percentageProgress)
                timePassed += 1
                
                minutesRemaining -= 1
                secondsRemaining = 60

            }
        } else {
            if secondsRemaining > 0 {
                timerLabel.text = "\(minutesRemaining) MIN \(secondsRemaining) SEC"
                
                let percentageProgress = Float(timePassed) / Float(totalTime)
                progressBar.progress = Float(percentageProgress)
                timePassed += 1
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                timerLabel.text = "\(minutesRemaining) minutes, \(secondsRemaining) seconds."
                timerLabel.text = "DONE!"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
        }
    }
}
