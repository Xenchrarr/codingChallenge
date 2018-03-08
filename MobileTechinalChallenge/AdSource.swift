//
//  AdSource.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import UIKit

final class AdSource: NSObject, UITableViewDataSource {
    
    private var maximumNumberOfItems = 40
    private let numberOfItemsToAdd = 10
    private var numberOfItems = 0
    private var items: [Items] = []
    
//    lazy private var items: [Items] = {
//        let iterator = AnyIterator {
//            return
//        }
//
//        return Array(iterator.prefix(maximumNumberOfItems))
//
//        let items: [Items] = []
//        return items
//    }()
    
    
//    lazy private var items: [Items] = {
//        let iterator = AnyIterator {
//            return Items(dictionary: {})
//        }
//
//        return Array(iterator.prefix(maximumNumberOfItems))
//    }()
    
    func updateItems(data: Json4Swift_Base){
        items = data.items ?? []
        maximumNumberOfItems = data.size ?? 0
        numberOfItems = 10
    }
    
    
    func getMoreItems() {
        numberOfItems = min(numberOfItems + numberOfItemsToAdd, maximumNumberOfItems)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch (numberOfItems < maximumNumberOfItems) {
        case true:
            return 2
        case false:
            return 1
        }
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
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell
            cell.configure(with: items[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCell.reuseIdentifier, for: indexPath) as! MoreCell
            return cell
        }
    }
    
    func getNumberOfItems() -> Int {
        return numberOfItems
    }
}
