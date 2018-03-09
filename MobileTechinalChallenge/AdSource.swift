//
//  AdSource.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import UIKit

final class AdSource: NSObject, UITableViewDataSource, ItemCellDelegate {

    private var maximumNumberOfItems = 40
    private let numberOfItemsToAdd = 10
    private var numberOfItems = 0
    private var items: [Items] = []
    private var favourites = FavouriteItems()
    private var downloadedItems: [Items] = []

    
    
    func setFavorite(_ tag: Int, image: UIImage) {
        
        items[tag].isFavourite = !items[tag].isFavourite
        if items[tag].isFavourite {
            
            favourites.add(item: items[tag], image: image)
        } else {
            favourites.remove(item: items[tag])
        }
        
        favourites.saveFavourites()
    }
    
    func setDownloaded(){
        items = downloadedItems
        switchData(size: downloadedItems.count)
        
    }
    
    func updateItems(data: Json4Swift_Base){
        downloadedItems = data.items ?? []
        items = data.items ?? []
        
        switchData(size: items.count )
    }
    
    func switchData( size: Int){
        maximumNumberOfItems = size
        numberOfItems = 10
        for item in items {
            let newItem = favourites.getFavourite(id: item.id!)
            if favourites.isFavourite(id: item.id!) {
                if newItem != nil {
                    item.downloadedImage = newItem?.downloadedImage
                    item.isFavourite = (newItem?.isFavourite)!
                }
            }
        }
    }
    

    func setFavourites(){
        self.items = favourites.items
        maximumNumberOfItems = self.items.count
        numberOfItems = self.items.count
    }
    
    
    func getMoreItems() {
        numberOfItems = min(numberOfItems + numberOfItemsToAdd, maximumNumberOfItems)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return numberOfItems
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell
        cell.configure(with: items[indexPath.row])
        cell.cellDelegate = self as ItemCellDelegate
        cell.tag = indexPath.row
        return cell

    }
    
    
    
    func getNumberOfItems() -> Int {
        return numberOfItems
    }
    
    func hasDownloaded() -> Bool {
        if downloadedItems.count > 0 {
            return true
        }
        return false
    }
    
    
}
