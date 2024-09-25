//
//  SectionTitle.swift
//  FreshCart
//
//  Created by cao duc tin  on 15/9/24.
//

import SwiftUI

struct SectionTitle: View {
    @State var titleLeft:String = "Title left"
    @State var titleRight: String = "Title right"
    var didTab:(()->())?
    var body: some View {
        HStack{
            Text(titleLeft)
             
                .font(.customfont(.bold, fontSize: 26))
            Spacer()
            Text(titleRight)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundStyle(.green.opacity(0.8))

        }
        .frame(height: 35)

    }
}

#Preview {
    SectionTitle()
}
