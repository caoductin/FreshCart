//
//  ProductDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 15/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDisplay: View {
    @State var Obj: ProductModel = ProductModel(dict: [:])
 
    @State var width:Double = 180
    var didAction: (()-> ())?
    var body: some View {
        NavigationLink(destination: ProductDetailView(ProductDetailVM: ProductDetailViewMD(obj: Obj))) {
            VStack{
                
                WebImage(url: URL(string: Obj.image))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(width: 120, height: 120, alignment: .center)
                
                
                Spacer()
                
                Text(Obj.name)
                    .font(.system(.callout, design: .default, weight: .bold))
                    .frame(minWidth: 0,maxWidth: .infinity, alignment: .center)
                
                Text("\(Obj.unitValue)\(Obj.unitName) , price")
                    .font(.customfont(.medium, fontSize: 15))
                    .foregroundStyle(.gray)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                
                Spacer()
                HStack{
                    Text(String(format: "$%.2f", Obj.price))
                        .font(.system(.title3, design: .default, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    
                    Button{
                        didAction?()
                    }
                label:{
                    Image(systemName: "plus.app")
                    
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width:30,height: 30)
                }
                    
                }
            }
            .padding()
            .frame(width: width,height:UIScreen.main.bounds.height/4)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue,lineWidth: 1)
                    .cornerRadius(10, corner: .allCorners)
            }
        }
            
    }
}

#Preview {
    ProductDisplay(Obj: ProductModel(dict: ["type_id": 1,
                                            "type_name": "Pulses",
                                            "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                            "color": "F8A44C"]))
}
