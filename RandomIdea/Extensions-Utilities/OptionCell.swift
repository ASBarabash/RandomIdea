//
//  OptionCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class OptionCell: UITableViewCell {
    
    // MARK: - Private Properties
    private let iconOptionLabel = UILabel()
    private let titleOptionLabel = UILabel()
    
    //MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundView = UIImageView(image: UIImage(named: "Frame 3"))
        selectedBackgroundView = UIImageView(image: UIImage(named: "Frame 4"))
        
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
    
    // MARK: - Public Methods
    func set(idea: Idea) {
        iconOptionLabel.text = idea.icon
        titleOptionLabel.text = idea.title
    }
    
    // MARK: - Private Methods
    private func configureIconOptionLabel() {
        titleOptionLabel.numberOfLines = 0
    }
    
    private func configureInfoOptionLabel() {
        titleOptionLabel.numberOfLines = 0
        titleOptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setIconOptionConstraints() {
        iconOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconOptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        iconOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.font = UIFont(name: iconOptionLabel.font.fontName, size: 50)
    }
    
    private func setTitleOptionConstraints() {
        titleOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleOptionLabel.leadingAnchor.constraint(equalTo: iconOptionLabel.trailingAnchor, constant: 10).isActive = true
        titleOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleOptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        titleOptionLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
}
