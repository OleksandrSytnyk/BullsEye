//
//  AboutViewController.swift
//  BullsEye
//
//  Created by MyMacbook on 1/14/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

    if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            let htmlData = NSData(contentsOfFile: htmlFile)
let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
        webView.loadData(htmlData!, MIMEType: "text/html",
            textEncodingName: "UTF-8", baseURL: baseURL)
        }
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
