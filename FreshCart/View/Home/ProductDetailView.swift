//
//  ProductDetailView.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var ProductDetailVM: ProductDetailViewMD = ProductDetailViewMD(obj: ProductModel(dict: [:]))
    var body: some View {
        
        ZStack {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.2))
                        .cornerRadius(20, corner: [.bottomLeft,.bottomRight])
                    
                    
                    WebImage(url: URL(string: ProductDetailVM.Obj.image))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.7, height: .screenWidth * 0.7)
                    
                    
                }
                VStack {
                    HStack{
                        Text("\(ProductDetailVM.Obj.name)")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Button {
                            ProductDetailVM.serviceCallAddRemoveFav()
                        } label: {
                            Image(systemName: ProductDetailVM.isFav ? "heart" : "heart.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(ProductDetailVM.isFav ? .blue : .red)
                            
                            
                        }
                        
                        
                    }
                    Text("\(ProductDetailVM.Obj.unitValue) \(ProductDetailVM.Obj.unitName) Price")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundStyle(.gray.opacity(0.9))
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    HStack{
                        
                        Button {
                            ProductDetailVM.addSubQTY(isAdd: false)
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                        }
                        
                        
                        Text("\(ProductDetailVM .qty)")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .frame(minWidth: 0,maxWidth: 70)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue.opacity(0.9),lineWidth: 1)
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,10)
                        Button {
                            ProductDetailVM.addSubQTY(isAdd: true)
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                            
                        }
                        Spacer()
                        Text("$\(ProductDetailVM.Obj.price * Double(ProductDetailVM.qty),specifier: "%.2f")")
                            .font(.system(size: 30, weight: .bold, design: .default))
                    }
                    .padding(.top,8)
                    
                    Divider()
                    
                    HStack{
                        Text("Detail")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {  // Smooth animation
                                ProductDetailVM.isShowDetail.toggle()
                            }
                        } label: {
                            Image(systemName: ProductDetailVM.isShowDetail ? "chevron.down" : "chevron.forward")
                                .font(.system(size: 25))
                                .foregroundStyle(.blue)
                                .animation(.easeInOut(duration: 0.3), value: ProductDetailVM.isShowDetail)
                            
                        }
                        
                        
                    }
                    .frame(height:60)
                    
                    if ProductDetailVM.isShowDetail{
                        Text("\(ProductDetailVM.Obj.detail)")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(hex: "#808080"))
                            .transition(.opacity)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Nutrition")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                      
                        Text(ProductDetailVM.Obj.nutritionWeight)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                            .padding(8)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10, corner: .allCorners)
                        
                        Button {
                         // Smooth animation
                                ProductDetailVM.isShowNutrition.toggle()
                            
                        } label: {
                            Image(systemName: ProductDetailVM.isShowNutrition ? "chevron.down" : "chevron.forward")
                                .font(.system(size: 25))
                                .foregroundStyle(.blue)
//                                .animation(.easeInOut(duration: 0.3), value: ProductDetailVM.isShowNutrition)
                            
                        }
                        
                        
                    }    
                    .frame(height:60)
                    
                    if ProductDetailVM.isShowNutrition{
                        LazyVStack{
                            
                            ForEach(ProductDetailVM.nutritionArr,id: \.id){obj in
                          
                                    HStack{
                                        Text(obj.nutrition_name)
                                            .font(.system(size: 12, weight: .regular, design: .default))
                                            .foregroundStyle(Color(hex: "#808080"))
                                            .transition(.opacity)
                                        
                                        Spacer()
                                        Text((obj.nutrition_value))
                                            .font(.system(size: 12, weight: .regular, design: .default))
                                            .foregroundStyle(Color(hex: "#808080"))
                                            .transition(.opacity)
                                    }
                                
                                Divider()
                                
                            }
                            .padding(.horizontal,20)
                            .padding(.vertical,3)
                        }
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Review")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        HStack(spacing: 10){
                            ForEach(1...5,id:\.self){
                                index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundStyle(Color.orange)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.forward")
                                .font(.system(size: 25))
                                .foregroundStyle(.blue)
                                .animation(.easeInOut(duration: 0.3), value: ProductDetailVM.isShowDetail)
                            
                        }
                        
                        
                    }
                    .frame(height:60)
                    ButtonCustom(title: "Add to Cart",image: nil) {
                        CartViewModel.serviceCallAddToCart(prodId: ProductDetailVM.Obj.prodId, qty: ProductDetailVM.qty) { bool, message in
                            
                            ProductDetailVM.qty = 1
                            ProductDetailVM.showError = true
                            ProductDetailVM.errorMessage = message
                        }
                        }
                }
                .padding(.top,.topInsets*0.2)
                .padding(.horizontal,20)
                
                Divider()
                
            }
            
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("left")
                            .resizable()
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.black)
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,10)
                Spacer()
            }
        }
        .alert( isPresented: $ProductDetailVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(ProductDetailVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(.all)
    }
    
}

#Preview {
    ProductDetailView(ProductDetailVM: ProductDetailViewMD(obj: ProductModel(dict: [  "offer_price": 2.49,
                                                                                      "start_date": "2023-07-30T18:30:00.000Z",
                                                                                      "end_date": "2023-08-29T18:30:00.000Z",
                                                                                      "prod_id": 5,
                                                                                      "cat_id": 1,
                                                                                      "brand_id": 1,
                                                                                      "type_id": 1,
                                                                                      "name": "Organic Banana",
                                                                                      "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                                                                                      "unit_name": "pcs",
                                                                                      "unit_value": "7",
                                                                                      "nutrition_weight": "200g",
                                                                                      "price": 2.99,
                                                                                      "image": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png"
                                                                    ,
                                                                                      "cat_name": "Frash Fruits & Vegetable",
                                                                                      "type_name": "Pulses",
                                                                                      "is_fav": 1])))
}
