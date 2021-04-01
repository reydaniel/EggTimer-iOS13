//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = [
        "softEgg": 5,
        "mediumEgg": 8,
        "hardEgg": 12
    ]
    
    var seconds = 0
    var timer: Timer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let eggName = sender.currentTitle!
        
        switch eggName {
            case "Soft":
                seconds = eggTime["softEgg"]!
                print("Boiling Soft Egg...")
                countdown()
            case "Medium":
                seconds = eggTime["mediumEgg"]!
                print("Boiling Medium Egg...")
                countdown()
            case "Hard":
                seconds = eggTime["hardEgg"]!
                print("Boiling Hard Egg...")
                countdown()
            default:
                print("Egg was gone")
            }
        
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
            print("Egg Ready!")
            timer?.invalidate()
        }
    }

}
