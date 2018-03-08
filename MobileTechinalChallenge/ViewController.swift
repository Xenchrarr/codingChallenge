//
//  ViewController.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func test(){
        let url = URL(string: "https://gist.githubusercontent.com/3lvis/3799feea005ed49942dcb56386ecec2b/raw/63249144485884d279d55f4f3907e37098f55c74/discover.json")
        
        let request = NSMutableURLRequest(url: url as! URL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            do {
            
                
                let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                
//                print(convertedJsonIntoDict)
                
                let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                let json4Swift_Base = Json4Swift_Base(dictionary: someDictionaryFromJSON as NSDictionary)
                
                print(json4Swift_Base!.items![0].description)
                
//                print(responseModel)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()
    }

}

