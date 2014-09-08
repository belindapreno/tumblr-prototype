//
//  HomeViewController.swift
//  Week5HW_TumblrPrototype
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var transition: CustomComposeTransition!
    var isPresenting: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapLogin(sender: AnyObject) {
        performSegueWithIdentifier("loginSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        transition = CustomComposeTransition()
        transition.duration = 0.4
        
        destinationVC.transitioningDelegate = transition
    }
    

}
