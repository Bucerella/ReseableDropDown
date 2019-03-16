//
//  CardCell.swift
//  DropDown
//
//  Created by Buse ERKUŞ on 16.03.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell{
    
    var cellData:CellData!{
        didSet{
            featureImage.image = cellData.featureImage
            titleLabel.text = cellData.title.uppercased()
        }
    }
   fileprivate var featureImage: UIImageView = {
       let iv = UIImageView()
       iv.translatesAutoresizingMaskIntoConstraints = false
       iv.contentMode = .scaleAspectFill
       iv.layer.masksToBounds = true
       iv.layer.cornerRadius = 2
       return iv
    }()
    fileprivate var titleLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .blue
       label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
       return label
    }()
    fileprivate var infoText: UITextView = {
       let tf = UITextView()
       tf.translatesAutoresizingMaskIntoConstraints = false
       tf.font = UIFont.systemFont(ofSize: 13, weight: .medium)
       tf.textColor = .black
       tf.isEditable = false
       tf.text = "Resealable Dropdown Example is very easy..."
       return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        backgroundColor = .clear
        setupConstrains()
    }
  
    fileprivate func setupConstrains(){
        contentView.addSubview(featureImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoText)
        
        featureImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        featureImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        featureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        featureImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: featureImage.bottomAnchor, constant: 8).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: featureImage.centerXAnchor).isActive = true
        //        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    
        infoText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -1).isActive = true
        infoText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        infoText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        infoText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8 ).isActive = true
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
