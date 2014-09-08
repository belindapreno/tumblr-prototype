//
//  TabBarViewController.swift
//  Week5HW_Tumblr
//
//  Created by Belinda Preno on 9/7/14.
//  Copyright (c) 2014 Belinda Preno. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTabButton(sender: AnyObject) {
        
        var button = sender as UIButton
        
        if button.tag == 0 {
            
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)
            
        } else if button.tag == 1 {
            
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
            
        } else if button.tag == 2 {
            
            composeViewController.view.frame = contentView.frame
            contentView.addSubview(composeViewController.view)
            
        } else if button.tag == 3 {
            
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
            
        }  else if button.tag == 4 {
            
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
            
        }
        
        
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
