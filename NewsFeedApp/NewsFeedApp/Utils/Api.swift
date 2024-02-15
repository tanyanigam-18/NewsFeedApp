//
//  Api.swift
//  NewsFeedApp
//
//  Created by singsys on 22/12/23.
//

import SwiftUI
import Alamofire

class Api {
    class func request<T: Decodable>(api: APIManager, parameter: [String: Any]?, responseType _: T.Type, completion: @escaping(ResponseModal<T>) -> Void) {
        let header: HTTPHeaders = [
            "Accept": "application/json",
            "X-Api-Key": API_KEY
        ]
        AF.request(api.url, method: api.method, parameters: parameter, encoding: URLEncoding.queryString, headers: header)
            .validate()
            .responseDecodable(of: ResponseModal<T>.self) { (response: AFDataResponse<ResponseModal<T>>) in
                switch response.result {
                case .success(let result):
                    completion(result)
                    break
                case .failure(let error):
                    completion(.init(
                        status: .error,
                        totalResults: 0,
                        code: "af error" ,
                        message: error.errorDescription,
                        articles: nil,
                        sources: nil)
                    )
                    break
                }
            }
    }
}
