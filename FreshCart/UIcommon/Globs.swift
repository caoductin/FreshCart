//
//  Globs.swift
//  FreshCart
//
//  Created by cao duc tin  on 6/9/24.
//

import SwiftUI

struct Globs{
    static let  AppName = "Groceries Store"
    
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    static let userpayload = "user_payload"
    
    static let userLogin = "user_login"
    
    static let SV_LOGIN = BASE_URL + "login"
    
    static let SV_SIGNUP = BASE_URL + "sign_up"
    
    static let SV_HOME = BASE_URL + "home"
        
    static let SV_ProductDetail = BASE_URL + "product_detail"
    
    static let SV_Favorite_list = BASE_URL + "favorite_list"
    
    static let SV_Favorite_remove_add = BASE_URL + "add_remove_favorite"
    
    static let SV_MY_ORDERS_LIST = BASE_URL + "my_order"
    static let SV_MY_ORDERS_DETAIL = BASE_URL + "my_order_detail"
     
    
    static let SV_ADD_TO_CART = BASE_URL + "add_to_cart"
    
    static let SV_UPDATE_CART = BASE_URL + "update_cart"
    
    static let SV_CART_LIST = BASE_URL + "cart_list"
    
    static let SV_ORDER_PLACE = BASE_URL + "order_place"

    
    
    
    static let SV_REMOVE_CART = BASE_URL + "remove_cart"
    
    static let SV_Explore_category_list = BASE_URL + "explore_category_list"
    
    static let SV_Explore_category_item_list = BASE_URL + "explore_category_items_list"
    
    //ADDRESS API
    static let SV_ADD_ADDRESSLIST = BASE_URL + "add_delivery_address"
    
    static let SV_UPDATE_ADDRESSLIST = BASE_URL + "update_delivery_address"
    
    static let SV_ADDRESSLIST = BASE_URL + "delivery_address"
    
    static let SV_REMOVE_ADDRESSLIST = BASE_URL + "delete_delivery_address"
    
    static let SV_PROMO_CODE_LIST = BASE_URL + "promo_code_list"
    
    
    
    static let SV_PAYMENT = BASE_URL + "payment_method"
    
    static let SV_REMOVE_PAYMENT = BASE_URL + "remove_payment_method"
    
    static let SV_ADD_PAYMENT = BASE_URL + "add_payment_method"

    

    //when i use static variable . i can call it but don't need to create a instant of the struct
    
}

struct KKey{
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
    
}

class Utils{
    class func UDSET(data:Any, key: String){
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func UDValue( key: String) -> Any{
        return UserDefaults.standard.value(forKey: key) as Any
 
    }
    class func UDValueBool(key: String) -> Bool{
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
 
    }
    class func UDValueTrueBool(key: String) -> Bool{
        return UserDefaults.standard.value(forKey: key) as? Bool ?? true
 
    }
    class func UDRemove(key:String){
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
