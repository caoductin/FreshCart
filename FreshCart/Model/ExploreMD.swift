//
//  ExploreMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI

struct ExploreMD: Identifiable,Equatable {
    //    var id: ObjectIdentifier
    
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    var color: Color = .black

    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "cat_id") as? Int ?? 0
        
        self.name = dict.value(forKey: "cat_name") as? String ?? ""
        
        self.image = dict.value(forKey: "image") as? String ?? ""
        
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
        
    }
    static func == (lhs: ExploreMD,rhs: ExploreMD) ->Bool{
        return lhs.id == rhs.id
    }
}
    
