//
//  FirstViewController.swift
//  BridgeControl
//
//  Created by Iransamaneh on 2/9/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var officerLabel:UILabel!
    @IBOutlet var authorizationCodeLabel:UILabel!
    @IBOutlet var rankLabel:UILabel!
    @IBOutlet var warpDriveLabel:UILabel!
    @IBOutlet var warpFactorLabel:UILabel!
    @IBOutlet var favoriteTeaLabel:UILabel!
    @IBOutlet var favoriteCaptainLabel:UILabel!
    @IBOutlet var favoriteGadgetLabel:UILabel!
    @IBOutlet var favoriteAlienLabel:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func refreshView (){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        officerLabel.text =  defaults.stringForKey(officerKey)
        let test =  defaults.stringForKey(officerKey)
        authorizationCodeLabel.text =  defaults.stringForKey(authorizationCodeKey)
        rankLabel.text =  defaults.stringForKey(rankKey)
        warpDriveLabel.text =  (defaults.boolForKey(warpDriveKey)) ? "Engaged" : "disabled"
        warpFactorLabel.text =  defaults.objectForKey(warpFactorKey)?.stringValue
        favoriteTeaLabel.text =  defaults.stringForKey(favoriteTeaKey)
        favoriteCaptainLabel.text =  defaults.stringForKey(favoriteCaptainKey)
        favoriteGadgetLabel.text =  defaults.stringForKey(favoriteGadgetKey)
        favoriteAlienLabel.text =  defaults.stringForKey(favoriteAlienKey)
        
    }
    
    override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            refreshView()
        
        let app = UIApplication.sharedApplication()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object:app)
    }
    
    func applicationWillEnterForeground(notification:NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        refreshView()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    

}

