//
//  MainView.swift
//  FreshCart
//
//  Created by cao duc tin  on 12/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    @ObservedObject var homeVM = HomeVM.shared
    
    
    var body: some View {

        VStack{
            TabView(selection: $homeVM.selected) {
                HomeView().tag(0)
                CartView().tag(1)
                ExploreView().tag(2)
                FavouriteView().tag(3)
                AccountView().tag(4)
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }

            .onChange(of: homeVM.selected) { oldValue, newValue in
                debugPrint("sel Tab:\(newValue)")
            }
            .frame(minWidth: 0,maxWidth: .infinity)
            .frame(minHeight: 0,maxHeight: .infinity)
            HStack(alignment: .center){
                TabButton(title: "Home", image: "house", isSelected: homeVM.selected == 0) {

                    print("Button tab")

                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selected = 0
                        }
                    }
                }
                TabButton(title: "Cart", image: "cart", isSelected: homeVM.selected == 1) {
 
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selected = 1
                        }
                    }
                }
                TabButton(title: "Explore", image: "magnifyingglass.circle", isSelected: homeVM.selected == 2) {
          
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selected = 2
                        }
                    }
                }
            
                TabButton(title: "Favorite",image:"heart",isSelected:    homeVM.selected == 3) {
              
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selected = 3
                        }
                    }
                }
                TabButton(title: "Account",image:"person.crop.circle",isSelected:    
                            homeVM.selected == 4) {
          
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selected = 4
                        }
                    }
                }
                
                


            }
            .padding(.bottom,.bottomInsets)
            .padding(.top,10)
            .background(Color.white.opacity(0.9))
            .cornerRadius(10, corner: .allCorners)
            .shadow(color:Color.black.opacity(0.1),radius: 2,x:0,y:-2)
           
           
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
