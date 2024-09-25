//
//  AddDeliveryAddressView.swift
//  FreshCart
//
//  Created by cao duc tin  on 21/9/24.
//

import SwiftUI

struct AddAddressView: View {
    @StateObject var addressVM:DeliveryAddressViewMD = DeliveryAddressViewMD.shared
    @State var Edit: Bool = false
    @State var obj: AddressModel?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing: 20){
                    HStack{
                        Button(action: {
                            addressVM.txtTypeName = "Home"
                  
                        }, label: {
                            Image(systemName: addressVM.txtTypeName == "Home" ? "smallcircle.filled.circle" : "circlebadge")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("Home")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        })
                        
                        Spacer()
                        Button(action: {
                            addressVM.txtTypeName = "Office"
                      
                        }, label: {
                            Image(systemName: addressVM.txtTypeName == "Office" ? "smallcircle.filled.circle" : "circlebadge")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("Office")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        })

                    }
                    .padding(.horizontal,50)
                    CustomTextField(txt: $addressVM.txtName, title: "Name", placeholder: "Enter your Name")
                    CustomTextField(txt: $addressVM.txtMobile, title: "Mobile", placeholder: "Enter your phone")
                    CustomTextField(txt: $addressVM.txtName, title: "Address", placeholder: "Enter your Address")
                    HStack {
                        CustomTextField(txt: $addressVM.txtName, title: "City", placeholder: "Enter your City")
                        CustomTextField(txt: $addressVM.txtName, title: "State", placeholder: "Your State")
                    }
                  
                    CustomTextField(txt: $addressVM.txtName, title: "Post Code", placeholder: "Enter your post Code")
                    
                    ButtonCustom(title: "Add your Address", startColor: .green, endColor: .blue, image: nil, colorText: .darkGray) { 
                        if(Edit){
                            addressVM.serviceCallUpdateAddress(Obj: obj) {
                                dismiss()
                            }
                        }
                        else{
                            addressVM.serviceCallAddAddress {
                                dismiss()
                            }
                        }
                    }
                }
                .padding(.horizontal,20)
                .padding(.top,.topInsets + 60)
            }
        
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("left")
                            .resizable()
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                    Spacer()
                    Text(Edit ? "Edit Delivery Address" : "Add Delivery Address")
                        .font(.customfont(.bold, fontSize: 23))
                        .frame(height: 54)
                    Spacer()
                    
                   
                    
                }
                .padding(.horizontal, 10)
                .padding(.top,50)
                .background(.white)
                .shadow(color: .black.opacity(0.2), radius: 3)
                Spacer()
    
            
            }
        
        }
        .onAppear(perform: {
            if let AddressObj = obj{
                addressVM.setData(obj: AddressObj)
            }
        })

        .alert( isPresented: $addressVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(addressVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea()

    }
    
    
}

#Preview {
    AddAddressView()
}
