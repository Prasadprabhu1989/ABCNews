//
//  CustomCell.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageViewNews: UIImageView!
    var newsModel : NewsParserModel?{
        didSet{
             self.loadingIndicator.startAnimating()
            self.loadingIndicator.hidesWhenStopped = true
            imageViewNews.image = UIImage(named: "abcnews")
            loadImage(newsModel: newsModel!) { [unowned self](data, error) in
//                if let err = error{
//                    self.loadingIndicator.stopAnimating()
//                }
//                guard let err = error else {
//                    self.loadingIndicator.stopAnimating()
//                    return
//                }
//                if let dat = Data {
                      self.imageViewNews.image = UIImage(data: data)
//                }
//                else{
                      self.loadingIndicator.stopAnimating()
//                }
                
              
            }
            
            loadingIndicator.hidesWhenStopped = true
            self.labelTitle.text = newsModel?.title
            self.labelDescription.text = newsModel?.descriptions
        }
    }
    func loadImage(newsModel: NewsParserModel,completion:@escaping (_ data : Data,_ error : Error?) -> Void) {
        let session = URLSession.shared
        if let url = newsModel.urlToImage {
            let imgUrl = URL(string: url)
             let dataTask = session.dataTask(with: imgUrl!, completionHandler: { (data, response, error) in
                completion(data!,error)
             })
            dataTask.resume()
        }
        else{
            loadingIndicator.stopAnimating()
        }
       
    }
}
