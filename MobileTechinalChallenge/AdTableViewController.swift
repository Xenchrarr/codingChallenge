//
//  AdTableViewController.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import UIKit

class AdTableViewController: UITableViewController {
    
    @IBOutlet weak var favouriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
        favouriteSwitch.isOn = false
    }
    
    private var tableDataSource = AdSource()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        tableView.estimatedRowHeight = 150.0
        //        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 160.0
        
        
    }
    
    func downloadData(){
        let adDownload = AdDownload()
        
        adDownload.getData(completion: { data in
            self.tableDataSource.updateItems(data: data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    @IBAction func favouriteSwitch(_ sender: Any) {
        if favouriteSwitch.isOn {
            tableDataSource.setFavourites()
            tableView.reloadData()
        } else {
            if !tableDataSource.hasDownloaded() {
                downloadData()
            } else {
                tableDataSource.setDownloaded()
                tableView.reloadData()
            }
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 else { return }
        let lastElement = tableDataSource.getNumberOfItems() - 2
        if indexPath.row == lastElement {
            DispatchQueue.main.async() {
                
                
                let numberOfItems = self.tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
                self.tableDataSource.getMoreItems()
                
                let newNumberOfItems = self.tableDataSource.tableView(tableView, numberOfRowsInSection: 0)

                
                let newIndexPaths = Array(numberOfItems ..< newNumberOfItems).map { (n) -> IndexPath in
                    IndexPath(row: n, section: 0)
                }
                
                tableView.performBatchUpdates({
                    tableView.insertRows(at: newIndexPaths, with: .top)
                    
                }) { _ in

                    guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
                    tableView.deselectRow(at: selectedIndexPath, animated: true)
                }
            }
        }
    }
    
    
    
    func updateTableView(){
        
    }
    
}
