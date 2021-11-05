//
//  NetworkServiceSingleton.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation
import Alamofire

class NetworkServiceSingleton {
    private init () {}
    
    static let shared = NetworkServiceSingleton()
    
    let baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    func wordInfo(_ query: String, completion: @escaping (Result<[WordInfoModel], AFError>) -> Void ) {
        AF.request(baseUrl + query, method: .get).responseDecodable(of: [WordInfoModel].self) { res in
            completion(res.result)
        }
    }
}
