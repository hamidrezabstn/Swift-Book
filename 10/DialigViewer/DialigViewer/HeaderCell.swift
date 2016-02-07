//
//  HeaderCell.swift
//  DialigViewer
//
//  Created by Iransamaneh on 2/6/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class HeaderCell: ContentCellCollectionViewCell {


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.5, alpha: 0.8)
        label.textColor = UIColor.blackColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override class func defaultFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    }

}
