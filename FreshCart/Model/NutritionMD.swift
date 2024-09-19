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
    var name: String = ""
    var image: String = ""
    var color: Color = .black

    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        
        self.name = dict.value(forKey: "type_name") as? String ?? ""
        
        self.image = dict.value(forKey: "image") as? String ?? ""
        
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
        
    }
    static func == (lhs: TypeMD,rhs: TypeMD) ->Bool{
        return lhs.id == rhs.id
    }
}
