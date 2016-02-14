//
//  SecondViewController.swift
//  BridgeControl
//
//  Created by Iransamaneh on 2/9/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var engineSwitch : UISwitch!
    @IBOutlet weak var warpFactorSlider : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEngageSwitchTapped(sender: UISwitch) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(engineSwitch.on, forKey: warpDriveKey)
        defaults.synchronize()
    }

    @IBAction func onWarpSliderDragged(sender: UISlider) {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }

    @IBAction func onSettingsButtonTapped(sender: UIButton) {
        UIApplication.sharedApplication().openURL(
         NSURL(string: UIApplicationOpenSettingsURLString)!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
    }
    func refreshFields() {
        let defaults = NSUserDefaults.standardUserDefaults()
        engineSwitch.on = defaults.boolForKey(warpDriveKey)
        warpFactorSlider.value = defaults.floatForKey(warpFactorKey)
    }
    
    func applicationWillEnterForeground(notification:NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        refreshFields()
    }
    
    override func viewDidDisappear(animated: Bool) {
            super.viewDidDisappear(animated)
            NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

