//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by Iransamaneh on 2/5/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {

    var font : UIFont!
    private static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    
    private static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return FontSizesViewController.pointSizes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(FontSizesViewController.cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text =
        "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }

    
    func fontForDisplay (atIndexPath indexPath : NSIndexPath) -> UIFont!{
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.fontWithSize(pointSize)
    
    }
    
}
