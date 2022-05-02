//
//  DataManager.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let icon = ["🤔", "🍽", "👩🏻‍🏫"]
    
    let title = ["Развлечения", "Кулинария", "Образование"]
    
    let recreational = ["Учись писать неведущей рукой", "Иди в спортзал", "Посмотри сериал"]
    
    let cooking = ["Создай кулинарную книгу с любимыми рецептами", "Испеки пирожки себе и своему другу", "Составьте план питания на ближайшую неделю"]
    
    private init() {}
}
