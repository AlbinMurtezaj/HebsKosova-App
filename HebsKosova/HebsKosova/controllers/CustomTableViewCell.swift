//
//  CustomTableViewCell.swift
//  HebsKosova
//
//  Created by Desara Qerimi on 28.2.24.
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
