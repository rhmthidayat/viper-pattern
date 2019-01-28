//
//  NewsRouter.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation
import UIKit

class NewsRouter: NewsRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "showNews") as? NewsViewController
        
        let presenter: NewsViewToPresenterProtocol & NewsInteractorToPresenterProtocol  = NewsPresenter()
        let interactor: NewsInteractorProtocol = NewsInteractor()
        let router: NewsRouterProtocol = NewsRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func showDetailNewsController(from view: NewsViewProtocol, forData data: Article) {
        let conn = DetailNewsRouter.createModule(forData: data)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(conn, animated: true)
        }
    }
}
