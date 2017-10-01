//
//  DetailViewController.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 01/10/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webViewNews: UIWebView!
    var newsParserModel = NewsParserModel()
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        if let url = newsParserModel.url {
            webViewNews.loadRequest(URLRequest(url: URL(string: newsParserModel.url!)!))
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
