//
//  APIManager.swift
//  NewsFeedApp
//
//  Created by singsys on 22/12/23.
//

import SwiftUI
import Alamofire

enum APIManager {
    case everything
    case topHeadlines
    case topHeadlinesSources
}

extension APIManager {
    var url: String {
        var path = ""
        switch self {
        case .everything:
            path = "everything"
        case .topHeadlines:
            path = "top-headlines"
        case .topHeadlinesSources:
            path = "top-headlines/sources"
        }
        return BASE_URL + path
    }
    var method: HTTPMethod {
        switch self {
        case .everything, .topHeadlines, .topHeadlinesSources:
            return .get
        }
    }
}
