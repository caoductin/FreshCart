//
//  ExploreView.swift
//  FreshCart
//
//  Created by cao duc tin  on 14/9/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var exploreVM = ExploreViewMD.shared
    @State var txt:String = ""
    
    var colums = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            Text("Product")
                .font(.system(.title2, design: .default, weight: .bold))
                .frame(minWidth: 0,maxWidth: .infinity)
                .padding(.bottom,5)
            
                .background(.white)
                .shadow(color: .black.opacity(2), radius: 1)
        
            SearchTextField(txt: $txt, title: "Search product", placeholder:"Search Product")
            ScrollView {
                LazyVGrid(columns: colums,spacing: 20, content: {
                    ForEach(exploreVM.listArr,id: \.id){
                        obj in
                        NavigationLink {
                            ExploreItemView(itemsVM: ExploreItemViewMD(CategoryObj: obj))
                        } label: {
                            ExploreCategoryDisplay(CategoryObj: obj)
                                .aspectRatio(1, contentMode: .fit)
                        }

                        
                      
                    }
                })
                .padding(.horizontal,10)
                .padding(.vertical,10)
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        ExploreView()
    }
}
