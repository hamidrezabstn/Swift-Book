//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by Hamidrzea Bistooni on ۱۳۹۴/۱۱/۹ ه‍.ش..
//  Copyright © ۱۳۹۴ ه‍.ش. Hamidrzea Bistooni. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    private var blueViewController : UIViewController!
    private var yellowViewController : UIViewController!
    
    
    
    
    
    @IBAction func switchViews(sender : UIBarButtonItem){
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil{
                yellowViewController = storyboard?.instantiateViewControllerWithIdentifier("Yellow") as! YellowViewController
            }
        }else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Bluew") as! BlueViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if blueViewController != nil && blueViewController.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight,
                forView: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(blueViewController, toVC: yellowViewController)
        }else{
            UIView.setAnimationTransition(.FlipFromLeft,
            forView: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(yellowViewController, toVC: blueViewController)
        }
        UIView.commitAnimations()
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueViewController =
            storyboard?.instantiateViewControllerWithIdentifier("Blue")
            as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(nil, toVC: blueViewController)
        
    }
    
    override func didReceiveMemoryWarning() {
            if blueViewController != nil && blueViewController.view.superview == nil {
                blueViewController = nil
            }
            if yellowViewController != nil && yellowViewController.view.superview != nil {
                yellowViewController = nil
            }
    }
    
    private func switchViewController(fromVC : UIViewController? , toVC : UIViewController?){
                    if fromVC != nil {
                        fromVC!.willMoveToParentViewController(nil)
                        fromVC!.view.removeFromSuperview()
                        fromVC!.removeFromParentViewController()
                
                    }
                    
                    if toVC != nil {
                        self.addChildViewController(toVC!)
                        self.view.insertSubview(toVC!.view, atIndex: 0)
                        toVC!.didMoveToParentViewController(self)
                        
                        
                    }
                    
    }
    

}
