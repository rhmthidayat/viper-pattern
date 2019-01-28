//
//  DetailNewsRouter.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation
import UIKit

class DetailNewsRouter: DetailNewsRouterProtocol {
    
    class func createModule(forData data: Article) -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "showDetailNews") as? DetailNewsViewController
        
        let presenter: DetailNewsPresenterProtocol = DetailNewsPresenter()
        let router: DetailNewsRouterProtocol = DetailNewsRouter()
        
        view!.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.dataDetailNews = data
        
        return view!
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
