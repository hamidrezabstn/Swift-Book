//
//  RootViewController.swift
//  Fonts
//
//  Created by Iransamaneh on 2/2/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit


class RootViewController: UITableViewController {
    
    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    private var favoritesList: FavoriteList!
    static let familyCell = "FamilyName"
    static let favoritesCell = "Favorites"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        familyNames = (UIFont.familyNames() as [String]).sort()
        favoritesList = FavoriteList.sharedFavoriteList
        
        let preferredFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func fontForDisplay(asIndexPath indexPath : NSIndexPath) -> UIFont? {
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNamesForFamilyName(familyName).first
            
            return (fontName != nil) ? UIFont(name: fontName!, size: cellPointSize) : nil
        } else {
            return nil
        }
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return favoritesList.favorites.isEmpty ? 1 : 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All" : "Favorite"
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(RootViewController.familyCell, forIndexPath: indexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.textLabel?.font = fontForDisplay(asIndexPath: indexPath)
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
            
        }else{
            return tableView.dequeueReusableCellWithIdentifier(RootViewController.favoritesCell, forIndexPath: indexPath)
        }
        
    }
    
}
