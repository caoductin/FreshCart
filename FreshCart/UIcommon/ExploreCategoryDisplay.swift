//
//  ExploreCategoryDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct ExploreCategoryDisplay: View {
    @State var color: Color = Color.yellow
    @State var CategoryObj: ExploreMD = ExploreMD(dict: [:])
    var didAction: (()-> ())?
    var body: some View {
        VStack{
            WebImage(url: URL(string: CategoryObj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
    
            Spacer()
            
            Text("\(CategoryObj.name)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
       
            Spacer()
        }
        .padding()
        .frame(minWidth: 0,maxWidth: .infinity)
        .background(CategoryObj.color.opacity(0.3))
        .cornerRadius(20, corner: .allCorners)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                
                .stroke(Color.blue,lineWidth: 1)
        )

    }
}
#Preview {
    ExploreCategoryDisplay(CategoryObj: ExploreMD(dict: ["prod_id": 5,
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
    .padding(20)
}
