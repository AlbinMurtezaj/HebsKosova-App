//
//  CustomTableViewCell.swift
//  HebsKosova
//
//  Created by Albin Murtezaj on 28.2.24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoBurger: UIImageView!
    @IBOutlet weak var cmimiBurger: UILabel!
    @IBOutlet weak var emriBurger: UILabel!
    

    var addButtonAction: (() -> Void)?

    @IBAction func addButtonAction(_ sender: UIButton) {
        addButtonAction?() // Call the closure when the button is tapped
    }
    

}
