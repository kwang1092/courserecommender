//
//  SearchClassTableViewCell.swift
//  iOS Final Project
//
//  Created by Robert Li on 5/2/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit

class SearchClassTableViewCell: UITableViewCell {
    
    var classLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        classLabel = UILabel()
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(classLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            classLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            classLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            classLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        super.updateConstraints()
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 30
            frame.size.width -= 2 * 30
            
            super.frame = frame
        }
    }

}
