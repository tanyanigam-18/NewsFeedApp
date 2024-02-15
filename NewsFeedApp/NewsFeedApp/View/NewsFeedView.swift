//
//  NewsFeedView.swift
//  NewsFeedApp
//
//  Created by singsys on 22/12/23.
//

import SwiftUI
import Kingfisher

struct NewsFeedView: View {
    @StateObject var viewModel: ArticleViewModel = ArticleViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(viewModel.articles, id: \.id) { article in
                            NavigationLink(destination: NewsDetaiWebView(url: URL(string: article.url))) {
                                NewsItemComponent(title: article.title,
                                                  image: article.urlToImage,
                                                  text: article.description
                                )
                            }
                            .onAppear {
                                viewModel.loadMore(currentItem: article)
                            }
                            Divider()
                                .frame(height: 2)
                                .foregroundColor(Color.black)
                                .padding(.vertical, 2)
                        }
                    } header: {
                        VStack {
                            Picker("Custom Picker", selection: $viewModel.tag) {
                                Text("Top Headlines")
                                    .tag(0)
                                Text("Everything")
                                    .tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            if viewModel.tag == 1 {
                                Picker("Source Picker", selection: $viewModel.sourceId){
                                    ForEach(viewModel.sources, id: \.id) { source in
                                        Text(source.name)
                                            .tag(source.id)
                                    }
                                }
                            }
                        }
                        .background(Color.white)
                    }
                })
                .padding(.horizontal)
                .onAppear {
                    viewModel.onFocus()
                    viewModel.getSources()
                }
            }
            .navigationTitle("NEWS FEED")
        }
        .searchable(text: $viewModel.text)
    }
}

#Preview {
    NewsFeedView()
}

struct NewsItemComponent: View {
    let title: String
    let image: String?
    let text: String?
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            if let image {
                KFImage(URL(string: image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
            }
            if let text {
                Text(text)
                    .multilineTextAlignment(.leading)
            }
        })
        .foregroundColor(Color.black)
    }
}
