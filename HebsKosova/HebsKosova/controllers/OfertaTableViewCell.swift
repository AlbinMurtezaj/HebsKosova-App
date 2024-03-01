//
//  OfertaTableViewCell.swift
//  HebsKosova
//
//  Created by Albin Murtezaj on 29.2.24.
//

import UIKit

class OfertaTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoOferta: UIImageView!
    @IBOutlet weak var emriOferta: UILabel!
    @IBOutlet weak var cmimiOferta: UILabel!
    
    var addButtonAction: (() -> Void)?

    @IBAction func addButtonAction(_ sender: UIButton) {
        addButtonAction?() // Call the closure when the button is tapped
    }
    
}
