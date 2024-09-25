//
//  DeliveryAddressViewMD.swift
//  FreshCart
//
//  Created by cao duc tin  on 20/9/24.
//

import SwiftUI

class DeliveryAddressViewMD:  ObservableObject {
    static var shared: DeliveryAddressViewMD = DeliveryAddressViewMD()
    
    @Published var errorMessage:String = ""
    @Published var showError: Bool = false
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtAddress: String = ""
    @Published var txtCity: String = ""
    @Published var txtState: String = ""
    @Published var txtPostalCode: String = ""
    @Published var txtTypeName: String = "Home"
    
    
    @Published var listArr:[AddressModel] = []
    @Published var total: String = ""
    
    init(){
        serviceCallGetItem()
    }
    
    func clearAll(){
        txtName = ""
        txtMobile = ""
        txtAddress = ""
        txtCity = ""
        txtState = ""
        txtPostalCode = ""
        txtTypeName = ""
        
    }
    func setData(obj: AddressModel){
        
        txtName = obj.name
        txtMobile = obj.phone
        txtAddress = obj.address
        txtCity = obj.city
        txtState = obj.city
        txtPostalCode = obj.postal_code
        txtTypeName = obj.typeName
        
        
    }
    
    
    //MARK: ServiceCall
    func serviceCallGetItem(){
        ServiceCall.post(parameter: [:], path: Globs.SV_ADDRESSLIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return AddressModel(dict: obj as? NSDictionary ?? [:])
                    })
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                    
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
    
    func serviceCallRemove(obj: AddressModel){
        ServiceCall.post(parameter: ["address_id": obj.id], path: Globs.SV_REMOVE_ADDRESSLIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
             
  
                    self.serviceCallGetItem()
                    debugPrint("chay me roi showError\(self.showError)")
                    
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
    func serviceCallAddAddress(didDone: ((  )->())? ) {
        ServiceCall.post(parameter: ["name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode  ], path: Globs.SV_ADD_ADDRESSLIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallGetItem()
                    didDone?()
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

    func serviceCallUpdateAddress( Obj: AddressModel?, didDone: (( )->())? ) {
        
        if(txtName.isEmpty){
            self.errorMessage = "please enter the name"
            self.showError = true
            return
        }
        if(txtCity.isEmpty){
            self.errorMessage = "Please enter the city name"
            self.showError = true
            return
        }
        if(txtState.isEmpty){
            self.errorMessage = "please enter the State"
            self.showError = true
            return
            
        }
        
        ServiceCall.post(parameter: ["address_id":  Obj?.id ?? "", "name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode ], path: Globs.SV_UPDATE_ADDRESSLIST, isToken: true ) { responseObj in
                if let response = responseObj as? NSDictionary {
                    if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                        self.clearAll()
                        self.serviceCallGetItem()
                        didDone?()
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
