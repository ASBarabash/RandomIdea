//
//  MyListViewController.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 03.05.2022.
//

import UIKit

class MyListViewController: UIViewController {
    
    // MARK: Private Properties
    private let tableView = UITableView()
    private var myList: [String] = []
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        myList = StorageManager.shared.fetchList()

        setupNavigationBar()
        configureTableView()
        
    }
    
    // MARK: Private Methods
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.pin(to: view)
        tableView.register(MyListCell.self, forCellReuseIdentifier: "MyListCell")
        tableView.backgroundColor = UIColor(
            red: 109/255,
            green: 183/255,
            blue: 224/255,
            alpha: 100
        )
        
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        title = "Мой список идей"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMyList))
        editButtonItem.title = "Ред."
        navigationItem.rightBarButtonItems = [addButton, editButtonItem]
        
    
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
            textField.autocapitalizationType = .sentences
        }
        present(alert, animated: true)
    }
    
    private func save(_ list: String) {
        StorageManager.shared.save(myVersion: list)
        myList.append(list)
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate
extension MyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListCell") as! MyListCell
        let myList = myList[indexPath.row]
        cell.set(myList)
        
        return cell
    }
}

// MARK: UITableViewDelegate
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
        editButtonItem.title = editing ? "Готово" : "Ред."
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = UIColor.clear
        }
}
