//
//  ABOperation.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import UIKit
typealias webServiceBlock = (_ operation : ABOperation ,Error?) ->Void


class ABOperation: Operation ,URLSessionDataDelegate{
    var _info : Dictionary<String,String> = [:]

     var _target : Any?
     var _urlString : String?
    var recievedData : NSMutableData?
    var downloadBlocks : webServiceBlock?
    func setUrl(urlString : String , info : Dictionary<String, String>, target : Any,downloadBlock : @escaping webServiceBlock) -> Void {
       downloadBlocks = downloadBlock
        _info = info
        _target = target
        _urlString = urlString
    }
    
    override func cancel() {
        
//        if let urlsess = urlSession   {
//            urlSession?.invalidateAndCancel()
//            
//        }
        super.cancel()
    }
    
    
    override func main() {
        if let urlStr = _urlString {
            let url = URL(string: _urlString!)
            var httpMethod = _info[Constant.HttpMethod]
            httpMethod = (httpMethod != nil) && !(httpMethod?.isEmpty)! ? httpMethod :Constant.TNHTTPMethodGet
            
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = httpMethod
            let urlConfig = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: urlConfig, delegate: self, delegateQueue: OperationQueue.main)
            let dataTask = urlSession.dataTask(with: urlRequest)
            dataTask.resume()
            urlSession.finishTasksAndInvalidate()
        }
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        recievedData = NSMutableData()
        completionHandler(.allow)
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        recievedData?.append(data)
        downloadBlocks!(self,nil)
    }
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        downloadBlocks!(self,error)
    }
}
