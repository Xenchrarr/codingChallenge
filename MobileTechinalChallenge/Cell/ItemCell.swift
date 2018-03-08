//
//  ItemCell.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import UIKit

final class ItemCell: UITableViewCell {
    weak var cellDelegate: ItemCellDelegate?
    
    let imageBaseUrl = "https://images.finncdn.no/dynamic/480x360c/"
    @IBOutlet private var location: UILabel!
    @IBOutlet private var price: UILabel!
    @IBOutlet private var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likePhoto: UIButton!
    
    @IBAction func likeButton(_ sender: Any) {
    }
    
    static let reuseIdentifier = "ItemCell"
    
    func configure(with item: Items) -> () {
        location.text = item.location ?? ""
        price.text = String(describing: item.price?.value ?? 0) + ", -"
        title.text = item.description
        
        let url = URL(string: imageBaseUrl + (item.image?.url)!)
        photo.downloadedFrom(url: url!)
        
        likePhoto.imageView?.image = #imageLiteral(resourceName: "heart1")
    }
}

protocol ItemCellDelegate: class {
    
    
    func setFavorite(_ tag: Int)
}
