//
//  AddPaymentMethodView.swift
//  FreshCart
//
//  Created by cao duc tin  on 21/9/24.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var payVM = PaymentViewModel.shared
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                    
                    
                    CustomTextField(txt: $payVM.txtName, title: "Name", placeholder: "Enter you name")
                    
                    CustomTextField(txt: $payVM.txtCardNumber, title: "Card Number", placeholder: "Enter card number", keyboardType: .numberPad)
                    
                    
                    
                    HStack{
                        CustomTextField(txt: $payVM.txtCardMonth, title: "MM", placeholder: "Enter Month", keyboardType: .numberPad)
                        CustomTextField(txt: $payVM.txtCardYear, title: "YYYY", placeholder: "Enter Year", keyboardType: .numberPad)
                    }
                    
                    
                    ButtonCustom(title:  "Add Payment Method",image: nil) {
                        
                        payVM.serviceCallAdd {
                           dismiss()
                        }
                        
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                
            }
            
            VStack {
                
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    
                    Spacer()
                    
                    Text("Add Payment Method")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
        }
        
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddPaymentMethodView()
}
