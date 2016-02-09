//
//  RootViewController.swift
//  Presidents
//
//  Created by Iransamaneh on 2/9/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        let splitVC = viewControllers[0]
        let newTrait = traitCollection
        
        if (newTrait.horizontalSizeClass == .Compact &&
        newTrait.verticalSizeClass == .Compact)   {
            let childTrait = UITraitCollection(horizontalSizeClass: .Regular)
            setOverrideTraitCollection(childTrait, forChildViewController: splitVC)
        }else {
            setOverrideTraitCollection(nil, forChildViewController: splitVC)
        }
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
