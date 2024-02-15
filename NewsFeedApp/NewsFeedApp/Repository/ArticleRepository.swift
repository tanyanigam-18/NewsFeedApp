//
//  ArticleRepository.swift
//  NewsFeedApp
//
//  Created by singsys on 23/12/23.
//

import Foundation

protocol ArticleRepositoryProtocol {
    func getEverything(param: [String: Any]?, completion: @escaping([ArticleModal]) -> Void)
    func getTopHeadlines(param: [String: Any]?, completion: @escaping([ArticleModal]) -> Void)
    func getSources(param: [String: Any]?, completion: @escaping([SourcesModal]) -> Void)
}

final class ArticleRepository: ArticleRepositoryProtocol {
    private let services: ArticleServiceProtocol
    
    init(services: ArticleServiceProtocol = ArticleService()) {
        self.services = services
    }
    func getEverything(param: [String : Any]?, completion: @escaping ([ArticleModal]) -> Void) {
        services.getEverything(param: param, completion: completion)
    }
    
    func getTopHeadlines(param: [String : Any]?, completion: @escaping ([ArticleModal]) -> Void) {
        services.getTopHeadlines(param: param, completion: completion)
    }
    
    func getSources(param: [String : Any]?, completion: @escaping ([SourcesModal]) -> Void) {
        services.getSources(param: param, completion: completion)
    }

}
