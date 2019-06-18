//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrey  Zakharov on 6/5/19.
//  Copyright © 2019 Andrey  Zakharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let message = "The current value of the slider is now: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\nThe difference is: \(calculateDiff(valueA: currentValue, valueB: targetValue))"
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded();
        currentValue = Int(roundedValue)
    }
    
    private func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    private func calculateDiff(valueA: Int, valueB: Int) -> Int {
        return abs(valueA - valueB)
    }
}

