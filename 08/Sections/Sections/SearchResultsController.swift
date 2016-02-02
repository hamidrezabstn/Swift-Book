//
//  SearchResultsController.swift
//  Sections
//
//  Created by Iransamaneh on 2/1/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController , UISearchResultsUpdating {

    let sectionId = "SectionID"
    var names : [String:[String]]!
    var keys : [String]!
    var filteredNames : [String] = []
    
    private let longNameSize = 6
    private let shortIndex = 1
    private let longIndex = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionId)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return filteredNames.count
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!
        let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
        
        filteredNames.removeAll(keepCapacity: true)
        if !searchTerm.isEmpty {
            let filter: String -> Bool = { name in
                // Filter out long or short names depending on which
                // scope button is selected.
                let nameLength = name.characters.count
                if (buttonIndex == self.shortIndex
                && nameLength >= self.longNameSize)
                || (buttonIndex == self.longIndex
                && nameLength < self.longNameSize) {
                return false
                }
                let range = name.rangeOfString(searchTerm,
                options: NSStringCompareOptions.CaseInsensitiveSearch)
                return range != nil
        }
            for key in keys {
                    let namesForKey = names[key]!
                    let matches = namesForKey.filter(filter)
                    filteredNames += matches
            }
        }
        tableView.reloadData()
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionId, forIndexPath: indexPath)
        cell.textLabel?.text = filteredNames[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
