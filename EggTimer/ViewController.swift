//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = [
        "Soft": 5,
        "Medium": 8,
        "Hard": 12
    ]
    
    var seconds = 0
    var timer: Timer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let eggName = sender.currentTitle!
        titleLabel.text = "Boiling \(eggName) Egg..."
        print("Boiling \(eggName) Egg...")
        
        seconds = eggTime[eggName]!
        countdown()
    }
    
    func countdown() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(showMessage),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func showMessage(){
        if seconds > 0 {
            print("\(seconds)s remaining")
            seconds -= 1
        } else {
            titleLabel.text = "Done!"
            print("Egg Ready!")
            timer?.invalidate()
        }
    }

}
