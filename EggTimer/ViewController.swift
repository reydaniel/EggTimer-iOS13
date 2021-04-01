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
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = [
        "Soft": 5,
        "Medium": 8,
        "Hard": 12
    ]
    
    var seconds = 0
    var totalTime = 0
    var timer: Timer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let eggName = sender.currentTitle!
        titleLabel.text = "Boiling \(eggName) Egg..."
        print("Boiling \(eggName) Egg...")
        
        totalTime = eggTime[eggName]!
        countdown()
    }
    
    func countdown() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(showMessage),
                                     userInfo: nil,
                                     repeats: true)
        
//        UIView.animate(withDuration: Double(seconds)){
//            self.progressBar.setProgress(1.0, animated: true)
//        }
    }
    
    @objc func showMessage(){
        if totalTime > seconds {
            let progress = seconds / totalTime
            progressBar.progress = Float(progress)
            seconds += 1
            print("\(seconds)s remaining")
        } else {
            titleLabel.text = "Done!"
            print("Egg Ready!")
            timer?.invalidate()
//            progressBar.setProgress(0, animated: false)
        }
    }

}
