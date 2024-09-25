//
//  DelivertyAdressView.swift
//  FreshCart
//
//  Created by cao duc tin  on 20/9/24.
//

import SwiftUI

struct DeliveryAdressView:  View {
    @Environment(\.dismiss) var dismiss
    @StateObject var deliveryAddress = DeliveryAddressViewMD.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: AddressModel) -> () )?
    var body: some View {
        ZStack{
            
            
            ScrollView {
                LazyVStack {
                    ForEach(deliveryAddress.listArr,id:\.id){obj in
                        HStack(spacing: 15){
                            VStack{
                                
                                HStack {
                                    Text(obj.name)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .padding(.bottom,5)
                                    Spacer()
                                    Text(obj.typeName)
                                        .font(.system(size: 14, weight: .semibold, design: .default))
                                        .padding(.horizontal,2)
                                        .background(.gray.opacity(0.4))
                                }
                                Text("\(obj.address), \(obj.city), \(obj.state), \(obj.postal_code)")
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                                
                                Text("\(obj.phone)")
                                    .foregroundStyle(.gray)
                                    .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                                    .padding(.top,5)
                                

                                
                            }
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.horizontal,10)
                        

                            VStack{
                                NavigationLink {
                                    AddAddressView(Edit: true, obj: obj)
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.primaryApp)
                                }
                                .padding(.bottom, 8)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "xmark.app")
                                        .resizable()
                                        .scaledToFit()
                                        .tint(.red)
                                        .frame(width: 20,height: 20)
                                }
                            }
                            .padding(.vertical,10)

                            
                        }
                        .padding(1)
                        .background(
                            RoundedRectangle(cornerRadius: 2 )
                                .fill(.white)
                                .shadow(color: .black.opacity(0.2), radius: 4)
                        )
                        
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
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 23))
                        .frame(height: 54)
                    Spacer()
                  
                    NavigationLink {
                        AddAddressView()
                    } label: {
                        Image(systemName: "plus")
                        
                            .resizable()
                            .scaledToFit()
                            .fontWeight(.bold)
                            .frame(width: 20,height: 20)
                    }

                    
                    
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
    NavigationStack{
        DeliveryAdressView()
    }
}
