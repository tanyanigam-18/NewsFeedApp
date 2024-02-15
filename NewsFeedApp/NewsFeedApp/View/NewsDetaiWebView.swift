//
//  NewsDetaiWebView.swift
//  NewsFeedApp
//
//  Created by singsys on 23/12/23.
//

import SwiftUI
import UIKit
import WebKit


struct NewsDetaiWebView: UIViewRepresentable {
    let url: URL?
    
    // MARK: - Load WebView
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.backgroundColor = .clear
        guard let url = url else {
            return webView
        }
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    // MARK: - Not required
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
