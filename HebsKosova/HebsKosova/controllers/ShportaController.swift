//
//  ShportaController.swift
//  HebsKosova
//
//  Created by Desara Qerimi on 28.2.24.
//

import Foundation
import UIKit
import SQLite3

struct CartItem {
    let name: String
    let price: String
}

class ShportaController: UIViewController, UITableViewDataSource{
    static let shared = ShportaController()
    
    @IBOutlet weak var tableView: UITableView!
    var cartItems: [CartItem] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up your table view
            tableView.dataSource = self
            tableView.reloadData()
        }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        tableView.reloadData()
      }
    
    // MARK: - Table view data source
    
    func addCartItem(_ menuItem: FoodModel) {
            // Create a CartItem object from the FoodModel
            let cartItem = CartItem(name: menuItem.emri, price: menuItem.cmimi)
            // Add the item to the cart
            cartItems.append(cartItem)
        print("The item added from burger \(cartItem.name)")
        print("reshtat e kthyer \(cartItems.count)")

            // Reload the table view to reflect the changes
    

        }
        
        // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("reshtat e kthyer \(cartItems.count)")
        return cartItems.count < 2 ? 2 : cartItems.count
                }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellShporta", for: indexPath) as? ShportaTableViewCell else {
            return UITableViewCell()
        }
        
        // Ensure that indexPath is within bounds of the cartItems array

        
        // Configure the cell with the cart item details
        let cartItem = cartItems[indexPath.row]
        cell.emriShporta.text = cartItem.name
        cell.cmimiShporta.text = "\(cartItem.price)"
        
        return cell
    }
        
    
}
