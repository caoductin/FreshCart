//
//  FavoriteDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 18/9/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct FavoriteDisplay: View {
    @State var obj: ProductModel = ProductModel(dict: [:])
    var body: some View {
            WebImage(url: URL(string: obj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width:70, height: 70)
            VStack (spacing:5){
                Text(obj.name)
                    .font(.system(.callout, design: .default, weight: .bold))
                    .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                
                
                Text("\(obj.unitValue)\(obj.unitName) , price")
                    .font(.customfont(.medium, fontSize: 15))
                    .foregroundStyle(.gray)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                
            }
            Text(String(format: "$%.2f", obj.price))
                .font(.system(.title3, design: .default, weight: .bold))
                .foregroundStyle(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
            
                .frame(width:15,height:15)
            
            
    }
}

#Preview {
    FavoriteDisplay(obj: ProductModel(dict: ["prod_id": 5,
                                             "cat_id": 1,
                                             "brand_id": 1,
                                             "type_id": 1,
                                             "name": "Organic Banana",
                                             "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                                             "unit_name": "pcs",
                                             "unit_value": "7",
                                             "nutrition_weight": "200g",
                                             "price": 2.99,
                                             "created_date": "2023-07-31T04:17:35.000Z",
                                             "modify_date": "2024-06-09T05:36:12.000Z",
                                             "cat_name": "Frash Fruits & Vegetable",
                                             "brand_name": "bigs",
                                             "type_name": "Pulses",
                                             "offer_price": 2.99,
                                             "start_date": "",
                                             "end_date": "",
                                             "is_offer_active": 0,
                                             "is_fav": 1,
                                             "image": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png",
                                             "avg_rating": 0]))
}
