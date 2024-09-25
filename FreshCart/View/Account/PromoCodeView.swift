//
//  PromoCodeView.swift
//  FreshCart
//
//  Created by cao duc tin  on 21/9/24.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var PromoVM = PromoCodeVM.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PromoCodeModel) -> () )?
    var body: some View {
        ZStack{
            
            
            ScrollView {
                LazyVStack {
                    if (PromoVM.listArr.count > 0 ){
                        ForEach(PromoVM.listArr,id:\.id){obj in
                            VStack{
                                HStack {
                                    Text(obj.title)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Text(obj.code)
                                        .font(.customfont(.bold, fontSize: 15))
                                        .foregroundColor(.primaryApp)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.secondaryText.opacity(0.3))
                                        .cornerRadius(5)
                                }
                                
                                Text(obj.description)
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.secondaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    }
                    else{
                        Text("There is no PromoCode")
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                    }
                    .padding(.horizontal,10)
                    .padding(.top,.topInsets + 60)
                    .padding(.bottom,.bottomInsets + 60)
                    
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
                        Text("Promo Code")
                            .font(.customfont(.bold, fontSize: 23))
                            .frame(height: 54)
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                            
                                .resizable()
                                .scaledToFit()
                                .fontWeight(.bold)
                                .frame(width: 20,height: 20)
                        })
                        
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.top,50)
                    .background(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3)
                    Spacer()
                    
                    
                }
                
                
            }
            
            .navigationTitle("")
            .navigationBarBackButtonHidden()
            .toolbar(.hidden)
            .ignoresSafeArea()
        }
    }
    
    #Preview {
        PromoCodeView()
    }
