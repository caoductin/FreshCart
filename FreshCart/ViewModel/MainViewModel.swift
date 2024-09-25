//
//  MainViewModel.swift
//  FreshCart
//
//  Created by cao duc tin  on 27/8/24.
//

import Foundation
class MainViewModel: ObservableObject{
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtUserName: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = true
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserMD = UserMD(dict: [:])
    init(){
    #if DEBUG
        txtUserName = "user4"
      txtEmail = "test@gmail.com"
      txtPassword = "123456"
      #endif
    }
    
    func logout(){
        Utils.UDSET(data: false, key: Globs.userLogin)
        isUserLogin = false
    }
    

    //MARK: ServiceCall
    func serviceCallSignUp(){
        
        if (txtUserName.isEmpty){
            self.errorMessage = "please enter valid userName "
            self.showError = true
            return
        }
        
        if (txtEmail.isEmpty){
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
        }
        if (txtPassword.isEmpty){
            self.errorMessage = "Please enter valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["username": txtUserName ,"email": txtEmail,"password":txtPassword,"dervice_token": ""], path: Globs.SV_SIGNUP) { responseObj in
            if let respone = responseObj as? NSDictionary{
                if respone.value(forKey: KKey.status) as? String ?? "" == "1"{
                    
                    let payload = respone.value(forKey: KKey.payload) as? NSDictionary ?? [:]
                    self.setUserData(uDict: payload)
                    print(respone)
//                    self.errorMessage = respone.value(forKey: KKey.message) as? String ?? "Success"
//                    self.showError = true
                }
                else{
                    self.errorMessage = respone.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                    
                }
            }
        } failure: { error in
            //error is optional so we use optional chaining to safely access the localizedDescription property if it exsits	
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
            
        }

    }
    func serviceCallLogin(){
        
        if (txtEmail.isEmpty){
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
        }
        if (txtPassword.isEmpty){
            self.errorMessage = "Please enter valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["email": txtEmail,"password":txtPassword,"dervice_token": ""], path: Globs.SV_LOGIN) { responseObj in
            if let respone = responseObj as? NSDictionary{
                if respone.value(forKey: KKey.status) as? String ?? "" == "1"{
                   
                    
                    let payload = respone.value(forKey: KKey.payload) as? NSDictionary ?? [:]
                    self.setUserData(uDict: payload)
                    print(respone)// print to see the respone from server
                    DispatchQueue.main.async {
                        self.isUserLogin = true
                    }
                    print("this is a user login\(self.isUserLogin)")

//                    self.errorMessage = respone.value(forKey: KKey.message) as? String ?? "Success"
//                    self.showError = true
                }
                else{
                    self.errorMessage = respone.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                    
                }
            }
        } failure: { error in
            //error is optional so we use optional chaining to safely access the localizedDescription property if it exsits
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
            
        }

    }
    
    func setUserData(uDict: NSDictionary){
        Utils.UDSET(data: uDict, key: Globs.userpayload)
        Utils.UDSET(data: true, key: Globs.userLogin)
        self.userObj = UserMD(dict: uDict)
        self.isUserLogin = true
        
        self.txtEmail = ""
        self.txtPassword = ""
        self.txtUserName = ""   
        self.isShowPassword = false
        
    }


    
    
}
