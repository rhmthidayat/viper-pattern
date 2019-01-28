//
//  DetailNewsPresenter.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation

class DetailNewsPresenter: DetailNewsPresenterProtocol {
    
    var view: DetailNewsViewProtocol?
    var router: DetailNewsRouterProtocol?
    var dataDetailNews: Article?
    
    func updateView() {
        self.view?.showDetailNews(forData: dataDetailNews!)
    }
}
