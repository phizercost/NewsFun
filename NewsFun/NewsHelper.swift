//
//  NewsHelper.swift
//  NewsFun
//
//  Created by Phizer Cost on 1/22/19.
//  Copyright © 2019 Phizer Cost. All rights reserved.
//

import Foundation
import Alamofire

class NewsHelper {
    
    
    func  getArticles() {
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=35d7fae559864651b2a40da1db343491").responseJSON { (response) in
            print(response)
            
            if let json = response.result.value as? [String: Any] {
                if let jsonArticles = json["articles"] as? [[String:Any]] {
                    var articles  = [Article]()
                    for jsonArticle in jsonArticles {
                        guard let title = jsonArticle["title"] as? String , let urlToImage = jsonArticle["urlToImage"] as? String , let url = jsonArticle["url"] as? String , let description = jsonArticle["description"] as? String
                        else {
                              continue
                        }
                        let article = Article()
                        article.title = title
                        article.url = url
                        article.urlToImage = urlToImage
                        article.description = description
                        articles.append(article)
                    }
                }
            }
        }
    }
    
}


class Article {
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category = ""
}
