//
//  ViewController.swift
//  DialigViewer
//
//  Created by Iransamaneh on 2/6/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    
    private var sections = [
        ["header": "First Witch",
        "content" : "Hey, when will the three of us meet up later?"],
        ["header" : "Second Witch",
        "content" : "When everything's straightened out."],
        ["header" : "Third Witch",
        "content" : "That'll be just before sunset."],
        ["header" : "First Witch",
        "content" : "Where?"],["header" : "Second Witch",
        "content" : "The dirt patch."],
        ["header" : "Third Witch",
        "content" : "I guess we'll see Mac there."]
    ]
    
    private let contentCellID = "Content"
    
    private let headerCellID = "Header"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    collectionView!.registerClass(ContentCellCollectionViewCell.self, forCellWithReuseIdentifier: contentCellID)
    collectionView!.registerClass(HeaderCell.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellID)
      
    var contentInset = collectionView!.contentInset
    contentInset.top = 20
    collectionView!.contentInset = contentInset
        
        let layout = collectionView!.collectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20)
        flow.headerReferenceSize = CGSizeMake(100, 25)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wordsInSection(sectionId secId :Int)->[String]{
        let content = sections[secId]["content"]!
        let spaces = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let words = content.componentsSeparatedByCharactersInSet(spaces)
        return words

     }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordsInSection(sectionId: section).count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let words = wordsInSection(sectionId: indexPath.section)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(contentCellID, forIndexPath: indexPath) as! ContentCellCollectionViewCell
        cell.maxWidth = collectionView.bounds.size.width
        cell.text = words[indexPath.row]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            
            if kind == UICollectionElementKindSectionHeader {
                let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellID, forIndexPath: indexPath) as! ContentCellCollectionViewCell
                cell.maxWidth = collectionView.bounds.size.width
                cell.text = sections[indexPath.section]["header"]
        return cell
            }
            abort()
            
    }
    
    
    

}

