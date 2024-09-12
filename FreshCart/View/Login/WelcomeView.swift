//
//  WelcomeView.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/7/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
    
        NavigationStack {
            ZStack{
                Image("davide-cantelli-jpkfc5_d-DI-unsplash")
                    .resizable()
                    .scaledToFill()
                    .frame(width:.screenWidth,height: UIScreen.main.bounds.size.height)
                
                VStack{
                    Spacer()
                  
                    
                    Image(systemName: "applelogo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 60)
                        .padding(.bottom, 10)
                    Text("Welcome to our store")
                        .font(.customfont(.semibold, fontSize: 34))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                    Text("We offer a variety of fresh produce, dairy products, and more!")
                                  .font(.body)
                                  .foregroundColor(.white)
                                  .multilineTextAlignment(.center)
                                  .frame(width: 300)
                
                    NavigationLink(destination: SignInView()) {
                        Text("Get started")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
               

                                                 
                   
                    Spacer()
                        .frame(height: 100)
                    
                }
                .padding(.horizontal,20)
                
            }
          
        }
        .navigationTitle("")
    .navigationBarBackButtonHidden(true)

        .ignoresSafeArea()
   
    }
 
}

#Preview {
 
        WelcomeView()
    
}
