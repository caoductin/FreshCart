//
//  CartItemDisplay.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemDisplay: View {
    @State var obj: ItemCartModel = ItemCartModel(dict: [:])
    var body: some View {
        HStack{
            WebImage(url: URL(string: obj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width:70, height: 70)
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(.gray.opacity(0.1),lineWidth: 2)
                }
            VStack{
                HStack {
                    VStack (spacing:5){
                        Text(obj.name)
                            .font(.system(.title3, design: .default, weight: .bold))
                            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text("\(obj.unitValue)\(obj.unitName) , price")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                    }
                    Button {
                        CartViewModel.shared.serviceCallRemove(cObj: obj)
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.red)
                            .frame(width: 25,height: 25)
                    }
                }
                HStack {
                    
                    
                    Button {
                        CartViewModel.shared.serviceCallUpdateQty(cObj: obj, newQty: obj.qty - 1)
                    } label: {
                        Image(systemName: "minus")
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                            .frame(width: 40,height: 40)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green.opacity(0.9),lineWidth: 1)
                            }
                    }
                    
                    
                    Text("\(obj.qty)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .frame(minWidth: 0,maxWidth: 40)
                      
            
                    Button {
                        CartViewModel.shared.serviceCallUpdateQty(cObj: obj, newQty:  obj.qty + 1)
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                            .frame(width:40,height: 40)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green.opacity(0.9),lineWidth: 1)
                    }
            
                    }
                    Spacer()
                    Text(String(format: "$%.2f", obj.price))
                        .font(.system(.title3, design: .default, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    
                    
                }
            }
            .padding(.leading,10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white) // Background color
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5) // Shadow towards bottom-right
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.2), lineWidth: 2) // Border color and width
        )
  
        
            
            
    }
}

#Preview {
    CartItemDisplay(obj: ItemCartModel(dict: ["cart_id": 36,
                                              "user_id": 2,
                                              "prod_id": 5,
                                              "qty": 1,
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
                                              "is_fav": 1,
                                              "brand_name": "bigs",
                                              "type_name": "Pulses",
                                              "offer_price": 2.99,
                                              "start_date": "",
                                              "end_date": "",
                                              "is_offer_active": 0,
                                              "image": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png",
                                              "item_price": 2.99,
                                              "total_price": 2.99]))
    .padding(.horizontal,20)
}
