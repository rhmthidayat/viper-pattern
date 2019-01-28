//
//  DetailNewsProtocols.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation
import UIKit

protocol DetailNewsViewProtocol: class {
    func showDetailNews(forData data: Article)
}

protocol DetailNewsPresenterProtocol: class {
    var view: DetailNewsViewProtocol? {get set}
    var router: DetailNewsRouterProtocol? {get set}
    var dataDetailNews: Article? {get set}
    func updateView()
}

protocol DetailNewsRouterProtocol: class {
    static func createModule(forData data: Article) -> UIViewController
}
