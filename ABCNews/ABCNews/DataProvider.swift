//
//  DataProvider.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import Foundation
class DataProvider {
    static let sharedProvider = DataProvider()
    func getNewsData(target : Any,withCompletion:@escaping (_ newsModel : NewsModel , _ error : Any) -> Void) {
        DownloadManager.sharedManager.downloadUrl(urlString: Constant.url, info: [Constant.HttpMethod : Constant.TNHTTPMethodGet], target: target) { (operation, error) in
             var newsModel = NewsModel()
            if let error = error {
               
                withCompletion(newsModel,error)
            }
            else{
                do {
                  
//                    let parsedData  = try JSONSerialization.data(withJSONObject: operation.recievedData, options: [])  as? Dictionary<String,AnyObject>
                    var parsedData = try JSONSerialization.jsonObject(with: operation.recievedData! as Data, options: []) as!  [String: Any]
                    print("Parserdcit:\(parsedData)")
                    let arr  = parsedData["articles"] as! Array<[String:Any]>
                    
                    
                    newsModel = newsModel.setArray(arr: arr)
                    withCompletion(newsModel,[:])
                    
//                    var news = [NewsModel]()
//                    for dict in arr{
//                        var newsModel = NewsModel()
//                        newsModel = newsModel.setArray(dict: dict)
//                        news.append(newsModel)
//                        
////                        newsModel = newsModel.initWithDict(dict: dict)
//                    }
                    
                }
                catch{
                    
                }
            }
            
            }
        }
    }


//extension  Error {
//    func errorCode(code : Int) -> Error {
//        var localizedDescription : String
//        switch code {
//        case TSCWSErrorCodes.NoInternetWork:
//            return NSLocalizedString("NetworkError", comment: "Error description") as! Error
//            
//            
//            break
//            
//        default:
//            break
//            
//        }
//    }
//}




