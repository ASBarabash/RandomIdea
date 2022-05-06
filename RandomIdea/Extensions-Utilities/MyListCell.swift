//
//  MyListCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 06.05.2022.
//

import UIKit

class MyListCell: UITableViewCell {
    
    var myListLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myListLabel)
        
        configureMyLisLabel()
        configureInfoMyListLabel()
        setTitleOptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ text: String) {
        myListLabel.text = text
    }
    
    func configureMyLisLabel() {
        myListLabel.numberOfLines = 0
    }
    
    func configureInfoMyListLabel() {
        myListLabel.numberOfLines = 0
        myListLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleOptionConstraints() {
        myListLabel.translatesAutoresizingMaskIntoConstraints = false
        myListLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myListLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        myListLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        myListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        myListLabel.font = UIFont(name: "Menlo", size: 20)
        myListLabel.font = UIFont(name: myListLabel.font.fontName, size: 20)
//        myListLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
}

