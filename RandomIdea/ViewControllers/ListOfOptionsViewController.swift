//
//  ListOfOptionsViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import UIKit

class ListOfOptionsViewController: UIViewController {
    
    private let categoryList = Idea.getIdeas()
    var tableView = UITableView()
    
    struct Cell {
        static let optionCell = "OptionCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureTableView()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
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
//        let destinationVC = DescriptionViewController()
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.category = categoryList[indexPath.row].category.first
//        }
//        let description = categoryList[indexPath.row]
//        performSegue(withIdentifier: "SecondViewController", sender: description)
        navigationController?.pushViewController(DescriptionViewController(), animated: true)
//        present(DescriptionViewController(), animated: true)
        
    }
    
    
}
