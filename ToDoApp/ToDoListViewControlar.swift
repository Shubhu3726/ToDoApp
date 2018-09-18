//
//  ViewController.swift
//  ToDoApp
//
//  Created by shubham on 18/09/18.
//  Copyright © 2018 shubham. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    let ItemArray = ["Find Milk","Buy Eggs","Destroy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tablview Delegate mathot
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ItemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
       if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
       {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
       {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        cell.textLabel?.text = ItemArray[indexPath.row]
        return cell
        
    }


}

