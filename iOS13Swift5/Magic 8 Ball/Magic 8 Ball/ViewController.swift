//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Freeman, Eric on 10/14/19.
//  Copyright © 2019 Freeman, Eric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomeBallNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        newBallImage()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
 
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    func newBallImage() {
        randomeBallNumber = Int.random(in: 0 ... 4)
        
        imageView.image = UIImage(named: ballArray[randomeBallNumber])
    }
}

