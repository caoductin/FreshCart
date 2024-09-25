//
//  ProductDetailViewMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI

class ProductDetailViewMD: ObservableObject {
    
    @Published var Obj: ProductModel = ProductModel(dict: [:])
    @Published var errorMessage:String = ""
    @Published var showError: Bool = false
    
    @Published var nutritionArr:[NutritionMD] = []
    @Published var imagesArr:[ImageMD] = []
    
    
    @Published var isFav: Bool = false
    @Published var isShowDetail: Bool = false
    @Published var isShowNutrition: Bool = false
    @Published var qty: Int = 1
    
    init(obj: ProductModel){
        self.isFav = obj.isFav
        self.Obj = obj
        serviceCallProductDetail()
    }
    
    func showDetail(){
        isShowDetail = !isShowDetail
    }
    func showNutrition(){
        isShowNutrition = !isShowNutrition
    }
    func addSubQTY(isAdd: Bool = true){
        if(isAdd){
            qty += 1
            if (qty > 99) {
                qty = 99
            }
            
        }
        else {
            qty -= 1
            if (qty < 1) {
                qty = 1
            }
        }
    }
    
    //MARK: ServiceCall
    
    func serviceCallProductDetail(){
        ServiceCall.post(parameter: ["prod_id": Obj.prodId], path: Globs.SV_ProductDetail, isToken: true ) { responseObj in
            
            if let response = responseObj as? NSDictionary {
                debugPrint("chay thanh cong \(self.nutritionArr)")
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        self.Obj = ProductModel(dict: payloadObj)
                        
                        self.nutritionArr = (payloadObj.value(forKey: "nutrition_list") as? NSArray ?? []).map({ obj in
                            
                            return NutritionMD(dict: obj as? NSDictionary ?? [:])
                            //                                   return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        
                        self.imagesArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({ obj in
                            
                            return ImageMD(dict: obj as? NSDictionary ?? [:])
                            //                                   return TypeMD(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                    debugPrint("Loi me roi\(self.nutritionArr)")
                }
            }
            
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    func serviceCallAddRemoveFav(){
        ServiceCall.post(parameter: ["prod_id": 5], path: Globs.SV_Favorite_remove_add, isToken: true ) { responseObj in
            
            if let response = responseObj as? NSDictionary {
                debugPrint("chay thanh cong \(self.nutritionArr)")
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                 
                    self.isFav = !self.isFav
                    HomeVM.shared.serviceCallGetItem()
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
                    self.showError = true
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                    debugPrint("Loi me roi\(self.nutritionArr)")
                }
            }
            
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
}
