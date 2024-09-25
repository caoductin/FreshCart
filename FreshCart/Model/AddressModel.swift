//
//  AddressModel.swift
//  FreshCart
//
//  Created by cao duc tin  on 20/9/24.
//

import SwiftUI

class AddressModel: Identifiable,Equatable {
    //    var id: ObjectIdentifier
    
    var id: Int = 0
    var name: String = ""
    var phone: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var typeName:String = ""
    var postal_code: String = ""
    var isDefault:Int = 0

    
    //"address_id": 1,
//    "name": "My Home",
//    "phone": "9876543211",
//    "address": "New Nat Stge Bldg, S Bapat Marg, Mahim",
//    "city": "Mumbai",
//    "state": "Maharashtra",
//    "type_name": "Home",
//    "postal_code": "400016",
//    "is_default": 0
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "address_id") as? Int ?? 0
        
        self.name = dict.value(forKey: "name") as? String ?? ""
        
        self.phone = dict.value(forKey: "phone") as? String ?? ""
        
        self.address = dict.value(forKey: "address") as? String ?? ""
        
        self.city = dict.value(forKey: "city") as? String ?? ""
        
        self.state = dict.value(forKey: "state") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        
        self.postal_code = dict.value(forKey: "postal_code") as? String ?? ""
        self.isDefault = dict.value(forKey: "is_default") as? Int ?? 0
        
    }
    static func == (lhs: AddressModel,rhs: AddressModel) ->Bool{
        return lhs.id == rhs.id
    }
}
    
