//
//  SecondViewController.swift
//  CoreDataXc8
//
//  Created by athambiran on 1/6/17.
//  Copyright © 2017 athambiran. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {

    @IBOutlet weak var agetxt: UITextField!
    @IBOutlet weak var switchDone: UISwitch!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func AddTheItems(_ sender: Any) {
        
        
        let context1=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let item=Item(context:context1)
        item.name=txtField.text!;
        
        item.age=agetxt.text!;
        
        item.isDone=switchDone.isOn;
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated:true);
        
    }
}
