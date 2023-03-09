//
//  NetworkService.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    func sendRequest<T: Decodable>(
        request: URLRequestConvertible,
        responseType: T.Type,
        onSucces: @escaping (T) -> (),
        onError: @escaping (String) -> ()
    ) {
        if ConnectionManager.sharedInstance.isNetworkAvailable {
            onError("No Network Connection")
            return
        }
        
        AF.request(request).responseDecodable(of: T.self) { response in
            guard let data = response.value, let statusCode = response.response?.statusCode else {
                onError("no response")
                return
            }
            if statusCode >= 200 && statusCode < 300 {
                onSucces(data)
            } else {
                onError("No Data")
            }
     
        }
    }
  
}
