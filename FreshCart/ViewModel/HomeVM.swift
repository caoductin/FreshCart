//
//  HomeVM.swift
//  FreshCart
//
//  Created by cao duc tin  on 14/9/24.
//

import SwiftUI

class HomeVM: ObservableObject {
    static var shared: HomeVM = HomeVM()
    @Published var selected:Int = 0
    @Published var txtSearch:String = ""
    
    @Published var errorMessage:String = ""
    @Published var showError: Bool = false
    
    @Published var offerArr:[ProductModel] = []
    @Published var bestArr:[ProductModel] = []

    @Published var listArr:[ProductModel] = []

    @Published var typeArr:[TypeMD] = []

    init(){
        serviceCallGetItem()
    }
    
    
    //MARK: ServiceCall

    func serviceCallGetItem(){
           ServiceCall.post(parameter: [:], path: "http://localhost:3001/api/app/home", isToken: true ) { responseObj in
         
                   if let response = responseObj as? NSDictionary {
                       debugPrint("chay thanh cong \(self.offerArr)")
                       if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                           
                           if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                               self.offerArr = (payloadObj.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                                   
                                   return ProductModel(dict: obj as? NSDictionary ?? [:])
                               })
                               debugPrint("this is offerArr\(self.offerArr)")
                               
                               self.bestArr = (payloadObj.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                                   
                                   return ProductModel(dict: obj as? NSDictionary ?? [:])
                               })
                               for data in self.bestArr{
                                   print(data.image)
                               }
                               
                               self.listArr = (payloadObj.value(forKey: "list") as? NSArray ?? []).map({ obj in
                                   
                                   return ProductModel(dict: obj as? NSDictionary ?? [:])
                               })
                               
                               
                               self.typeArr = (payloadObj.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                                   
                                   return TypeMD(dict: obj as? NSDictionary ?? [:])
                               })
                           }
                           
                           
                       }else{
                           self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                           self.showError = true
                           debugPrint("Loi me roi\(self.offerArr)")
                       }
                   }
               
           } failure: { error in
               self.errorMessage = error?.localizedDescription ?? "Fail"
               self.showError = true
           }
       }
}


