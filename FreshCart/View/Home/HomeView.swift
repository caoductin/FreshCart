//
//  HomeView.swift
//  FreshCart
//
//  Created by cao duc tin  on 14/9/24.
//

import SwiftUI


struct HomeView: View {
    @StateObject var homeVM = HomeVM.shared
    var body: some View {
        
        ScrollView {
            ZStack{
                VStack{
                    Image(systemName: "applelogo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.red)
                        .frame(width: 20)
                    HStack{
                        Image(systemName: "location.fill.viewfinder")
                            .frame(width:30)
                        Text("Dak Mil district, Dak Nong province")
                        
                    }
                    SearchTextField(txt: $homeVM.txtSearch, title: "Search product", placeholder: "Search product")
                    
                    
                    Image("bgPz")
                        .resizable()
                        .scaledToFill()
                    
                        .frame(height: 130)
                        .cornerRadius(10, corner: .allCorners)
                        .padding(.horizontal,20)
                    SectionTitle(titleLeft: "Exclusive Offer", titleRight: "See All"){
                        
                    }
                    .padding(.horizontal,20)
                    
                    
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing: 20) {
                            ForEach(homeVM.offerArr,id: \.id){
                                obj in
                                ProductDisplay(Obj: obj) {
                                    CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isdone, message in
                                        self.homeVM.errorMessage = message
                                        self.homeVM.showError = true
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                    .frame(minHeight: 0,maxHeight: 250)
                    //                .background(.gray.opacity(0.2))
                    
                    SectionTitle(titleLeft: "Best Selling", titleRight: "See All") {
                        
                    }
                    .padding(.horizontal,20)
                    //
                    //                    ScrollView(.horizontal,showsIndicators: false){
                    //                        LazyHStack {
                    //                            ForEach(homeVM.bestArr,id: \.id){
                    //                                obj in
                    //
                    //                                ProductDisplay(Obj: obj) {
                    //
                    //                                } .onAppear {
                    //                                    print("\(obj.image)")
                    //                                }
                    //                            }
                    //                        }
                    //                    }   .padding(.vertical,10)
                    //                        .padding(.horizontal,10)
                    //                        .frame(minHeight: 0,maxHeight: 250)
                    //    //                    .background(.gray.opacity(0.2))
                    if homeVM.bestArr.isEmpty {
                        Text("Loading best-selling products...")
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(homeVM.bestArr, id: \.id) { obj in
                                    ProductDisplay(Obj: obj) {
                                        CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isdone, message in
                                            self.homeVM.errorMessage = message
                                            self.homeVM.showError = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    SectionTitle(titleLeft: "Groceries", titleRight: "See All") {
                        
                    }
                    .padding(.horizontal,20)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(alignment: .center, content: {
                            ForEach(homeVM.typeArr, id: \.id) { obj in
                                CategoryDisplay(TypeObj: obj)
                            }
                        })
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                    .frame(minHeight: 0,maxHeight: 250)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack {
                            ForEach(homeVM.listArr,id: \.id){
                                obj in
                                ProductDisplay(Obj: obj) {
                                    CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1, didDone: { isDone, message in
                                        self.homeVM.errorMessage = message
                                        self.homeVM.showError = true
                                        print("cao duc tin")
                                    })
                                    
                                    
                                }
                            }
                        }
                    }   .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(minHeight: 0,maxHeight: 250)
                    //                    .background(.gray.opacity(0.2))
                }
                .padding(.bottom,5)
            }

        }
        .alert( isPresented: $homeVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(homeVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
//        .onAppear(perform: {
//            homeVM.serviceCallGetItem()
//        })
     
    }
    
}

#Preview {
    NavigationStack{
        HomeView()
    }
    
    
}
