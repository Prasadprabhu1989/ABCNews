//
//  DownloadManager.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import Foundation

typealias webServiceCompletion = (ABOperation?,Error?) ->Void
class DownloadManager: NSObject {
    static let sharedManager = DownloadManager()
    static let operationQueues  = OperationQueue()
    
    func cancelAllOperationsForTarget(target : Any, url : String)  {
        let operations = DownloadManager.operationQueues.operations as! [ABOperation]
        for op in operations{
            if op._urlString == url {
                op._urlString = nil
                op.cancel()
            }
        
        }
    }
    
//    func setUrl(urlString : String , info : Dictionary<String, String>, target : Any,downloadBlock : @escaping webServiceBlock)
    func downloadUrl(urlString: String , info : Dictionary<String, String>,target : Any,completion : @escaping webServiceBlock)  {
        cancelAllOperationsForTarget(target: target, url: urlString)
        let operationsss = ABOperation()
        operationsss.setUrl(urlString: urlString, info: info, target: target, downloadBlock:completion)
        DownloadManager.operationQueues.addOperation(operationsss)
    }
}
