//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Iransamaneh on 1/29/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date  = NSDate()
        
        datePicker.setDate(date, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        let date = datePicker.date
        let msg = "The date that you have been selected is \(date)"
        
        let alert  = UIAlertController(title: "Date Selected", message: msg, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Thanks", style: .Default, handler: nil)
        
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
