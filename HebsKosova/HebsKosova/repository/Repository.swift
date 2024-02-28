//
//  Repository.swift
//  HebsKosova
//
//  Created by Desara Qerimi on 27.2.24.
//

import Foundation
import SQLite3

class Repository {
    static func getData(db: OpaquePointer?) -> [FoodModel] {
        var foodModels: [FoodModel] = []
        var photoCounter: Int = 1
        
        guard let db = db else {
            print("Database pointer is nil")
            return []
        }
        
        let query = "SELECT emri, cmimi FROM burgers_wraps"
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                if let emri = sqlite3_column_text(statement, 0),
                   let cmimi = sqlite3_column_text(statement, 1){
                    
                    let emriString = String(cString: emri)
                    let cmimiString = String(cString: cmimi)
                    let fotoNo = photoCounter
                    photoCounter += 1
                    
                    let foodModel = FoodModel(emri: emriString, cmimi: cmimiString, foto: fotoNo)
                    foodModels.append(foodModel)
                }
            }
        } else {
            print("Error preparing query statement")
        }
        
        sqlite3_finalize(statement)
        
        return foodModels
    }
}
