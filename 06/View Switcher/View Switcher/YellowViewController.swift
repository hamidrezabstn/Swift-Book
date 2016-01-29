//
//  YellowViewController.swift
//  View Switcher
//
//  Created by Hamidrzea Bistooni on ۱۳۹۴/۱۱/۹ ه‍.ش..
//  Copyright © ۱۳۹۴ ه‍.ش. Hamidrzea Bistooni. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yellowButtonPressed(){
        
        let alert = UIAlertController(title: "Yellow Pressed", message: nil, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
