//
//  ViewController.swift
//  ABCNews
//
//  Created by Prasad Prabhu on 30/09/17.
//  Copyright © 2017 Prasad Prabhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var newsModel : NewsModel = NewsModel()
    @IBOutlet weak var collectionViewNews: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        CGFloat width = screenSize.size.width/2;
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
//        layout.itemSize = CGSizeMake(width, width);
//        self.collectionViewFav.collectionViewLayout = layout;
        let screenSize = UIScreen.main.bounds
        let width = screenSize.size.width/2.1
        loadingIndicator.hidesWhenStopped = false
        loadingIndicator.startAnimating()
        collectionViewNews.isHidden = true
        let layout = UICollectionViewFlowLayout()
        DataProvider.sharedProvider.getNewsData(target: self) { [unowned self](news, error) in
            self.newsModel = news
            self.collectionViewNews.isHidden = false
            self.collectionViewNews.reloadData()
            
        }
//        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize.init(width:width , height: width)
//        collectionViewNews.collectionViewLayout = layout
        // Do any additional setup after loading the view, typically from a nib.
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        let padding : CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - (padding)
        
        return CGSize(width: collectionViewSize/2, height: collectionView.frame.size.height/1.9)
        
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        let padding : CGFloat =  10
//        let collectionViewSize = collectionView.frame.size.width - padding
//        
//        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsModel.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let newsParser = newsModel.news[indexPath.row] as! NewsParserModel
        cell.newsModel = newsParser
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! IndexPath
        let detailController = segue.destination as! DetailViewController
        let newsParserModel : NewsParserModel = newsModel.news[(indexPath as AnyObject).row] as! NewsParserModel
        detailController.newsParserModel = newsParserModel
        
        
    }
}

