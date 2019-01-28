//
//  NewsProtocols.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation
import UIKit

protocol NewsViewProtocol: class {
    func showNews(data: News)
    func showError()
}

protocol NewsInteractorProtocol: class {
    var presenter: NewsInteractorToPresenterProtocol? {get set}
    func fetchNews()
}

protocol NewsInteractorToPresenterProtocol: class {
    func newsFetched(data: News)
    func newsFetchedFailed()
}

protocol NewsViewToPresenterProtocol: class {
    var view: NewsViewProtocol? {get set}
    var interactor: NewsInteractorProtocol? {get set}
    var router: NewsRouterProtocol? {get set}
    func updateView()
    func showDetailNews(data: Article)
    
}

protocol NewsRouterProtocol: class {
    static func createModule() -> UIViewController
    func showDetailNewsController(from view: NewsViewProtocol, forData data: Article)
}
