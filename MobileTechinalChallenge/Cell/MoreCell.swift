//
//  MoreCell.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import Foundation
import UIKit

final class MoreCell: UITableViewCell {
    @IBOutlet private var label: UILabel!
    
    static let reuseIdentifier = "MoreCell"
    
    lazy private var textColour = {
        UIColor(red: 0.196, green: 0.3098, blue: 0.52, alpha: 1.0)
    }()
    
    override func awakeFromNib() {
        label.textColor = textColour
        label.text = NSLocalizedString("Load More Button", value: "Load More", comment: "Text for Load More button")
    }
}
