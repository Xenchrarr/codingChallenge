//
//  AdDownload.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import SystemConfiguration

class AdDownload{
    let MAIN_URL: URL = URL(string: "https://gist.githubusercontent.com/3lvis/3799feea005ed49942dcb56386ecec2b/raw/63249144485884d279d55f4f3907e37098f55c74/discover.json")!
    
    
    /**
     Checks if the phone is connected to any network and can do internet connections
     - returns: true if network connections is available
     */
    func connectedToNetwork() -> Bool {
        
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func getData(completion: @escaping((_ data: Json4Swift_Base) -> Void)){
        
        
        let request = NSMutableURLRequest(url: MAIN_URL )
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            do {

                
                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                let json4Swift_Base = Json4Swift_Base(dictionary: someDictionaryFromJSON as NSDictionary)
                
                completion( json4Swift_Base!)
                

            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()    }
}
