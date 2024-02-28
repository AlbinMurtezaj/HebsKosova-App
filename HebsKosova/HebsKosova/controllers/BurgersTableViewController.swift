//
//  BurgersTableViewController.swift
//  HebsKosova
//
//  Created by Desara Qerimi on 27.2.24.
//

import UIKit

class BurgersTableViewController: UIViewController, UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var dbPointer: OpaquePointer?
    var menuItems: [FoodModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get database pointer
        dbPointer = DBHelper.getDatabasePointer(databaseName: "HebsKosova.db")
        
        // Fetch data from the database
        menuItems = Repository.getData(db: dbPointer)
        
        // Set up table view
        tableView.dataSource=self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
//            return UITableViewCell()
//        }
//        
//        let menuItem = menuItems[indexPath.row]
//        
//        cell.emriBurger.text = menuItem.emri
//        cell.cmimiBurger.text = menuItem.cmimi
//        cell.fotoBurger.image = UIImage(named: "image\(menuItem.foto)")
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
               return UITableViewCell()
           }

           let menuItem = menuItems[indexPath.row]
           cell.emriBurger.text = menuItem.emri
           cell.cmimiBurger.text = menuItem.cmimi
           cell.fotoBurger.image = UIImage(named: "image\(menuItem.foto)")

           // Set the closure for the button action
           cell.addButtonAction = {
               // Perform action when the button is tapped
               // For example, add the data to the CartController
               ShportaController.shared.addCartItem(menuItem)
               print("the item has been added to the cart")// Pass the selected menu item to the CartController
               // You can also update UI or perform any other necessary tasks here
           }

           return cell
       }
   }
    
