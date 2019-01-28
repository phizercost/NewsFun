//
//  ArticleWebUIViewController.swift
//  NewsFun
//
//  Created by Phizer Cost on 1/22/19.
//  Copyright © 2019 Phizer Cost. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebUIViewController: UIViewController {
    
    
    var article = Article()

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: article.url) {
            webView.load(URLRequest(url: url))
        }
        // Do any additional setup after loading the view.
    }
    
    
    

}
