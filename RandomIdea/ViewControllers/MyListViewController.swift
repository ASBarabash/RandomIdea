//
//  MyListViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 03.05.2022.
//

import UIKit

class MyListViewController: UIViewController {
    
    let tableView = UITableView()
    var myList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let saveMyList = UserDefaults.standard.array(forKey: "MyListKey") as? [String] {
            self.myList = saveMyList
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MyListViewController.description())
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        
        
    }
    
    func layout() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MyListViewController: UITableViewDelegate {
    
}

extension MyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyListViewController.description()) ?? UITableViewCell()
        let item = myList[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
