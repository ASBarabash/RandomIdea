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
        label.font = UIFont.boldSystemFont(ofSize: 25)
        let categoryShuffled = category.shuffled()
        label.text = categoryShuffled.first
        
        
        return label
    }()
    
    private lazy var randomButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.gray()
        var attributes = AttributeContainer()
        
        
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        buttonConfiguration.baseForegroundColor = .black
        buttonConfiguration.attributedTitle = AttributedString("Следующий вариант", attributes: attributes)
        buttonConfiguration.background.image = UIImage(named: "Frame 1")
        
        
        
        //        buttonConfiguration.baseBackgroundColor = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 1)
        return UIButton(configuration: buttonConfiguration, primaryAction: UIAction { _ in
            if self.category.count == 0 {
                self.showAlertError(title: "Ваш список пустой", message: "Отредактируйте ваш список")
            } else {
                let categoryShuffled = self.category.shuffled()
                self.descriptionLabel.text = categoryShuffled.first
            }
        })
    }()
    
    var category : [String] {
        didSet {
            descriptionLabel.text = category.first
        }
    }
    var showInMyList = false

    init(description: [String]) {
        self.category = description
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 149/255, green: 208/255, blue: 241/255, alpha: 100)
        setupSubviews(descriptionLabel, randomButton)
        setConstraints()
        setupNavigationBar()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if showInMyList {
            category = StorageManager.shared.fetchList()
        }
    }
    
    private func setupNavigationBar() {
        if showInMyList {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Редактировать мой список",
                style: UIBarButtonItem.Style.plain,
                target: self,
                action: #selector(editMyList)
            )
        }
        navigationItem.backButtonTitle = "Назад"
    }
    
    @objc private func editMyList() {
        let myListVC = MyListViewController()
        navigationController?.pushViewController(myListVC, animated: true)
    }
    
    private func showAlertError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(okAction)
        present(alert, animated: true)
        
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
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        randomButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            randomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            randomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            randomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            randomButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

}
