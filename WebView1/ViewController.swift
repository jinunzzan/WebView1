//
//  ViewController.swift
//  WebView1
//
//  Created by Eunchan Kim on 2022/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var destinationURL: String = "http://www.daum.net"
    
    @IBOutlet weak var webSearchBar: UISearchBar!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWebPage(to: destinationURL)
        webSearchBar.delegate = self
    }
    
    func openWebPage(to urlStr: String) {
        guard let url = URL(string: urlStr) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url:url)
        webView.load(request)
    }
    
    @IBAction func goBackButtonClicked(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func reloadButtonClicked(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func goForwardButtonClicked(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    


}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(to: searchBar.text!)
    }
}
