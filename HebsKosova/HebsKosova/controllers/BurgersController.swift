//import Foundation
//import UIKit
//import SQLite3
//
//class BurgersController: UIViewController, UITableViewDataSource {
//    
//    var dbPointer: OpaquePointer?
//    var menuItems: [FoodModel] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Get database pointer
//        dbPointer = DBHelper.getDatabasePointer(databaseName: "HebsKosova.db")
//        
//        // Fetch data from the database
//        menuItems = Repository.getData(db: dbPointer)
//        
//        // Set up table view
//        tableView.dataSource = self
//        tableView.reloadData()
//    }
//    
//    // MARK: - Table view data source
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return menuItems.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
//            return UITableViewCell()
//        }
//        
//        let menuItem = menuItems[indexPath.row]
//        
//        cell.emriBurger.text = menuItem.emri
//        cell.cmimiBurger.text = menuItem.cmimi
//        
//        // Set cell appearance
//        cell.backgroundColor = UIColor(red: 62.0/255.0, green: 27.0/255.0, blue: 125.0/255.0, alpha: 1.0)
//        cell.emriBurger.textColor = (cell.emriBurger.text == userScores?.username) ? UIColor.yellow : UIColor.white
//        cell.cmimiBurger.textColor = (cell.emriBurger.text == userScores?.username) ? UIColor.yellow : UIColor.white
//        cell.score.textColor = (cell.emriBurger.text == userScores?.username) ? UIColor.yellow : UIColor.white
//        
//        return cell
//    }
//}
