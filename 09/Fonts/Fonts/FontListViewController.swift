//
//  FontListViewController.swift
//  Fonts
//
//  Created by Iransamaneh on 2/5/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {
    
    var fontNames :[String] = []
    var showFavorites : Bool = false
    private var cellPointSize : CGFloat!
    private static let cellIdentifier = "FontName"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let preferedTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferedTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
        
        if showFavorites {
            navigationItem.rightBarButtonItem = editButtonItem()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier(FontListViewController.cellIdentifier, forIndexPath: indexPath)
        let fontName = fontNames[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = getFont(atIndexPath: indexPath)
        cell.detailTextLabel?.text = fontName
        return cell
    }
   

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontNames.count
    }
    
    func getFont(atIndexPath indexPath : NSIndexPath) -> UIFont?{
        let fontName = fontNames[indexPath.row]
        return UIFont(name: fontName, size: cellPointSize)!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if showFavorites{
            fontNames = FavoriteList.sharedFavoriteList.favorites
            tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedFontCell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(selectedFontCell)
        let selectedFont = getFont(atIndexPath: indexPath!)!
        
        if segue.identifier == "ShowFontSize"{
        let fontSizeList = segue.destinationViewController as! FontSizesViewController
        fontSizeList.font = selectedFont
        fontSizeList.title = selectedFont.fontName
            
        }else{
        let fontInfo = segue.destinationViewController as! FontInfoViewController
        fontInfo.font = selectedFont
        fontInfo.title = selectedFont.fontName
        fontInfo.favorite = FavoriteList.sharedFavoriteList.favorites.contains(selectedFont.fontName)
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return showFavorites
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if !showFavorites{
            return
        }
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            let favorite = fontNames[indexPath.row]
            FavoriteList.sharedFavoriteList.removeFavorite(favorite)
            fontNames = FavoriteList.sharedFavoriteList.favorites
            tableView.deleteRowsAtIndexPaths([indexPath],
            withRowAnimation: UITableViewRowAnimation.Fade)
        }

    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
                FavoriteList.sharedFavoriteList.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
                fontNames = FavoriteList.sharedFavoriteList.favorites
    }
    
    
}
