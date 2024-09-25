//
//  ImageMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI

class ImageMD: Identifiable,Equatable {
    //    var id: ObjectIdentifier
    
    var id: Int = 0
    var prod_id: Int = 0
    var image: String = ""


    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "img_id") as? Int ?? 0
        
        
        self.prod_id = dict.value(forKey: "prod_id") as? Int ?? 0
        
        
        self.image = dict.value(forKey: "image") as? String ?? ""
        
    }
    static func == (lhs: ImageMD,rhs: ImageMD) ->Bool{
        return lhs.id == rhs.id
    }
}
