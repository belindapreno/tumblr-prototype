//
//  CustomComposeTransition.swift
//  Week5HW_TumblrPrototype
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class CustomComposeTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning  {
    
    var isPresenting: Bool!
    var duration = 0.4

    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if (isPresenting == true) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
        }
        } else {
            
            containerView.addSubview(fromViewController.view)
            fromViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.01, animations: { () -> Void in
                fromViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    toViewController.removeFromParentViewController()
                    transitionContext.completeTransition(true)
            
            }
        }
    }
}
