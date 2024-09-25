//
//  FavouriteViewModel.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI

class FavouriteViewModel:ObservableObject {
    static var shared: FavouriteViewModel = FavouriteViewModel()

    @State var errorMessage:String = ""
    @State var showError: Bool = false

    @Published var listArr:[ProductModel] = []


    init(){
        serviceCallGetItem()
    }
    
    
    //MARK: ServiceCall
   func serviceCallGetItem(){
            ServiceCall.post(parameter: [:], path: Globs.SV_Favorite_list, isToken: true ) { responseObj in
                if let response = responseObj as? NSDictionary {
                   
                    if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                        
                        self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        }) 
                        debugPrint("chay me roi")
                    
                    }else{
                        self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                        self.showError = true
                    }
                }
            } failure: { error in
                debugPrint("fail me roi")
                self.errorMessage = error?.localizedDescription ?? "Fail"
                self.showError = true
            }
        }
//
//    func serviceCallGetItem(){
//        ServiceCall.post(parameter: [:], path: Globs.SV_Favorite_remove_add, isToken: true ) { responseObj in
//         
//                   if let response = responseObj as? NSDictionary {
//                       debugPrint("chay thanh cong \(self.listArr)")
//                       if response.value(forKey: KKey.status) as? String ?? "" == "1" {
//                           
//                      
//                               self.listArr = response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
//                                   
//                                   return ProductModel(dict: obj as? NSDictionary ?? [:])
//                               })
//                               debugPrint("this is offerArr\(self.listArr)")
//
//                           
//                       }else{
//                           self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
//                           self.showError = true
//                           debugPrint("Loi me roi\(self.offerArr)")
//                       }
//                   }
//               
//           } failure: { error in
//               self.errorMessage = error?.localizedDescription ?? "Fail"
//               self.showError = true
//           }
//       }
}


