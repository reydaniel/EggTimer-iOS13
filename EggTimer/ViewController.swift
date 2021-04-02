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
    var audio: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let eggName = sender.currentTitle!
        seconds = 0
        progressBar.progress = 0.0
        titleLabel.text = "Boiling \(eggName) Egg..."
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
    }
    
    @objc func showMessage(){
        if seconds < totalTime {
            print(seconds)
            seconds += 1
            let progress = Float(seconds) / Float(totalTime)
            progressBar.progress = progress
        } else {
            titleLabel.text = "Done!"
            play()
            print("Egg Ready!")
            timer?.invalidate()
        }
    }
    
    func play() {
        let soundType = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audio = try! AVAudioPlayer(contentsOf: soundType!)
        audio?.play()
    }

}
