//
//  ServiceCall.swift
//  FreshCart
//
//  Created by cao duc tin  on 29/8/24.
//

import Foundation


import SwiftUI
import UIKit

class ServiceCall {
    
    class func post(parameter: NSDictionary, path: String, isToken: Bool = true, withSuccess: @escaping ( (_ responseObj: AnyObject?) ->() ), failure: @escaping ( (_ error: Error?) ->() ) ) {
        
        DispatchQueue.global(qos: .background).async {
                   
            var parameterData = NSMutableData()
            
            let dictKey = parameter.allKeys as! [String] // get the key of the dictionary
            var i = 0;
            
            for dictKey in dictKey {
                           if let values = parameter.value(forKey: dictKey) as? String{
                               //  //   Handles the case where the value is a String
                               parameterData.append(String.init(format: "%@%@=%@", i==0 ? "" : "&" ,dictKey, values.replacingOccurrences(of: "+", with: "%2B")).data(using: String.Encoding.utf8)!)
                               //each %@ represent each paramater in String.init . In the first loop , the begining of the string will be empty
                           }else{
                               // Handles the case where the value is not a String (e.g., Int, Double)
                               parameterData.append(String.init(format: "%@%@=%@", i==0 ? "" : "&" ,dictKey, parameter.value(forKey: dictKey) as! CVarArg) .data(using: String.Encoding.utf8)!)
                           }
                           
                           i += 1
                       }
            
        
            
                    var request = URLRequest(url: URL(string: path)!,timeoutInterval: Double.infinity)
                    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                
                    if(isToken){
//                                       #if DEBUG
//                                       request.addValue( "HFYsmcPickQlPmWMNUEZ" , forHTTPHeaderField: "access_token")
//                                       #else
                        if (MainViewModel.shared.userObj.authToken.isEmpty){
                            request.addValue( "w0Xjhwha33GrEB1CE6lq" , forHTTPHeaderField: "access_token")
                        }
                        else{
                            request.addValue( MainViewModel.shared.userObj.authToken , forHTTPHeaderField: "access_token")
                        }
//                                       #endif
                    }
                    request.httpMethod = "POST"
                    request.httpBody = parameterData as Data
            
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
               
                        if let error = error {
                            DispatchQueue.main.async {
                                failure(error)
                            }
                        }
                        else{
                            if let data = data{
                                do {
                                    let jsonDictionary = try JSONSerialization.jsonObject(with: data,options: .mutableContainers) as? NSDictionary
                                    
                                    debugPrint("response: " , jsonDictionary)
                                    
                                    DispatchQueue.main.async{
                                        withSuccess(jsonDictionary) // call the closure that success
                                    }
                                    
                                }
                                catch
                                {
                                    DispatchQueue.main.async {
                                        failure(error)// call the closure the failure
                                    }
                                }

                            }
                        }
                        guard let data = data else {
                        
                        return
                      }
//                      print(String(data: data, encoding: .utf8)!)
                    }
            
                    task.resume()
        }
        

        
    }

    
}
