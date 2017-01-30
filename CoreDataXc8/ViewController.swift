//
//  ViewController.swift
//  CoreDataXc8
//
//  Created by athambiran on 1/6/17.
//  Copyright © 2017 athambiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableDataSource=TableViewDataSource()
    var items=[Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=tableDataSource
        tableView.delegate=tableDataSource
        
        //items.a
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         let context1=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        items=try context1.fetch(Item.fetchRequest())
        }
            catch{
                print("error in fetching the data")
            }
        tableDataSource.items=items
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

