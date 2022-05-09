//
//  MyListCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 06.05.2022.
//

import UIKit

class MyListCell: UITableViewCell {
    
    private let myListLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 149/255, green: 208/255, blue: 241/255, alpha: 100)
        contentView.addSubview(myListLabel)
    
        configureInfoMyListLabel()
        setTitleOptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ text: String) {
        myListLabel.text = text
    }
    
    func configureInfoMyListLabel() {
        myListLabel.numberOfLines = 0
        myListLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleOptionConstraints() {
        myListLabel.translatesAutoresizingMaskIntoConstraints = false
//        myListLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myListLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        myListLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
////        myListLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        myListLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        myListLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
////        myListLabel.font = UIFont(name: "Menlo", size: 20)
        myListLabel.font = UIFont(name: myListLabel.font.fontName, size: 20)
////        myListLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
}

