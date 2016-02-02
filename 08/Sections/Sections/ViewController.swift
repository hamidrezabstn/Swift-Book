//
//  ViewController.swift
//  Sections
//
//  Created by Iransamaneh on 2/1/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {

    let sectionId = "SectionID"
    @IBOutlet weak var sectionTable: UITableView!
    private var names : [String : [String]]!
    private var keys : [String]!
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sectionTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionId)
        
        let path = NSBundle.mainBundle().URLForResource("sortednames", withExtension: "plist")
        let data = NSDictionary(contentsOfURL: path!)
        names = data as! [String:[String]]!
        keys = data?.allKeys as! [String]!
        keys.sortInPlace()
        
        
        let resultController = SearchResultsController()
        resultController.names = names
        resultController.keys = keys
        
        searchController = UISearchController(searchResultsController: resultController)
        
        let searchBar = searchController.searchBar
        
        searchBar.scopeButtonTitles = ["All","Short","Long"]
        searchBar.placeholder = "Enter search term here"
        searchBar.sizeToFit()
        sectionTable.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultController
        
        sectionTable.sectionIndexBackgroundColor = UIColor.blackColor()
        sectionTable.sectionIndexTrackingBackgroundColor = UIColor.darkGrayColor()
        sectionTable.sectionIndexColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let sectionArray = names[key]!
        return sectionArray.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return keys[section]
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = sectionTable.dequeueReusableCellWithIdentifier(sectionId, forIndexPath: indexPath) 
        
        let key = keys[indexPath.section]
        let sectionArray = names[key] as [String]!
        
        cell.textLabel?.text = sectionArray[indexPath.row]
        
        return cell
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
    }

}

