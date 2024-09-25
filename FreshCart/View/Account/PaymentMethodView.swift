//
//  PaymentMethodView.swift
//  FreshCart
//
//  Created by cao duc tin  on 21/9/24.
//

import SwiftUI

struct PaymentMethodView: View {
    @Environment(\.dismiss) var dismiss
    @State var isPicker: Bool = false

       @StateObject var payVM = PaymentViewModel.shared
       var didSelect:( (_ obj: PaymentModel) -> () )?
       
       var body: some View {
           ZStack{
               
               ScrollView{
                   LazyVStack(spacing: 15) {
                       ForEach( payVM.listArr , id: \.id, content: {
                           pObj in
                           
                           HStack(spacing: 15) {
                                   
                               Image(systemName:"creditcard")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 35, height: 35)
                               
                               VStack(spacing: 4){
                                   Text(pObj.name)
                                       .font(.customfont(.bold, fontSize: 18))
                                       .foregroundColor(.primaryText)
                                       .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                   
                                   Text("**** **** **** \(pObj.cardNumber) ")
                                       .font(.customfont(.medium, fontSize: 15))
                                       .foregroundColor(.primaryApp)
                                       .multilineTextAlignment( .leading)
                                       .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                   
                               }
                               
                               Button {
                                   payVM.serviceCallRemove(pObj: pObj)
                               } label: {
                                   Image("close")
                                       .resizable()
                                       
                                       .scaledToFit()
                                       .frame(width: 20, height: 20)
                               }
                           }
                           .padding(15)
                           
                           .background(Color.white)
                           .cornerRadius(5)
                           .shadow(color: Color.black.opacity(0.15), radius: 2)
                           .onTapGesture {
                               if(isPicker) {
                                    dismiss()
                                   didSelect?(pObj)
                               }
                           }
                           


                       })
                   }
                   .padding(20)
                   .padding(.top, .topInsets + 46)
                   .padding(.bottom, .bottomInsets + 60)

               }
               
               
               VStack {
               
                   HStack{
                       
                       Button {
                           dismiss()
                       } label: {
                           Image(systemName: "chevron.backward")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 20, height: 20)
                       }

                       
                      
                       Spacer()
                       
                       Text("Payment Methods")
                           .font(.customfont(.bold, fontSize: 20))
                           .frame(height: 46)
                       Spacer()
                       
                       NavigationLink {
                           AddPaymentMethodView( )
                       } label: {
                           Image(systemName:"plus")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 20, height: 20)
                       }
                       
                       .foregroundColor(.primaryText)

                   }
                   .padding(.top, .topInsets)
                   .padding(.horizontal, 20)
                   .background(Color.white)
                   .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                   
                   Spacer()
                   
               }
               
               
               
           }
           .alert(isPresented: $payVM.showError, content: {
               Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage) )
           })
           .navigationTitle("")
           .navigationBarHidden(true)
           .navigationBarBackButtonHidden(true)
           .ignoresSafeArea()
       }
}

#Preview {
    PaymentMethodView()
}
