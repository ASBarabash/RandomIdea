//
//  ListOfOptionsViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class ListOfOptionsViewController: UIViewController {
    
//    private var categoryList: [Idea] = []
    private var categoryList = Idea.getIdeas()
    
    var tableView = UITableView()
    
    struct Cell {
        static let optionCell = "OptionCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        categoryList = Idea.getIdeas()
        
        
        setupNavigationBar()
        configureTableView()
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
//        tableView.backgroundColor = .systemGray
        tableView.register(OptionCell.self, forCellReuseIdentifier: Cell.optionCell)
        tableView.pin(to: view)
        
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
        
        
    }
    

}

extension ListOfOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.optionCell) as! OptionCell
        let idea = categoryList[indexPath.row]
        cell.set(idea: idea)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        if category.title == "Мой список" {
            let myList: [String] = StorageManager.shared.fetchList()
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
//        present(DescriptionViewController(), animated: true)
        
    }
    
    
}
