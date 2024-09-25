//
//  FavouriteView.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteView: View {
    @StateObject var favoriteView = FavouriteViewModel.shared
    var body: some View {
        ZStack{
            ScrollView {
                LazyVStack {
                    ForEach(favoriteView.listArr,id:\.id){obj in
                        VStack{
                            HStack{
                                FavoriteDisplay(obj: obj)
                                
                                
                            }
                            .padding(.horizontal,10)
                            Divider()
                        }
                    }
                   
                   
                }
                .padding(.top,.topInsets + 40)
                .padding(.bottom,.bottomInsets + 60)
             
            }
            VStack{
                HStack{
                    Spacer()
                    Text("Favourite")
                        .font(.customfont(.bold, fontSize: 23))
                        .frame(height: 54)
                    Spacer()
                }
                
                .padding(.top,50)
                .background(.white)
                .shadow(color: .black.opacity(0.2), radius: 3)
                Spacer()
                ButtonCustom(title: "Add all to the card",image: nil)
                    .padding(.bottom,6)
            
            }
        
            
           
            
        }
        .onAppear(perform: {
            favoriteView.serviceCallGetItem()
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    FavouriteView()
}
