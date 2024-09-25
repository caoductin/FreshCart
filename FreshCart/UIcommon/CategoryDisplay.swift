//
//  CategoryDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 15/9/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct CategoryDisplay: View {
    @State var color: Color = Color.yellow
    @State var TypeObj: TypeMD = TypeMD(dict: [:])
    var didAction: (()-> ())?
    var body: some View {
        HStack{
            WebImage(url: URL(string: TypeObj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
    
            
            Text("\(TypeObj.name)")
                .font(.system(size: 23, weight: .bold, design: .default))
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
       
           
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width/1.7,height:UIScreen.main.bounds.height/7.3)
        .background(color.opacity(0.3))
        .cornerRadius(20, corner: .allCorners)

    }
}

#Preview {
    CategoryDisplay(TypeObj: TypeMD(dict:["type_id": 1,
                              "type_name": "Pulses",
                              "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                              "color": "F8A44C"]))
}
