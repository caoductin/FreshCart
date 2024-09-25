//
//  ProductModel.swift
//  FreshCart
//
//  Created by cao duc tin  on 15/9/24.
//


import SwiftUI

struct ProductModel:  Identifiable, Equatable {
    var id: Int = 0
    var prodId: Int = 0
    var catId: Int = 0
    var brandId: Int = 0
    var typeId: Int = 0
    var orderId: Int = 0
    var qty: Int = 0
    var detail: String = ""
    var name: String = ""
    var unitName: String = ""
    var unitValue: String = ""
    var nutritionWeight: String = ""
    var image: String = ""
    var catName: String = ""
    var typeName: String = ""
    var offerPrice: Double?
    var itemPrice: Double = 0.0
    var totalPrice: Double = 0.0
    var price: Double = 0
    var startDate: Date = Date()
    var endDate: Date = Date()
    var isFav: Bool = false
    var avgRating: Int = 0
    

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "prod_id") as? Int ?? 0
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.catId = dict.value(forKey: "cat_id") as? Int ?? 0
        self.brandId = dict.value(forKey: "brand_id") as? Int ?? 0
        self.typeId = dict.value(forKey: "type_id") as? Int ?? 0
        self.orderId = dict.value(forKey: "order_id") as? Int ?? 0
        self.qty = dict.value(forKey: "qty") as? Int ?? 0
        self.isFav = dict.value(forKey: "is_fav") as? Int ?? 0 == 1
        
        self.detail = dict.value(forKey: "detail") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.unitName = dict.value(forKey: "unit_name") as? String ?? ""
        self.unitValue = dict.value(forKey: "unit_value") as? String ?? ""
        self.nutritionWeight = dict.value(forKey: "nutrition_weight") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.catName = dict.value(forKey: "cat_name") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.offerPrice = dict.value(forKey: "offer_price") as? Double
        self.price = dict.value(forKey: "price") as? Double ?? 0
        self.itemPrice = dict.value(forKey: "item_price") as? Double ?? 0
        self.totalPrice = dict.value(forKey: "total_price") as? Double ?? 0
        self.startDate = (dict.value(forKey: "start_date") as? String ?? "").stringDateToDate() ?? Date()
        self.endDate = (dict.value(forKey: "end_date") as? String ?? "").stringDateToDate() ?? Date()
        self.avgRating =  Int(dict.value(forKey: "avg_rating") as? Double ?? 0.0)
    }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}
//"prod_id": 7,
//"cat_id": 1,
//"brand_id": 1,
//"type_id": 1,
//"name": "Oranges",
//"detail": "Many types of oranges are high in fiber and beneficial vitamins, like vitamin C. They also contain antioxidants which can have various health benefits, including supporting immune function.",
//"unit_name": "kg",
//"unit_value": "1",
//"nutrition_weight": "140g",
//"price": 0.99,
//"image": "http://localhost:3001/img/product/202307310958175817ytVf7AVIOl.png",
//"cat_name": "Frash Fruits & Vegetable",
//"type_name": "Pulses",
//"is_fav": 0,
//"avg_rating": 0
//},

