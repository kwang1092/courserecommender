//
//  ClassTableViewCell.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/28/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit
//import FaveButton

class ClassTableViewCell: UITableViewCell {
    
    var classDescriptor: UILabel!
    var professorDescriptor: UILabel!
    var ratingDescriptor: UILabel!
    var classLabel: UILabel!
    var classRating: UILabel!
    var classProfessor: UILabel!
    //var saveButton: TTAnimationButton!
    //var classDescription: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        classLabel = UILabel()
        //classDescription = UITextField()
        classProfessor = UILabel()
        classRating = UILabel()
        
        classDescriptor = UILabel()
        professorDescriptor = UILabel()
        ratingDescriptor = UILabel()
        classDescriptor.text = "Class:"
        professorDescriptor.text = "Professor:"
        ratingDescriptor.text = "Rating:"
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        //classDescription.translatesAutoresizingMaskIntoConstraints = false
        classProfessor.translatesAutoresizingMaskIntoConstraints = false
        classRating.translatesAutoresizingMaskIntoConstraints = false
        
        classDescriptor.translatesAutoresizingMaskIntoConstraints = false
        professorDescriptor.translatesAutoresizingMaskIntoConstraints = false
        ratingDescriptor.translatesAutoresizingMaskIntoConstraints = false
        
        
//        saveButton = TTAnimationButton(type: .system)
//        saveButton.setImage(UIImage (named: "heart.png"), for: .normal)
//        //saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(classLabel)
        //contentView.addSubview(classDescription)
        contentView.addSubview(classProfessor)
        contentView.addSubview(classRating)
        
        contentView.addSubview(classDescriptor)
        contentView.addSubview(professorDescriptor)
        contentView.addSubview(ratingDescriptor)
        //contentView.addSubview(saveButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        //print (songLabel.intrinsicContentSize.width)
        
        NSLayoutConstraint.activate([
            classDescriptor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            classDescriptor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            classDescriptor.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            professorDescriptor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            professorDescriptor.topAnchor.constraint(equalTo: classDescriptor.bottomAnchor, constant: 8),
            professorDescriptor.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            ratingDescriptor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            ratingDescriptor.topAnchor.constraint(equalTo: professorDescriptor.bottomAnchor, constant: 8),
            ratingDescriptor.heightAnchor.constraint(equalTo: classRating.heightAnchor)
            ])
        
//        let tmp = max (classDescriptor.trailingAnchor, professorDescriptor.trailingAnchor, ratingDescriptor.trailingAnchor)
    
        NSLayoutConstraint.activate([
            classLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            classLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            classLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        NSLayoutConstraint.activate([
            classProfessor.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            classProfessor.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 8),
            //artistLabel.widthAnchor.constraint(equalToConstant: artistLabel.intrinsicContentSize.width),
            classProfessor.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        NSLayoutConstraint.activate([
            classRating.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            classRating.topAnchor.constraint(equalTo: classProfessor.bottomAnchor, constant: 8),
            classRating.heightAnchor.constraint(equalToConstant: 16)
            ])
        
//        NSLayoutConstraint.activate([
//            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            saveButton.topAnchor.constraint(equalTo: classDescriptor.topAnchor, constant: 24),
//            saveButton.heightAnchor.constraint(equalToConstant: 50)
//            ])
        
        
        
        
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
