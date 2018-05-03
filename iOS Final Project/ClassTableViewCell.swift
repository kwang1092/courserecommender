//
//  ClassTableViewCell.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/28/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    
    var classLabel: UILabel!
    var classRating: UILabel!
    var classProfessor: UILabel!
    var classDescription: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        classLabel = UILabel()
        classDescription = UITextField()
        classProfessor = UILabel()
        classRating = UILabel()
        
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        classDescription.translatesAutoresizingMaskIntoConstraints = false
        classProfessor.translatesAutoresizingMaskIntoConstraints = false
        classRating.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(classLabel)
        //contentView.addSubview(classDescription)
        contentView.addSubview(classProfessor)
        contentView.addSubview(classRating)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        //print (songLabel.intrinsicContentSize.width)
        NSLayoutConstraint.activate([
            classLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            classLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            classLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        NSLayoutConstraint.activate([
            classProfessor.leadingAnchor.constraint(equalTo: classLabel.leadingAnchor),
            classProfessor.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 8),
            //artistLabel.widthAnchor.constraint(equalToConstant: artistLabel.intrinsicContentSize.width),
            classProfessor.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            classRating.leadingAnchor.constraint(equalTo: classLabel.leadingAnchor),
            classRating.topAnchor.constraint(equalTo: classProfessor.bottomAnchor, constant: 8),
            classRating.heightAnchor.constraint(equalToConstant: 32)
            ])
        
//        NSLayoutConstraint.activate ([
//            classDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            classDescription.bottomAnchor.constraint(equalTo: classRating.bottomAnchor),
//            classDescription.heightAnchor.constraint(equalToConstant: 72),
//            classDescription.widthAnchor.constraint(equalToConstant: 72)
//            ])
        
        
        
        
        super.updateConstraints()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
