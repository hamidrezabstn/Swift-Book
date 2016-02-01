//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by Iransamaneh on 1/31/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    var name : String = ""{
        didSet{
            if name != oldValue {
                nameLabel.text = name
            }
        }
    }
    var color : String = ""{
        didSet{
            if color != oldValue {
                colorLabel.text = color
            }
        }
    }
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var colorLabel : UILabel!
    
    /*override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRect(x: 0, y: 5, width: 70, height: 15)
        let nameMarker = UILabel(frame: nameLabelRect)
        
        nameMarker.text = "Name : "
        nameMarker.textAlignment = .Right
        nameMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(nameMarker)
        
        let colorLabelRect = CGRect(x: 0, y: 26, width: 70, height: 15)
        let colorMarker = UILabel(frame: colorLabelRect)
        
        colorMarker.text = "Color :"
        colorMarker.textAlignment = .Right
        colorMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(colorMarker)
        
        let nameRect = CGRect(x: 80, y: 5, width: 200, height: 15)
        nameLabel = UILabel(frame: nameRect)
        contentView.addSubview(nameLabel)
        
        let labelRect = CGRect(x: 80, y: 25, width: 200, height: 15)
        colorLabel = UILabel(frame: labelRect)
        contentView.addSubview(colorLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
