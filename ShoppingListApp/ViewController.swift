//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by TYLER MOK on 10/31/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    var item = ""
    
    var items = [String]()
    

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    @IBOutlet weak var itemOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

        if let item = defaults.object(forKey: "items") {
            items = item as! [String]
        }
        
        
        // Do any additional setup after loading the view.
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = items[indexPath.row]
                return cell

    }
    
    
    @IBAction func addButton(_ sender: Any) {
        items.append(itemOutlet.text!)
        
        tableViewOutlet.reloadData()
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
            defaults.setValue(items, forKey: "items")
    }
    
    
    
    
    
    
    
    
    
    

}

