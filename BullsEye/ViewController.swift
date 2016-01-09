//
//  ViewController.swift
//  BullsEye
//
//  Created by MyMacbook on 1/6/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    @IBOutlet weak var slider: UISlider!//Interface Builder doesn’t see any of your other variables, only the ones marked with @IBOutlet. You can refer to the slider object from anywhere inside the view controller using the slider variable.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // The viewDidLoad() message is sent by UIKit as soon as the view controller loads its user interface from the storyboard file. At this point, the view controller isn’t visible yet, so this is a good place to set instance variables to their proper initial values.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello, World",
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}

