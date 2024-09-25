//
//  NutritionModel.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI

class NutritionMD: Identifiable,Equatable {
    //    var id: ObjectIdentifier
    
    var id: Int = 0
    var nutrition_name: String = ""
    var nutrition_value: String = ""


    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "nutrition_id") as? Int ?? 0
        
        
        self.nutrition_name = dict.value(forKey: "nutrition_name") as? String ?? ""
        
        
        self.nutrition_value = dict.value(forKey: "nutrition_value") as? String ?? ""
        
    }
    static func == (lhs: NutritionMD,rhs: NutritionMD) ->Bool{
        return lhs.id == rhs.id
    }
}
