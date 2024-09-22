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
    @IBOutlet weak var clearButton: UIButton!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var counter = 60
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0
        clearButton.layer.cornerRadius = 6
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        guard let hardness = sender.currentTitle else { return }
        guard let result = eggTimes[hardness] else { return }
        
        totalTime = result
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed <= totalTime {
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
            
            secondsPassed += 1
        } else {
            titleLabel.text = "DONE!"
            timer.invalidate()
        }
    }
    
    
    @IBAction func clearButtomPressed(_ sender: UIButton) {
        titleLabel.text = "How do you like your eggs"
        secondsPassed = 0
        totalTime = 0
        progressBar.progress = 0
        timer.invalidate()
    }
    
}
