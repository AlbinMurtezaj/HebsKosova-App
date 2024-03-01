import UIKit

class ShportaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cmimiTotal: UILabel!  
    @IBOutlet weak var emriTF: UITextField!
    @IBOutlet weak var numriTF: UITextField!
    @IBOutlet weak var adresaTF: UITextField!
    @IBOutlet weak var porositButton: UIButton!
    
    let dataController = ShportaDataController.shared
    var totali:Double=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
         tableView.delegate=self
        calculateTotal {
            DispatchQueue.main.async {
                        self.cmimiTotal.text = "\(self.totali)€" // Update the cmimiTotal label with the total value
                    }            }
        
//        print("cmimi totali \(calculateTotal {self.tottali
//})")
    }
     func calculateTotal(completion: @escaping () -> Void) {
        totali = dataController.cartItems.reduce(0) { total, cartItem in
            // Use regular expression to filter out non-numeric characters from the price string
            let numericPriceString = cartItem.price.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression)
            
            // Convert the numeric string to a Double
            if let price = Double(numericPriceString) {
                return total + price
            } else {
                // Handle invalid price values here
                return total
            }
        }
        completion()
    }
    
     @IBAction func porositButtonPressed(_ sender: UIButton) {
        guard let emri = emriTF.text , !emri.isEmpty else {
            showAlert(from: self, message: "Plotesoje emrin!")
            return
        }
        guard let adresa = adresaTF.text , !adresa.isEmpty else {
            showAlert(from: self, message: "Plotesoje adresen!")
            return
        }
        guard let numri = numriTF.text , !numri.isEmpty else {
            showAlert(from: self, message: "Plotesoje numri!")
            return
        }
    
            showAlert(from: self, message: "Porosia u dërgua!")
            cmimiTotal.text = "0€"
            emriTF.text = ""
            adresaTF.text = ""
            numriTF.text = ""
        ShportaDataController.removeAllItems()
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
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    private func showAlert(from viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
