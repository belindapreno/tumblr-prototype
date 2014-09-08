//
//  ComposeViewController.swift
//  Week5HW_TumblrPrototype
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    
    var isPresenting: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDismissButton(sender: AnyObject) {
        println("dismiss")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
