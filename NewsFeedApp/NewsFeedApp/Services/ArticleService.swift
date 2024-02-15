//
//  ArticleService.swift
//  NewsFeedApp
//
//  Created by singsys on 23/12/23.
//

import Foundation

protocol ArticleServiceProtocol {
    func getEverything(param: [String: Any]?, completion: @escaping([ArticleModal]) -> Void)
    func getTopHeadlines(param: [String: Any]?, completion: @escaping([ArticleModal]) -> Void)
    func getSources(param: [String: Any]?, completion: @escaping([SourcesModal]) -> Void)
    func showError(message: String?)
}

final class ArticleService: ArticleServiceProtocol {
    func getEverything(param: [String : Any]?, completion: @escaping ([ArticleModal]) -> Void) {
        Api.request(
            api: .everything,
            parameter: param,
            responseType: ArticleModal.self) { data in
                if data.status == .ok, let articles = data.articles {
                    completion(articles)
                } else {
                    self.showError(message: data.message)
                }
            }
    }
    
    func getTopHeadlines(param: [String : Any]?, completion: @escaping ([ArticleModal]) -> Void) {
        Api.request(
            api: .topHeadlines,
            parameter: param,
            responseType: ArticleModal.self) { data in
                if data.status == .ok, let articles = data.articles {
                    completion(articles)
                } else {
                    self.showError(message: data.message)
                }
            }
    }
    
    func getSources(param: [String : Any]?, completion: @escaping ([SourcesModal]) -> Void) {
        Api.request(
            api: .topHeadlinesSources,
            parameter: param,
            responseType: SourcesModal.self) { data in
                if data.status == .ok, let sources = data.sources {
                    completion(sources)
                } else {
                    self.showError(message: data.message)
                }
            }
    }
    
    func showError(message: String?) { }
    
}
