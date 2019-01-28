//
//  NewsPresenter.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation

class NewsPresenter: NewsViewToPresenterProtocol {
    
    var interactor: NewsInteractorProtocol?
    var view: NewsViewProtocol?
    var router: NewsRouterProtocol?
    
    func updateView() {
        self.interactor?.fetchNews()
    }
    
    func showDetailNews(data: Article) {
        self.router?.showDetailNewsController(from: view!, forData: data)
    }
    
}

extension NewsPresenter: NewsInteractorToPresenterProtocol {
    
    func newsFetched(data: News) {
        self.view?.showNews(data: data)
    }
    
    func newsFetchedFailed() {
        self.view?.showError()
    }
    
}
