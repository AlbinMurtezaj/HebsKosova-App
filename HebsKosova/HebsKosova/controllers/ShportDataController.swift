//
//  ShportDataController.swift
//  HebsKosova
//
//  Created by Desara Qerimi on 28.2.24.
//

import Foundation
struct CartItem {
    let name: String
    let price: String
}
class ShportaDataController {
    static let shared = ShportaDataController()
    
    var cartItems: [CartItem] = []
    
    func addCartItem(_ menuItem: FoodModel) {
        let cartItem = CartItem(name: menuItem.emri, price: menuItem.cmimi)
        cartItems.append(cartItem)
    }
}
