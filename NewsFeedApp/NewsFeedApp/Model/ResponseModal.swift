//
//  ResponseModal.swift
//  NewsFeedApp
//
//  Created by singsys on 22/12/23.
//

import Foundation

enum Status: String, Codable {
    case ok = "ok"
    case error = "error"
}

struct ResponseModal<T: Decodable>: Decodable {
    let status: Status
    let totalResults: Int?
    let code: String?
    let message: String?
    let articles: [T]?
    let sources: [T]?
}
