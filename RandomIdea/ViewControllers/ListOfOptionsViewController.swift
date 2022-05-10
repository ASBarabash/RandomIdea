//
//  ListOfOptionsViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class ListOfOptionsViewController: UIViewController {
    
    private let categoryList = Idea.getIdeas()
    
    private let tableView = UITableView()
    
    struct Cell {
        static let optionCell = "OptionCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        configureTableView()
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.pin(to: view)
        setTableViewDelegates()
        tableView.rowHeight = 100
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(red: 149/255, green: 208/255, blue: 241/255, alpha: 100)
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
        
        navBarAppearance.backgroundColor = UIColor(red: 149/255, green: 208/255, blue: 241/255, alpha: 100)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .systemBlue
        
        
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
//        present(DescriptionViewController(), animated: true)
        
    }
    
    
}
