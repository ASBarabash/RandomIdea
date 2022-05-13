//
//  Model.swift
//  RandomIdea
//
//  Created by Alexandr Barabash on 02.05.2022.
//

import Foundation

struct Idea {
    let icon: String
    let title: String
    let category: [Category]
}

struct Category {
    let discription: String
}

extension Idea {
    static func getIdeas() -> [Idea] {
        var idea: [Idea] = []
        let iterations = DataManager.shared.title.count - 1
        
        for index in 0...iterations {
            switch index {
            case 0:
                let item = Idea(
                    icon: DataManager.shared.icon[index],
                    title: DataManager.shared.title[index],
                    category: Category.getEntertainment()
                )
                idea.append(item)
            case 1:
                let item = Idea(
                    icon: DataManager.shared.icon[index],
                    title: DataManager.shared.title[index],
                    category: Category.getRecipes()
                )
                idea.append(item)
            case 2:
                let item = Idea(
                    icon: DataManager.shared.icon[index],
                    title: DataManager.shared.title[index],
                    category: Category.getSkills()
                )
                idea.append(item)
            default:
                let item = Idea(
                    icon: DataManager.shared.icon[index],
                    title: DataManager.shared.title[index],
                    category: Category.getCompanyEntertainment()
                )
                idea.append(item)
            }
        }
        return idea
    }
    
}

extension Category {
    static func getEntertainment() -> [Category] {
        var category: [Category] = []
        let iterations = DataManager.shared.recreational.count - 1
        
        for index in 0...iterations {
            let recreational = Category(discription: DataManager.shared.recreational[index])
            category.append(recreational)
        }
        return category
    }
    
    static func getRecipes() -> [Category] {
        var category: [Category] = []
        let iterations = DataManager.shared.cooking.count - 1
        
        for index in 0...iterations {
            let cooking = Category(discription: DataManager.shared.cooking[index])
            category.append(cooking)
        }
        return category
    }
    
    static func getSkills() -> [Category] {
        var category: [Category] = []
        let iterations = DataManager.shared.education.count - 1
        
        for index in 0...iterations {
            let education = Category(discription: DataManager.shared.education[index])
            category.append(education)
        }
        return category
    }
    
    static func getCompanyEntertainment() -> [Category] {
        var category: [Category] = []
        let iterations = DataManager.shared.company.count - 1
        
        for index in 0...iterations {
            let company = Category(discription: DataManager.shared.company[index])
            category.append(company)
        }
        return category
    }
    
}

