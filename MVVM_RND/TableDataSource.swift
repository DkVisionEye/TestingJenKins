//
//  TableDataSource.swift
//  MVVM_RND
//
//  Created by Rahul Vishwakarma on 08/09/23.
//

import UIKit


//TableView DataSource

class TablesDataSource<CELL: UITableViewCell, Q>: NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [Q]!
    var configureCell : (CELL, Q) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [Q], configureCell : @escaping (CELL, Q) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
