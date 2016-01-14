//
//  ViewController.swift
//  BullsEye
//
//  Created by MyMacbook on 1/6/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    var currentValue = 50
    var score = 0
    var round: Int = 0
    @IBOutlet weak var slider: UISlider!//Interface Builder doesn’t see any of your other variables, only the ones marked with @IBOutlet. You can refer to the slider object from anywhere inside the view controller using the slider variable.
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreaLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // The viewDidLoad() message is sent by UIKit as soon as the view controller loads its user interface from the storyboard file. At this point, the view controller isn’t visible yet, so this is a good place to set instance variables to their proper initial values.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        var title: String //переменная определена именно здесь, а не в начале метода, потому что только здесь и используется
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreaLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
}
