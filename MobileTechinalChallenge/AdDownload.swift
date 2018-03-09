//
//  AdDownload.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation

class AdDownload{
    let MAIN_URL: URL = URL(string: "https://gist.githubusercontent.com/3lvis/3799feea005ed49942dcb56386ecec2b/raw/63249144485884d279d55f4f3907e37098f55c74/discover.json")!
    
    
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
