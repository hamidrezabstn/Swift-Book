//
//  ContentCellCollectionViewCell.swift
//  DialigViewer
//
//  Created by Iransamaneh on 2/6/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ContentCellCollectionViewCell: UICollectionViewCell {
    
    var label : UILabel!
    var text : String!{
        get{
            return label.text
        }
        set(newText){
            label.text = newText
            var newLabelFrame = label.frame
            var newContentframe = contentView.frame
            let textSize = self.dynamicType.sizeForContentString(newText, forMaxWidth: maxWidth)
            newLabelFrame.size = textSize
            newContentframe.size = textSize
            label.frame = newLabelFrame
            contentView.frame = newContentframe
        }
    }
    var maxWidth : CGFloat!
    
    
    class func sizeForContentString(s : String , forMaxWidth maxWidth : CGFloat) ->CGSize{
        
        let maxSize = CGSizeMake(maxWidth, 1000)
        let opts = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        let style = NSMutableParagraphStyle()
        
        style.lineBreakMode = NSLineBreakMode.ByCharWrapping
        let attributes = [NSFontAttributeName : defaultFont(),NSParagraphStyleAttributeName : style]
        
        let string = s as NSString
        
        let rect = string.boundingRectWithSize(maxSize, options: opts, attributes: attributes, context: nil)
        
        return rect.size
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel(frame: self.contentView.bounds)
        label.opaque = false
        label.backgroundColor =
            UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = self.dynamicType.defaultFont()
        contentView.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func defaultFont()->UIFont{
            return UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
    
    
}
