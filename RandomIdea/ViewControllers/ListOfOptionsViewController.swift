//
//  ListOfOptionsViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class ListOfOptionsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let tableView = UITableView()
    private let categoryList = Idea.getIdeas()
    
    // MARK: - Struct Cell
    struct Cell {
        static let optionCell = "OptionCell"
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureTableView()
    }
    
    // MARK: Private Methods
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.pin(to: view)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(
            red: 109/255,
            green: 183/255,
            blue: 224/255,
            alpha: 100
        )
        tableView.register(OptionCell.self, forCellReuseIdentifier: Cell.optionCell)
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        title = "Random Idea"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = "Назад"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(
            red: 109/255,
            green: 183/255,
            blue: 224/255,
            alpha: 100
        )
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    

}

// MARK: - UITableViewDataSource
extension ListOfOptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.optionCell) as! OptionCell
        let idea = categoryList[indexPath.row]
        cell.set(idea: idea)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ListOfOptionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        if category.title == "Мой список" {
            let myList = StorageManager.shared.fetchList()
            let descriptionVC = DescriptionViewController(description: myList)
            descriptionVC.showInMyList = true
            navigationController?.pushViewController(descriptionVC, animated: true)
        } else {
            var myList: [String] = []
            
            category.category.forEach { item in
                myList.append(item.discription)
            }
            
            let descriptionVC = DescriptionViewController(description: myList)
            navigationController?.pushViewController(descriptionVC, animated: true)
        }
    }
    
}
