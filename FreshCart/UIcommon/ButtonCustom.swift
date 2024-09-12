//
//  ButtonCustom.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/7/24.
//

import SwiftUI

struct ButtonCustom: View {
    @State var title: String = "Title"
    @State var startColor: Color = .blue.opacity(0.9)
    @State var endColor: Color = .blue
    @State var image: String? = "icons8-google-50"
    var colorText: Color = .white
   
    var action: (() -> Void)?
    var body: some View {
        
         Button {
             if let action = action{
                 action()
             }
         } label: {
             if let image = image{
                 Image(image)
                     .resizable()
                     .frame(width: 40,height: 40)
                     .foregroundStyle(.white)
             }
         
             Text(title)
                 .font(.system(size: 20))
                 .foregroundStyle(.white)
     
                 .padding(.vertical,10)
         }
         .padding(.vertical,10)
         .frame(width: 350)
         .background(
             LinearGradient(gradient: Gradient(colors: [startColor, endColor])/*@END_MENU_TOKEN@*/, startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing))
         .cornerRadius(20) // Rounded corners for the background
         .shadow(radius: 20)
    }
}

#Preview {
    ButtonCustom {
        
    }
}
