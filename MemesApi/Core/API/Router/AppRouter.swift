//
//  AppRouter.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import Foundation
import Alamofire

enum AppRouter {
    case Memes
    
}

extension AppRouter: ApiConfiguration {
    var parameters: RequestParams {
        switch self {
        case .Memes:
            return .url([:])
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Memes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .Memes:
            return "https://api.imgflip.com/get_memes" // base
        
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = URL(string: path)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        
       return request
    }
    
    
}
