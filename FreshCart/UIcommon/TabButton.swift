//
//  TabButton.swift
//  FreshCart
//
//  Created by cao duc tin  on 14/9/24.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = ""
    @State var image: String = ""
    var isSelected:Bool = false
    var doAction:(() -> Void)? = nil
    

    var body: some View {
        Button {
            if let doAction = doAction{
                debugPrint("the button is tag")
                doAction()
            }
      
        } label: {
            VStack{
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:25,height: 25)
                Text(title)
                    .font(.system(size: 16, weight: .medium, design: .default))
            }
        }
        .foregroundStyle(isSelected == true ? .blue : .black)
        .frame(minWidth: 0,maxWidth: .infinity)

    }
}

#Preview {
    TabButton(title: "Home",image: "house")
}
