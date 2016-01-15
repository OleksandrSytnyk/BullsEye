//
//  AboutViewController.swift
//  BullsEye
//
//  Created by MyMacbook on 1/14/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
        //If you would have said dism..(false, ...), then there would be no page flip and the main screen would instantly reappear.
    }
}
