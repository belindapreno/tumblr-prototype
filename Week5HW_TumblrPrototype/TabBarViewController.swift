//
//  TabBarViewController.swift
//  Week5HW_Tumblr
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController  {
    
    var transition: CustomComposeTransition!

    
    var isPresenting: Bool!

    @IBOutlet weak var contentView: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    @IBOutlet weak var homebutton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    
    
    @IBOutlet weak var explorePopUp: UIImageView!
    
    var currentTab: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
            self.explorePopUp.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)

        
        
        homeViewController.view.frame = contentView.frame
        
        contentView.addSubview(homeViewController.view)
        currentTab = homebutton
        homebutton.selected = true
        
        self.explorePopUp.hidden = false

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTabButton(tabbedButton: UIButton) {
        
        var content = ViewController()
        var button = tabbedButton as UIButton
        
        homebutton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendButton.selected = false
        composeButton.selected = false
        
        button.selected = true
        
        
        if button.tag == 0 {
            
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)

            
            
            
        } else if button.tag == 1 {
            
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
            
            self.explorePopUp.hidden = false
            
            
        } else if button.tag == 2 {
            
            performSegueWithIdentifier("composeSegue", sender: self)
            
            
        } else if button.tag == 3 {
            
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
            
            
        }  else if button.tag == 4 {
            
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
            
        }
        
        if button.tag == 1 {
            self.explorePopUp.hidden = true
        } else {
            self.explorePopUp.hidden = false

        }
        

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        transition = CustomComposeTransition()
        transition.duration = 0.4
        
        destinationVC.transitioningDelegate = transition
    }
    
}
