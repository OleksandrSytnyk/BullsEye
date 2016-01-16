//
//  ViewController.swift
//  BullsEye
//
//  Created by MyMacbook on 1/6/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0//instance variables
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
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        //The thumb( the button on the scale) works like a button so it gets an image for the normal, un-pressed state and one for the highlighted state.
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        //left and right - directions where I need to expand or shrink image for sleders track. Without it xCode stretch the image pixels to bigger size making quality going down. 
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
        let trackLeftResizable =
        trackLeftImage.resizableImageWithCapInsets(insets)
        slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
}
 //The slider uses different images for the track on the left of the thumb (green) and the track to the right of the thumb (gray).
if let trackRightImage = UIImage(named: "SliderTrackRight") {
let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)//Difference can have a different value every time the player taps the Hit Me button, even though it is a constant. It's ppssoble because each time a method is invoked, its local variables and constants are created anew. The old values have long been forgotten and we get all new ones.
        var points = 100 - difference//local variables
       
        
        var title: String //переменная определена именно здесь, а не в начале метода, потому что только здесь и используется
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50}//if inside if!!!
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
         score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()
            self.updateLabels()})//This code is not performed right away, only when the OK button is tapped.
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
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

    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }





}