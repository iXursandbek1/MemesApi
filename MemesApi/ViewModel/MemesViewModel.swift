//
//  MemesViewModel.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import Foundation

class MemesViewModel {
    
    let service = NetworkService()
    
    var memes: Welcome? = nil
    
    init() {
        
    }
    
    
    func getMemes(
        onSucces: @escaping (Welcome) -> (),
        onError: @escaping (String) -> ()
    ) {
        let request = AppRouter.Memes
        
        service.sendRequest(request: request, responseType: Welcome.self, onSucces: { data in
            onSucces(data)
        }, onError: { error in
            onError(error)
        })
        
    }    
    
}
