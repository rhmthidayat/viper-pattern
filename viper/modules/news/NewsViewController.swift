//
//  NewsViewController.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var tbData: UITableView!
    
    var presenter: NewsViewToPresenterProtocol?
    
    var dataNews = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.presenter?.updateView()
    }

}

extension NewsViewController: NewsViewProtocol {
    
    func showNews(data: News) {
        self.lblSource.text = data.source?.uppercased() ?? ""
        if let articles = data.articles, articles.count > 0 {
            self.dataNews = articles
            self.tbData.delegate = self
            self.tbData.dataSource = self
            self.tbData.reloadData()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! newsCell
        
        let data = self.dataNews[indexPath.row]
        
        cell.lblTitle.text = data.title ?? ""
        
        if let img = data.urlToImage {
            cell.imgNews.loadImageUsingCacheWithUrlString(img)
        }
        
        let publishedAt = data.publishedAt!
        let dateFormatterFrom = DateFormatter()
        dateFormatterFrom.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateStr = dateFormatterFrom.string(from: publishedAt)
        let dateDate = dateFormatterFrom.date(from: dateStr)
        let dateFormatterTo = DateFormatter()
        dateFormatterTo.dateFormat = "dd MMM yyyy, h:mm a"
        let dateString = dateFormatterTo.string(from: dateDate!)
        cell.lblDate.text = dateString
        
        cell.lblDesc.text = data.description ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showDetailNews(data: self.dataNews[indexPath.row])
    }
}


class newsCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
}
