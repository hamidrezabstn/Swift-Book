//
//  ViewController.swift
//  Button Fun
//
//  Created by Iransamaneh on 1/17/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var statusLabel: UILabel!
    @IBAction func buttonClicked(sender: UIButton) {
        /*if(sender.tag==1){
            statusLabel.text="Right Clicked!"
        }else{
            statusLabel.text="Left Clicked!"
        }*/
        let title = sender.titleForState(.Normal)!
        let finalText = "\(title) is clicked"
        //statusLabel.text = finalText
        let styledText = NSMutableAttributedString(string:finalText)
        
        let attributes = [
            NSFontAttributeName:UIFont.boldSystemFontOfSize(statusLabel.font.pointSize)
        ]
        let namerange = (finalText as NSString).rangeOfString(title)
        
        styledText.setAttributes(attributes, range: namerange)
        
        statusLabel.attributedText = styledText
        
    }
}

