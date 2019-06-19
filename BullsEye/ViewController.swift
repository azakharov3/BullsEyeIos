//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrey  Zakharov on 6/5/19.
//  Copyright © 2019 Andrey  Zakharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let difference = calculateDiff(valueA: currentValue, valueB: targetValue)
        let points = determineScore(difference: difference)
        score += points
        let title = determineMessage(difference: difference)
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        updateLabels()
    }
    
    private func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    private func calculateDiff(valueA: Int, valueB: Int) -> Int {
        return abs(valueA - valueB)
    }
    
    private func determineScore(difference: Int) -> Int {
        var score = 100 - difference
        if difference == 0 {
            score += 100
        } else if difference <= 1 {
            score += 50
        }
        return score
    }
    
    private func determineMessage(difference: Int) -> String {
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close"
        }
        return title
    }
}

