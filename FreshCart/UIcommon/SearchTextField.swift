//
//  SearchTextField.swift
//  FreshCart
//
//  Created by cao duc tin  on 14/9/24.
//

import SwiftUI

struct SearchTextField: View {
        @Binding var txt: String
        @State var title: String = "Title"
        @State var placeholder: String = "PlaceHolder"

        var body: some View {
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width:14,height: 14)
                    .padding(.trailing,8)
                
                    TextField(placeholder, text: $txt)
                        .tint(.white)
                        .frame(height: 35)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .font(.system(size: 18))
            }
            .padding(.vertical,10)
            .padding(.horizontal,20)
            .background(Color(hex: "#dae0df"))
        
            .cornerRadius(20, corner: .allCorners)
            .padding(.horizontal,20)
            
        }
    

}

#Preview {
    @State var txt = ""
    return SearchTextField(txt: $txt)
}
