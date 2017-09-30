//
//  Constant.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import Foundation
class Constant {
    static let url = "https://newsapi.org/v1/articles?source=abc-news-au&sortBy=top&apiKey=629e2196bc7a46e68b829a998fcb02d1"
    static let HttpMethod = "httpMethod"
    static let TNHTTPMethodGet    = "GET";
    static let TNHTTPMethodPost   = "POST";
   static let TNHTTPMethodPut    =  "PUT";
    static let TNHTTPMethodDelete = "DELETE";
   static let TNHTTPBodyKey      = "httpBody";
    static let TNEmptyString      = "";
}

class TSCWSErrorCodes: NSObject {
    static let NoInternetWork = 100
}

