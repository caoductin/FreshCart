//
//  UserMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 12/9/24.
//

import SwiftUI

struct UserMD: Identifiable,Equatable {
//    var id: ObjectIdentifier
    
    var id: Int = 0
    var username: String = ""
    var name: String = ""
    var email: String = ""
    var mobile: String = ""
    var mobile_code: String = ""
    var auth_token: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "user_id") as? Int ?? 0
        
        self.username = dict.value(forKey: "username") as? String ?? ""
        
        self.name = dict.value(forKey: "name") as? String ?? ""

        self.email = dict.value(forKey: "email") as? String ?? ""
        
        self.mobile = dict.value(forKey: "mobile") as? String ?? ""

        self.mobile_code = dict.value(forKey: "mobile_code") as? String ?? ""

        self.auth_token = dict.value(forKey: "auth_token") as? String ?? ""

    }
    static func == (lhs: UserMD,rhs: UserMD) ->Bool{
        return lhs.id == rhs.id
    }
    
//    {
//        "status": "1",
//        "payload": {
//            "user_id": 2,
//            "username": "testuser",
//            "name": "",
//            "email": "test@gmail.com",
//            "mobile": "",
//            "mobile_code": "",
//            "auth_token": "ZInvJEaL4Waf4O1SwMPp",
//            "status": 1,
//            "created_date": "2023-07-25T05:27:32.000Z"
//        },
//        "message": "successfully"
//    }
}
