//
//  PromoCodeVM.swift
//  FreshCart
//
//  Created by cao duc tin  on 21/9/24.
//

import SwiftUI

class PromoCodeVM:  ObservableObject {
    static var shared: PromoCodeVM = PromoCodeVM()
        
        
        @Published var showError = false
        @Published var errorMessage = ""
        
        @Published var listArr: [PromoCodeModel] = []
        
        
        init() {
            serviceCallList()
        }
        
        //MARK: ServiceCall
        
        func serviceCallList(){
            ServiceCall.post(parameter: [:], path: Globs.SV_PROMO_CODE_LIST, isToken: true ) { responseObj in
                if let response = responseObj as? NSDictionary {
                    if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                        
                        
                        self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                            return PromoCodeModel(dict: obj as? NSDictionary ?? [:])
                        })
                    
                    }else{
                        self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                        self.showError = true
                    }
                }
            } failure: { error in
                self.errorMessage = error?.localizedDescription ?? "Fail"
                self.showError = true
            }
        }
}
