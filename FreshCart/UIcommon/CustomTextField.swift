//
//  CustomTextField.swift
//  FreshCart
//
//  Created by cao duc tin  on 27/8/24.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placehodler"
    @State var keyboardType: UIKeyboardType = .default
    @Binding var isShowPassword: Bool
    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.regular, fontSize: 16))
                .foregroundStyle(.black.opacity(0.8))
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            if (isShowPassword) {
                SecureField(placeholder, text: $txt)
                    .frame(height: 35)
            }
            else{
                TextField(placeholder, text: $txt)
                    .tint(.white)
                    .autocorrectionDisabled(true )                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.none)
                    .frame(height: 35)
            }
            
            Divider()
        }
        
    }
}
struct CustomTextField: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placehodưler"
    @State var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack{
            Text(title)
                .font(.customfont(.regular, fontSize: 16))
                .foregroundStyle(.black.opacity(0.8))
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
       
 
                TextField(placeholder, text: $txt)
                    .tint(.white)
                    .keyboardType(keyboardType)
                    .frame(height: 35)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)

            
            Divider()
        }
        
    }
}

//#Preview {
//    @State  var txt = ""
//    return CustomTextField(txt: $txt)
//        .padding(20)
//}
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        @State var txt = ""
        @State var isShowPassword = false
        
        return CustomSecureField(txt: $txt, isShowPassword: $isShowPassword)
            .padding(20)
            .previewLayout(.sizeThatFits)  // Optional: Adjusts the layout to fit the content size
    }
}
