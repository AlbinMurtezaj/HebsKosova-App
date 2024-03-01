import UIKit

class BurgersTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showMessage: UILabel!
    
    var dbPointer: OpaquePointer?
    var menuItems: [FoodModel] = []
    let dataController = ShportaDataController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get database pointer
        dbPointer = DBHelper.getDatabasePointer(databaseName: "HebsKosova.db")
        
        // Fetch data from the database
        menuItems = Repository.getData(db: dbPointer)
        
        // Set up table view
        tableView.dataSource = self
        tableView.delegate=self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
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
            self.dataController.addCartItem(menuItem)
            self.showAlert(from: self, message: "Produkti u shtua ne shporte!")
            //print("the item has been added to the cart")
            // Pass the selected menu item to the ShportaDataController
            // You can also update UI or perform any other necessary tasks here
        }

        return cell
    }
    private func showAlert(from viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    // Function to show message for 3 seconds
        func showMessageFunc(_ message: String) {
            showMessage.text = message
            showMessage.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showMessage.isHidden = true
            }
        }

    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
