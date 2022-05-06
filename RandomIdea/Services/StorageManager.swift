//
//  StorageManager.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 06.05.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let myListKey = "MyListKey"
    
    private init() {}
    
    func save(myVersion: String) {
        var myVersions = fetchList()
        myVersions.append(myVersion)
        userDefaults.set(myVersions, forKey: myListKey)
    }
    
    func fetchList() -> [String] {
        if let myVersion = userDefaults.value(forKey: myListKey) as? [String] {
            return myVersion
        }
        return []
    }
    
    func deleteList(at index: Int) {
        var myVersions = fetchList()
        myVersions.remove(at: index)
        userDefaults.set(myVersions, forKey: myListKey)
    }
}
