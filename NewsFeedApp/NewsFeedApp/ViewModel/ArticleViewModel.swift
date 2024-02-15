//
//  ArticleViewModel.swift
//  NewsFeedApp
//
//  Created by singsys on 23/12/23.
//

import Foundation
import SwiftUI

class ArticleViewModel: ObservableObject {
    @Published var tag: Int = 0 {
        didSet {
            onFocus()
        }
    }
    @Published var sourceId: String = "abc-news" {
        didSet {
            if tag == 1 {
                page = 1
                self.getEveryThing()
            }
        }
    }
    @Published var sources: [SourcesModal] = []
    @Published var text: String = "" {
        didSet {
            onFocus()
        }
    }
    @Published var page: Int = 1
    @Published var articles: [ArticleModal] = []

    var repository: ArticleRepository = ArticleRepository()
    
    // MARK: - PAGINATION FOR TOP HEADLINES

    func loadMore(currentItem item: ArticleModal) {
        let thresholdIndex = articles.index(articles.endIndex, offsetBy: -1)
        let index = articles.firstIndex(where: { data in data.title == item.title })
        if thresholdIndex == index {
            page += 1
            if tag == 1 {
                getEveryThing()
            } else {
                getTopHeadlines()
            }
        }
    }

    func onFocus() {
        page = 1
        if tag == 1 {
            getEveryThing()
        } else {
            getTopHeadlines()
        }
    }

    func getTopHeadlines() {
        let params = NSMutableDictionary()
        params.setValue("in", forKey: "country")
        params.setValue(text, forKey: "q")
        params.setValue(10, forKey: "pageSize")
        params.setValue(page, forKey: "page")
        repository.getTopHeadlines(param: params as? [String : Any]) { data in
            if self.page == 1 {
                self.articles = data
            } else {
                self.articles.append(contentsOf: data)
            }
        }
    }
    func getEveryThing() {
      let params = NSMutableDictionary()
        params.setValue(text, forKey: "q")
        params.setValue(10, forKey: "pageSize")
        params.setValue(page, forKey: "page")
        params.setValue(sourceId, forKey: "sources")
        repository.getEverything(param: params as? [String : Any]) { data in
            if self.page == 1 {
                self.articles = data
            } else {
                self.articles.append(contentsOf: data)
            }
        }
    }
    func getSources() {
        repository.getSources(param: nil) { data in
            self.sources = data
            self.sourceId = data.first?.id ?? ""
        }
    }
}
