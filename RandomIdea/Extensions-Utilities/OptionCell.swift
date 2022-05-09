//
//  OptionCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class OptionCell: UITableViewCell {
    
    var iconOptionLabel = UILabel()
    var titleOptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .blue
        backgroundView = UIImageView(image: UIImage(named: "Frame 1"))
        selectedBackgroundView = UIImageView(image: UIImage(named: "Frame 2"))
        
        
        addSubview(iconOptionLabel)
        addSubview(titleOptionLabel)
        
        configureIconOptionLabel()
        configureInfoOptionLabel()
        setIconOptionConstraints()
        setTitleOptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(idea: Idea) {
        iconOptionLabel.text = idea.icon
        titleOptionLabel.text = idea.title
    }
    
    func configureIconOptionLabel() {
        titleOptionLabel.numberOfLines = 0
    }
    
    func configureInfoOptionLabel() {
        titleOptionLabel.numberOfLines = 0
        titleOptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setIconOptionConstraints() {
        iconOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        iconOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.font = UIFont(name: iconOptionLabel.font.fontName, size: 50)
    }
    
    func setTitleOptionConstraints() {
        titleOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleOptionLabel.leadingAnchor.constraint(equalTo: iconOptionLabel.trailingAnchor, constant: 20).isActive = true
        titleOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleOptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        titleOptionLabel.font = UIFont(name: titleOptionLabel.font.fontName, size: 25)
        titleOptionLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
}
