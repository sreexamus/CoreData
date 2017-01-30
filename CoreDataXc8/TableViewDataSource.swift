//
//  TableViewDataSource.swift
//  CoreDataXc8
//
//  Created by athambiran on 1/6/17.
//  Copyright © 2017 athambiran. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
     var items=[Item]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
      let cell = UITableViewCell()
        cell.textLabel?.text=items[indexPath.row].name
        cell.detailTextLabel?.text=items[indexPath.row].age
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == .delete){
            
              let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
              context.delete(items[indexPath.row])
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            do{
               items = try context.fetch(Item.fetchRequest())
            }catch{
                print("errors while fetching the data")
            }
            
            
            tableView.reloadData();
            
    
       }
        
    }
    
    

}
