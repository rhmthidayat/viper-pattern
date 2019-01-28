//
//  DetailNewsViewController.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDateAndBy: UILabel!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    
    var presenter: DetailNewsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.updateView()
    }
    
}

extension DetailNewsViewController: DetailNewsViewProtocol {
    
    func showDetailNews(forData data: Article) {
        self.lblTitle.text = data.title ?? ""
        
        let publishedAt = data.publishedAt!
        let dateFormatterFrom = DateFormatter()
        dateFormatterFrom.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateStr = dateFormatterFrom.string(from: publishedAt)
        let dateDate = dateFormatterFrom.date(from: dateStr)
        let dateFormatterTo = DateFormatter()
        dateFormatterTo.dateFormat = "dd MMM yyyy, h:mm a"
        let dateString = dateFormatterTo.string(from: dateDate!)
        
        let dateAndBy = "\(dateString) by \(data.author ?? "")"
        self.lblDateAndBy.text = dateAndBy
        
        if let img = data.urlToImage {
            self.imgNews.loadImageUsingCacheWithUrlString(img)
        }
        
        self.lblDesc.text = data.description
    }
    
}
