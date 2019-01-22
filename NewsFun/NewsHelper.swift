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
        }
    }
    
}
