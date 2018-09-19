//
//  ViewController.swift
//  ToDoApp
//
//  Created by shubham on 18/09/18.
//  Copyright © 2018 shubham. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    var ItemArray = [Item]()
    var userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let  newItem = Item()
        newItem.title = "Find Milk"
        ItemArray.append(newItem)
        
        let  newItem2 = Item()
        newItem2.title = "Buy  Eggs"
        ItemArray.append(newItem2)
        
        let  newItem3 = Item()
        newItem3.title = "Destroy  Milk"
        ItemArray.append(newItem3)
      if let   Item = userDefault.array(forKey: "toDoListArray") as?  [Item]
      {
        ItemArray = Item
        }
      else{
        print("ïtem not found")
        }
    }

    //MARK - Tablview Delegate mathot
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ItemArray[indexPath.row].Bool = !ItemArray[indexPath.row].Bool
        
//     if   ItemArray[indexPath.row].Bool == false
//     {
//        ItemArray[indexPath.row ].Bool = true
//        }
//        else
//     {
//        ItemArray[indexPath.row].Bool = false
//        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
      
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        let item = ItemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.Bool ? .checkmark:.none
        
//        if item.Bool == true
//        {
//            cell.accessoryType = .checkmark
//        }
//        else
//        {
//            cell.accessoryType = .none
//        }
        return cell
        
    }
    
    // MARK - Add Action
    @IBAction func UIBarButton(_ sender: Any) {
        var textField  =  UITextField()
        let alert = UIAlertController(title: "Add Item", message: nil, preferredStyle:.alert)
        let alerActi = UIAlertAction(title: "Add item", style: .default) { (action) in
            print("Success")
            print(textField.text!)
            let newItem = Item()
            newItem.title = textField.text!
            self.ItemArray.append( newItem)
            self.userDefault.set(self.ItemArray, forKey: "toDoListArray")
            self.tableView.reloadData()
    
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create New item"
            textField = alertTextField
        }
        alert.addAction(alerActi)
        present(alert,animated: true,completion: nil)
        
    }
    

}

