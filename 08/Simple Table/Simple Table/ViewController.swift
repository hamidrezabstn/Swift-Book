//
//  ViewController.swift
//  Simple Table
//
//  Created by Iransamaneh on 1/30/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: simpleTableIdentifier)
            }
            cell!.textLabel?.text = dwarves[indexPath.row]
            
            let image = UIImage(named: "star")
            cell!.imageView?.image = image
            
            let imageHighlight = UIImage(named: "star2")
            cell!.imageView?.highlightedImage = imageHighlight
            
            if indexPath.row > 7{
                cell!.detailTextLabel?.text = "salam"
            } else {
                cell!.detailTextLabel?.text = "bye"
            }
            
            return cell!
            
    }
    
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
                return indexPath.row % 4
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
            if indexPath.row == 0{
                return nil
            }else if indexPath.row % 2 == 0{
                return NSIndexPath(forRow: indexPath.row + 1 , inSection:indexPath.section)
            } else {
                return indexPath
                }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let selectedText = dwarves[row]
        
        let alert = UIAlertController(title: "Selected", message: selectedText, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return indexPath.row == 0 ? 120 : 70
    }
    
    
}

