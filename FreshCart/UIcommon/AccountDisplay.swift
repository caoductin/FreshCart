//
//  AccountDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 20/9/24.
//

import SwiftUI

struct AccountDisplay: View {
    @State var imageIcon: String = ""
    @State var title: String = ""
    var body: some View {
            HStack(spacing: 15){
                Image(systemName: imageIcon)
                   
                    .font(.system(size: 40))
               
                
                Text(title)
                    .font(.system(size: 25, weight: .regular, design: .default))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                
            }
            .padding(.horizontal,10)
            .padding(.vertical,20)
            
            Divider()
    }
}

#Preview {
    AccountDisplay(imageIcon: "xmark",title: "Order")
}
