//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Iransamaneh on 1/29/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController,                        UIPickerViewDelegate , UIPickerViewDataSource{

    @IBOutlet weak var singlePicker: UIPickerView!
    
    private let characterNames = [
        "Luke", "Leia", "Han", "Chewbacca", "Artoo",
        "Threepio", "Lando"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        let row  = singlePicker.selectedRowInComponent(0)
        
        let title = characterNames[row]
        
        let alert = UIAlertController(title: title, message: "Thanks for picking", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Override
    // MARK: DataSource Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    // MARK: DataDelegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
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
