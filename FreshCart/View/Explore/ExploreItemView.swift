//
//  ExploreItemView.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI

struct ExploreItemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var itemsVM = ExploreItemViewMD(CategoryObj: ExploreMD(dict: [:]))
    
    var columns = [
        GridItem(.flexible(),spacing: 14),
        GridItem(.flexible(),spacing: 14)
    ]
    
    var body: some View {
        VStack{
            
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("left")
                            .resizable()
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                    Text(itemsVM.Obj.name)
                        .font(.system(size: 20,weight: .bold, design: .default))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.black)
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                 
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,10)
            
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(itemsVM.ListArr,id: \.id){
                        obj in
                        ProductDisplay(Obj: obj,width:.infinity) {
                            CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1, didDone: { isDone, message in
                                self.itemsVM.errorMessage = message
                                self.itemsVM.showError = true
                            })
          
                            
                            
                        }
                      
                    }
                    .padding(.vertical,10)
                }).padding(.horizontal,5)
                
               
            }
            
            .padding(.bottom,.bottomInsets)
                Spacer()
        }
        .alert( isPresented: $itemsVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(itemsVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }

        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    NavigationStack{
        ExploreItemView(itemsVM: ExploreItemViewMD(CategoryObj: ExploreMD(dict: [   "cat_id": 1,
                                                                                    "cat_name": "Frash Fruits & Vegetable",
                                                                                    "image": "http://localhost:3001/img/category/20230726155407547qM5gSxkrCh.png",
                                                                                    "color": "53B175"])))
    }
}
