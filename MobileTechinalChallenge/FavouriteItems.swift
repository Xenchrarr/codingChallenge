//
//  FavouriteItems.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08.03.2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavouriteItems{
    var items: [Items] = []
    var itemKeys: [String] = []
    
    func add(item: Items, image: UIImage){
        if isPresent(item: item) == nil{
            item.downloadedImage = image
            items.append(item)
            itemKeys.append(item.id!)
        }
    }
    
    func remove(item: Items){
        if let number = isPresent(item: item) {
            items.remove(at: number)
            itemKeys.remove(at: number)
        }
    }
    
    func getItems() -> [Items]{
        return items
    }
    
    func isPresent(item: Items) -> Int?{
        var i = 0
        for existingItem in items {
            if existingItem.id == item.id {
                return i
            }
            i += 1
        }
        return nil
    }
    
    func isFavourite(id: String) -> Bool {
        return itemKeys.contains(id)
    }
    
    func getFavourite(id: String) -> Items? {
        for item in items {
            if item.id == id {
                return item
            }
        }
        
        return nil 
    }
    
}
