//
//  NewsInteractor.swift
//  viper
//
//  Created by Rahmat Hidayat on 28/01/19.
//  Copyright © 2019 Rahmat. All rights reserved.
//

import Foundation
import Alamofire

class NewsInteractor: NewsInteractorProtocol {
    
    var presenter: NewsInteractorToPresenterProtocol?
    
    func fetchNews() {
        Alamofire.request(Constants.baseUrl, method: .get).responseJSON { response in
            if let data = response.data, (response.response?.statusCode) == 200 {
                let result = try! newJSONDecoder().decode(News.self, from: data)
                self.presenter?.newsFetched(data: result)
            }else{
                self.presenter?.newsFetchedFailed()
            }
        }
    }
    
}
