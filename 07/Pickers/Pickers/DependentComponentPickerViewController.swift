//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Iransamaneh on 1/29/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var stateZipPicker : UIPickerView!
    private let zipComponent = 0
    private let stateComponent = 1
    private var states : [String]!
    private var zips : [String]!
    private var statesZips : [String:[String]]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let bundle = NSBundle.mainBundle()
        
        let plistUrl = bundle.URLForResource("statedictionary", withExtension: "plist")
        
        statesZips = NSDictionary(contentsOfURL: plistUrl!) as! [String:[String]]!
        
        let allStates = statesZips.keys
        states = allStates.sort()
        
        let selectedZips = states[0]
        zips = statesZips[selectedZips]
        
        
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == zipComponent {
            return zips.count
        } else {
            return states.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == zipComponent {
            return zips[row]
        } else {
            return states[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = statesZips[selectedState]
            stateZipPicker.reloadComponent(zipComponent)
            stateZipPicker.selectRow(0, inComponent: zipComponent,
            animated: true)
        }    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        let width = pickerView.bounds.size.width
        if component == zipComponent {
            return width/3
        } else {
            return 2 * width/3
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonPressed(sender: UIButton) {
        let zipRow = stateZipPicker.selectedRowInComponent(zipComponent)
        let stateRow = stateZipPicker.selectedRowInComponent(stateComponent)
        
        let zip = zips[zipRow]
        let state = states[stateRow]
        
        let message = "ZIP code is : \(zip) and its for \(state) state "
        
        
        let alert = UIAlertController(title: "Selected state and zip", message: message, preferredStyle: .Alert)
        
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
