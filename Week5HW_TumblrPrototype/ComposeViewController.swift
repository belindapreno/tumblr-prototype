//
//  ComposeViewController.swift
//  Week5HW_TumblrPrototype
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

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
        dismissViewControllerAnimated(true, completion: nil)
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
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            toViewController.view.alpha = 1
            toViewController.removeFromParentViewController()
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
        }
    }

    

}
