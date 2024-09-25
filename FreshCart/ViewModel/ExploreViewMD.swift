//
//  ExploreViewMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI

class ExploreViewMD:  ObservableObject {
    static var shared: ExploreViewMD = ExploreViewMD()
    @Published var selected:Int = 0
    @Published var txtSearch:String = ""
    
    @State var errorMessage:String = ""
    @State var showError: Bool = false

    @Published var listArr:[ExploreMD] = []


    init(){
        serviceCallGetItem()
    }
    
    
    //MARK: ServiceCall

    func serviceCallGetItem(){
        ServiceCall.post(parameter: [:], path: Globs.SV_Explore_category_list, isToken: true ) { responseObj in
         
                   if let response = responseObj as? NSDictionary {
                       debugPrint("chay thanh cong \(self.listArr)")
                       if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                           
                               self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                                   
                                   return ExploreMD(dict: obj as? NSDictionary ?? [:])
                               })
                               debugPrint("this is offerArr\(self.listArr)")
                               
                           
                           
                       }else{
                           self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                           self.showError = true
                           debugPrint("Loi me roi\(self.listArr)")
                       }
                   }
               
           } failure: { error in
               self.errorMessage = error?.localizedDescription ?? "Fail"
               self.showError = true
           }
       }
}

