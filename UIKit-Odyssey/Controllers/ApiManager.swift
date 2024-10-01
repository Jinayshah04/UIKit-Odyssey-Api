//
//  ApiManager.swift
//  UIKit-Odyssey
//
//  Created by mobile1 on 17/09/24.
//

import Foundation
import Alamofire
class ApiManager {
     let urlStr = "https://official-joke-api.appspot.com/jokes/random/5"
    
     func fetchJokeAF(completionHandler:@escaping(Result<[JokeModel], Error>)->Void) {
        AF.request(urlStr).responseDecodable(of:[JokeModel].self){ response in
            switch response.result{
            case.success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    func fetchAF(category:String,completionHandler:@escaping(Result<[JokeModel], Error>)->Void) {
             let urlStr2 = "https://official-joke-api.appspot.com/jokes/\(category)/ten"
             AF.request(urlStr2).responseDecodable(of:[JokeModel].self){ response in
                 switch response.result{
                 case.success(let data):
                     completionHandler(.success(data))
                 case .failure(let error):
                     print("---------------")
                     completionHandler(.failure(error))
                 }
             }
         }
}
