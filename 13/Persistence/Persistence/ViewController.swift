//
//  ViewController.swift
//  Persistence
//
//  Created by Iransamaneh on 11/25/1394 AP.
//  Copyright © 1394 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lineFields : [UITextField]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileUrl = self.dataFileUrl()
        
        if NSFileManager.defaultManager().fileExistsAtPath(fileUrl.path!){
            if let array = NSArray(contentsOfURL: fileUrl) as? [String]{
                for var i = 0 ; i < array.count ; i++ {
                    lineFields[i].text = array[i]
                }
            }
        }
        
        let app = UIApplication.sharedApplication()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: app)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFileUrl() -> NSURL{
        let url = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        return url.first!.URLByAppendingPathComponent("data.plist")
        
    }
    
    func applicationWillResignActive(notification:NSNotification) {
        let fileURL = self.dataFileUrl()
        let array = (self.lineFields as NSArray).valueForKey("text") as! NSArray
        array.writeToURL(fileURL, atomically: true)
    }
    


}

