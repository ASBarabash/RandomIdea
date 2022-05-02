//
//  OptionCell.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class OptionCell: UITableViewCell {
    
    var iconOptionLabel = UILabel()
    var infoOptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconOptionLabel)
        addSubview(infoOptionLabel)
        
        configureIconOptionLabel()
        configureInfoOptionLabel()
        setIconOptionConstraints()
        setInfoOptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureIconOptionLabel() {
        infoOptionLabel.numberOfLines = 0
    }
    
    private func configureInfoOptionLabel() {
        infoOptionLabel.numberOfLines = 0
        infoOptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setIconOptionConstraints() {
        iconOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconOptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        iconOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setInfoOptionConstraints() {
        iconOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconOptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        infoOptionLabel.leadingAnchor.constraint(equalTo: iconOptionLabel.trailingAnchor, constant: 20).isActive = true
        iconOptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        iconOptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
