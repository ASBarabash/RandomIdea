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
        
        myList = StorageManager.shared.fetchList()
//        if let saveMyList = UserDefaults.standard.array(forKey: "MyListKey") as? [String] {
//            self.myList = saveMyList
//        }

//        view.backgroundColor = .white
        setupNavigationBar()
        configureTableView()
        
        
    }
    
//    func layout() {
//        [tableView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//    }
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 50
        tableView.register(MyListCell.self, forCellReuseIdentifier: "MyListCell")
        tableView.pin(to: view)
        
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMyList))
        
    
    }
    
    @objc private func addMyList() {
        showAlert(with: "Мой список", and: "Введите ваш вариант")
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let list = alert.textFields?.first?.text, !list.isEmpty else { return }
            self.save(list)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addTextField { textField in
            textField.placeholder = "Мой вариант"
        }
        present(alert, animated: true)
    }
    
    private func save(_ list: String) {
        StorageManager.shared.save(myVersion: list)
        myList.append(list)
        tableView.reloadData()
    }
}



extension MyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StorageManager.shared.deleteList(at: indexPath.row)
            myList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListCell") as! MyListCell
        let myList = myList[indexPath.row]
//        cell.textLabel?.text = myList
        cell.set(myList)

        return cell
    }
}


