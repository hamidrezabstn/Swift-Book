//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by Iransamaneh on 2/5/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font : UIFont!
    var favorite : Bool = false
    
    @IBOutlet weak var fontSampleLabel:UILabel!
    @IBOutlet weak var fontSizeSlider:UISlider!
    @IBOutlet weak var fontSizeLabel:UILabel!
    @IBOutlet weak var favoriteSwitch:UISwitch!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv"
            + "WwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.on = FavoriteList.sharedFavoriteList.favorites.contains(font.fontName)
        
    }
    
    @IBAction func slideFontSize(sender : UISlider){
        let newFontSize = roundf(fontSizeSlider.value)
        fontSizeLabel.text = "\(Int(newFontSize))"
        fontSampleLabel.font = font.fontWithSize(CGFloat(newFontSize))
    }
    @IBAction func toggleFavorites(sender : UISwitch){
        let switchState = sender.on
        if switchState {
            FavoriteList.sharedFavoriteList.addFavorites(font.fontName)
        }else{
            FavoriteList.sharedFavoriteList.removeFavorite(font.fontName)            
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
