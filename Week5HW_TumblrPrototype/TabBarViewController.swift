//
//  TabBarViewController.swift
//  Week5HW_Tumblr
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
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
        
        self.explorePopUp.hidden = true

        
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
            self.explorePopUp.hidden = false
        } else {
            self.explorePopUp.hidden = true

        }
        

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        var destinationVC = segue.destinationViewController as UIViewController
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning!{
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext:
        UIViewControllerContextTransitioning!) -> NSTimeInterval {
            return 2
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
        }  
    }
    

    
}
