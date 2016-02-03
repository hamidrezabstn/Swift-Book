//
//  FavoriteList.swift
//  Fonts
//
//  Created by Iransamaneh on 2/2/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import Foundation
import UIKit


class FavoriteList {
    
    static let sharedFavoriteList = FavoriteList()
    private(set) var favorites : [String]!
    private let favoriteIdentifier = "favorites"
    
    init(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedFavorite = defaults.objectForKey(favoriteIdentifier) as? [String]
        
        favorites = (storedFavorite != nil) ? storedFavorite! : []
    }
    
    func addFavorites (fontName : String){
        if !favorites.contains(fontName){
        favorites.append(fontName)
        saveFavorites()
        }
    }
    
    func removeFavorite(fontName : String){
        if let index = favorites.indexOf(fontName){
            favorites.removeAtIndex(index)
            saveFavorites()
        }
    }
    
    func saveFavorites(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(favorites, forKey: favoriteIdentifier)
        defaults.synchronize()
    }
    
}