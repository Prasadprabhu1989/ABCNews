//
//  NewsModel.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import Foundation
class NewsModel: NSObject {
    static let newsModel = NewsModel()
    var author  : String? = ""
    var title : String? = ""
    var descriptions : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    override init() {
        super.init()
    }
    func setArray(dict : [String:Any]) -> NewsModel {
    
        
        author = dict["author"] as? String
        title = dict["title"]! as? String
        descriptions = dict["description"] as? String
        url = dict["url"] as? String
        urlToImage = dict["urlToImage"] as? String
        publishedAt = dict["publishedAt"] as? String
        return self
    }
    
    }
