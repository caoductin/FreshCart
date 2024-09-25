//
//  CartView.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/9/24.
//
//
//import SwiftUI
//
//struct CartView: View {
//    @State private var offset: CGSize = .zero
//    @StateObject var CartVM = CartViewModel.shared
//    var body: some View {
//        ZStack{
//            if CartVM.listArr.count < 1{
//                Text("You haven’t added anything yet. Shop now to fill your cart!")
//                    .font(.system(size: 20, weight: .bold, design: .rounded))
//            }
//
//            ScrollView {
//                LazyVStack {
//                    ForEach(CartVM.listArr,id:\.id){obj in
//                        VStack{
//                            HStack{
//                                CartItemDisplay(obj: obj)
//                                          .offset(x: offset.width)
//                                          .gesture(
//                                              DragGesture()
//                                                  .onChanged { value in
//                                                      // Update the offset based on the drag gesture
//                                                      self.offset.width = value.translation.width
//                                                  }
//                                                  .onEnded { value in
//                                                      if self.offset.width > 45 {
//
//                                                          if let index = CartVM.listArr.firstIndex(where: { $0.id == obj.id }) {
//                                                                                   CartVM.listArr.remove(at: index)
//                                                                               }
//                                                      } else {
//                                                          // Reset offset if swipe was not sufficient
//                                                          withAnimation {
//                                                              self.offset = .zero
//                                                          }
//                                                      }
//                                                  }
//                                          )
//                                          .animation(.spring(), value: offset) // Optional animation for
//
//                            }
//                            .padding(.horizontal,10)
//                            .padding(.vertical,5)
//                        }
//                    }
//
//
//                }
//                .padding(.top,.topInsets + 50)
//                .padding(.bottom,.bottomInsets + 60)
//
//            }
//            VStack{
//                HStack{
//                    Spacer()
//
//                    Text("My Cart")
//                        .font(.system(.title, design: .default, weight: .bold))
//                        .frame(height: 54)
//                    Spacer()
//                }
//
//                .padding(.top,50)
//
//                Spacer()
//                if CartVM.listArr.count > 0{
//                    ButtonCustom(title: "Payment",image: nil,action: {
//
//                    })
//                        .padding(.bottom,.bottomInsets)
//                        .frame(minWidth: 0,maxWidth: .infinity)
//                        .background(.white)
//                }
//
//
//            }
//        }
//        .alert( isPresented: $CartVM.showError) {
//            Alert(
//                title: Text(Globs.AppName),
//                message: Text(CartVM.errorMessage),
//                dismissButton: .default(Text("OK"))
//            )
//        }
//
//        .navigationTitle("")
//        .navigationBarBackButtonHidden()
//        .toolbar(.hidden)
//        .ignoresSafeArea()
//
//    }
//}
//
//#Preview {
//    NavigationStack{
//        CartView()
//    }
//
//}
import SwiftUI

struct CartView: View {
    @State private var offset: CGSize = .zero
    @StateObject var CartVM = CartViewModel.shared
    
    var body: some View {
        ZStack {
            if CartVM.listArr.count < 1 {
                Text("You haven’t added anything yet. Shop now to fill your cart!")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(CartVM.listArr, id: \.id) { obj in
                            CartItemDisplay(obj: obj)
                                .padding(.vertical,2)
                            
                        }
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.top, .topInsets + 50)
                    .padding(.bottom, .bottomInsets)
                }
//                .background(
//                    .blue
//                )
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text("My Cart")
                        .font(.system(.title, design: .default, weight: .bold))
                        .frame(height: 54)
                    
                    Spacer()
                }
                .padding(.top, 50)
                .background(.white)
            
                Spacer()
                
                if CartVM.listArr.count > 0 {
                    HStack{
                        Text("$\(CartVM.total)")
                                .font(.system(size: 24, weight: .bold, design: .default))
                        
                        Spacer()
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                CartVM.showCheckout.toggle() // Or however you're toggling the state
                            }
                        } label: {
                            Text("Order Now")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                                .padding(20)
                            
                            
                        }
                        .frame(minWidth: 0,maxWidth: 160)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundStyle(.purple)
                        )
                  
                    }
                    .frame(height: 100)
                    .padding(.horizontal,20)
                    .background(.white)

                    
                }
        
            }
            if(CartVM.showCheckout) {
                            Color.black
                                .opacity(0.3)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation {
                                        CartVM.showCheckout = false
                                    }
                                }
                            
                            OrderView(isShow: $CartVM.showCheckout )
                                .transition(.opacity.combined(with: .move(edge: .bottom)))
                          
                        }

        }
        .background( NavigationLink(destination: OrderAcceptView(), isActive: $CartVM.showOrderAccept  , label: {
            EmptyView()
        }) )
        .alert(isPresented: $CartVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(CartVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        CartView()
    }
}
