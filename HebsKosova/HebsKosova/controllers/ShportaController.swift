import UIKit

class ShportaViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    let dataController = ShportaDataController.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.cartItems.count // Ensure minimum of 2 rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellShporta", for: indexPath) as? ShportaTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row < dataController.cartItems.count {
            let cartItem = dataController.cartItems[indexPath.row]
            cell.emriShporta.text = cartItem.name
            cell.cmimiShporta.text = "\(cartItem.price)"
        } else {
            cell.emriShporta.text = ""
            cell.cmimiShporta.text = ""
        }
        
        return cell
    }
}
