//
//  AccountView.swift
//  FreshCart
//
//  Created by cao duc tin  on 20/9/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(Color(red: 0.2, green: 0.6, blue: 0.8))
                    
                    VStack{
                        Text("Cao Duc Tin")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Text("caoductintin@gmail.com")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .tint(Color(hex: "828282"))
                    }
                    
                    .padding(.horizontal,10)
                    
                    
                    Spacer()
                    
                }
                .padding(.horizontal,10)
                
                Divider()
                
                ScrollView{
                    LazyVStack{
                        VStack{
                            
                            AccountDisplay(imageIcon: "cart.circle", title: "Order")
                            AccountDisplay(imageIcon: "location.circle.fill", title: "My Address")
                            NavigationLink {
                                PaymentMethodView()
                                
                            } label: {
                                AccountDisplay(imageIcon: "person.crop.square.filled.and.at.rectangle", title: "Payment")
                                
                            }
                            .foregroundStyle(.black)
                            
                            NavigationLink {
                                PromoCodeView()
                            } label: {
                                AccountDisplay(imageIcon: "barcode", title: "Pro Code")
                                
                            }
                            .foregroundStyle(.black)
                            
                            
                            AccountDisplay(imageIcon: "bell.badge", title: "Notifications")
                            
                            
                            AccountDisplay(imageIcon: "questionmark.circle", title: "Help")
                            
                            
                            
                            Button(action: {
                                MainViewModel.shared.logout()
                            }, label: {
                                ZStack {
                                    Text("Log Out")
                                        .font(.system(.title, design: .default, weight: .bold))
                                    
                                }
                            })
                            .frame(minWidth: 0,maxWidth: .infinity)
                            .frame(minHeight: 60,maxHeight: 60)
                            .background(Color.darkGray.opacity(0.4))
                            .cornerRadius(10, corner: .allCorners)
                            .padding(.horizontal,20)
                            
                        }
                    }
                }
                
                Spacer()
                
                
            }
            .padding(.top,.topInsets)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    NavigationStack{
        AccountView()
    }
}
