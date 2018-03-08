//
//  AdTableViewController.swift
//  MobileTechinalChallenge
//
//  Created by Emil Ramsdal on 08/03/2018.
//  Copyright © 2018 Emil Ramsdal. All rights reserved.
//

import UIKit

class AdTableViewController: UITableViewController {

    private var tableDataSource = AdSource()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = tableDataSource
        tableView.estimatedRowHeight = 150.0
//        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 160.0
        
        
        
        
        downloadData()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        
        let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
        print("number of items: \(numberOfItems)")
        tableDataSource.getMoreItems()
        
        let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
        let shouldHaveMoreButton = tableDataSource.numberOfSections(in: tableView) == 2
        
        let newIndexPaths = Array(numberOfItems ..< newNumberOfItems).map { (n) -> IndexPath in
            IndexPath(row: n, section: 0)
        }
        
        tableView.performBatchUpdates({
            tableView.insertRows(at: newIndexPaths, with: .top)
            
            if !shouldHaveMoreButton {
                tableView.deleteSections(IndexSet(integer: 1), with: .top)
            }
        }) { _ in
            print("something")
            let scrollPointIndexPath = shouldHaveMoreButton ? indexPath : IndexPath(row: numberOfItems - 1, section: 0)
            
//            tableView.scrollToRow(at: scrollPointIndexPath, at: .top, animated: true)
            
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard indexPath.section == 0 else { return }
//        let lastElement = tableDataSource.getNumberOfItems() - 1
//        if indexPath.row == lastElement {
//            print("test")
//            let numberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
//            print("number of items: \(numberOfItems)")
//            tableDataSource.getMoreItems()
//
//            let newNumberOfItems = tableDataSource.tableView(tableView, numberOfRowsInSection: 0)
//            let shouldHaveMoreButton = tableDataSource.numberOfSections(in: tableView) == 2
//
//            let newIndexPaths = Array(numberOfItems ..< newNumberOfItems).map { (n) -> IndexPath in
//                IndexPath(row: n, section: 0)
//            }
//
//            tableView.performBatchUpdates({
//                tableView.insertRows(at: newIndexPaths, with: .top)
//
//                if !shouldHaveMoreButton {
//                    tableView.deleteSections(IndexSet(integer: 1), with: .top)
//                }
//            }) { _ in
//                print("something")
//                let scrollPointIndexPath = shouldHaveMoreButton ? indexPath : IndexPath(row: numberOfItems - 1, section: 0)
//
//                tableView.scrollToRow(at: scrollPointIndexPath, at: .top, animated: true)
//
//                guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
//                tableView.deselectRow(at: selectedIndexPath, animated: true)
//            }
//        }
//    }
    
    func updateTableView(){
        
    }

}
