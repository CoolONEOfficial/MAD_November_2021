//
//  WebAdapterView.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import SwiftUI
import WebKit

protocol CheckProtocol {
    func check(_ url: URL?) -> Bool
}

struct WebAdapterView: UIViewRepresentable {

    typealias UIViewType = WKWebView
    
    let url: String
    
    var checks: [CheckProtocol]
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest.init(url: .init(string: url)!))
        view.navigationDelegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebAdapterView
        
        init(_ parent: WebAdapterView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(parent.checks.contains(where: { $0.check(navigationAction.request.url) == false }) ? .cancel : .allow)
        }
    }
}
