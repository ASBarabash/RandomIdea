//
//  DescriptionViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        let categoryShuffled = category.shuffled()
        label.text = categoryShuffled.first
        
        
        return label
    }()
    
    private lazy var randomButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.filled()
        var attributes = AttributeContainer()
        
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        buttonConfiguration.attributedTitle = AttributedString("Следующий вариант", attributes: attributes)
//        buttonConfiguration.baseBackgroundColor = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 1)
        return UIButton(configuration: buttonConfiguration, primaryAction: UIAction { _ in
            let categoryShuffled = self.category.shuffled()
            self.descriptionLabel.text = categoryShuffled.first
        })
    }()

    //перебрасываем значение
    var category : [String]

    init(description: [String]) {
        self.category = description
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews(descriptionLabel, randomButton)
        setConstraints()

    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            
        ])
        randomButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            randomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            randomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            randomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)

        ])
    }

}
