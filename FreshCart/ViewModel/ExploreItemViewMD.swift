//
//  ExploreItemViewMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI


class ExploreItemViewMD: ObservableObject {
    
    @Published var Obj: ExploreMD = ExploreMD(dict: [:])
    @Published var errorMessage:String = ""
    @Published var showError: Bool = false
    
    @Published var ListArr:[ProductModel] = []
    
    
    
    init(CategoryObj: ExploreMD){
        
        self.Obj = CategoryObj
        serviceCallList()
    }
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: ["cat_id": self.Obj.id], path: Globs.SV_Explore_category_item_list, isToken: true ) { responseObj in
            
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    
                    self.ListArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                    debugPrint("Loi me roi")
                }
            }
            
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    
}

