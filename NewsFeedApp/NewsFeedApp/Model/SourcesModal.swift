//
//  SourcesModal.swift
//  NewsFeedApp
//
//  Created by singsys on 23/12/23.
//

import Foundation

// MARK: - Source
struct SourcesModal: Codable {
    let id, name, description: String
    let url: String
    let category: Category
    let language, country: String
}

enum Category: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
