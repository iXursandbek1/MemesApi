//
//  ConnectionManager.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import Foundation
import Reachability

class ConnectionManager {
    
    static let sharedInstance = ConnectionManager()
    private var reachability : Reachability!
    
    var isNetworkAvailable = false
    
    func observeReachability(){
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        do {
            self.reachability = try Reachability()
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {
    let reachability = note.object as! Reachability
    switch reachability.connection {
    case .cellular:
        print("Network available via Cellular Data.")
        isNetworkAvailable = true
        break
    case .wifi:
        print("Network available via WiFi.")
        isNetworkAvailable = true
        break
    case .none:
        print("Network is not available.")
        isNetworkAvailable = false
        break
    case .unavailable:
        print("Network is unavailable.")
        isNetworkAvailable = false
        break
    default:
        break
    }
  }
}
