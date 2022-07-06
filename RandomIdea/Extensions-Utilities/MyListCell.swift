//
//  MyListCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 06.05.2022.
//

import UIKit

class MyListCell: UITableViewCell {
    
    private let myListLabel = UILabel()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(
            red: 109/255,
            green: 183/255,
            blue: 224/255,
            alpha: 100
        )
        contentView.addSubview(myListLabel)
    
        configureInfoMyListLabel()
        setTitleOptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func set(_ text: String) {
        myListLabel.text = text
    }
    
    // MARK: - Private Methods
    private func configureInfoMyListLabel() {
        myListLabel.numberOfLines = 0
        myListLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setTitleOptionConstraints() {
        myListLabel.translatesAutoresizingMaskIntoConstraints = false
        myListLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        myListLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        myListLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        myListLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
//        myListLabel.font = UIFont(name: "Menlo", size: 20)
        myListLabel.font = UIFont(name: myListLabel.font.fontName, size: 20)

    }
}

