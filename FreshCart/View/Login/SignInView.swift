//
//  SignInView.swift
//  FreshCart
//
//  Created by cao duc tin  on 17/7/24.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State private var navigateToNextView = false

    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var contryObj: Country?
    var body: some View {
        ZStack(alignment: .center){

            VStack{
                Image("images")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .clipped()
                Spacer()
              
           
             
                
            }
            .ignoresSafeArea(edges: .top)
            ScrollView(content: {
                VStack{
                    Text("Get your gocery with me")
                        .font(.customfont(.semibold, fontSize: 30))
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .padding(.bottom,23)
                        .multilineTextAlignment(.center)
                    
                    HStack{
                        Button(action: {
                            isShowPicker = true
                        }, label: {
//                            Image("")
                            if let contryObj = contryObj{
                                Text("\(contryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundStyle(.primary)
                            }
                            if let contryObj = contryObj{
                                Text("+\(contryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundStyle(.primary)
                            }
                            
                        })
                        TextField("Enter Moblie", text: $txtMobile)
                            .frame(minWidth: 0,maxWidth: .infinity)
                      
                        
                    }
                    // Navigation to LoginView
                                    NavigationLink(destination: LoginView()) {
                                        ButtonCustom(
                                            title: "Sign in with email",
                                            startColor: .blue,
                                            endColor: .blue.opacity(0.7),
                                            image: nil,
                                            colorText: .white) {
                                                
                                            }
                                    }
                                    .padding(.bottom, 10)

                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        ButtonCustom(title: "Sign up with Email",
                                     startColor: Color.purple, endColor: Color.purple.opacity(0.7), image: nil, colorText: .white) {
                                navigateToNextView = true
                            }

                      
                    
                    }

                    
                    Divider()
                        .padding(.bottom,10)
                    
                    Text("Or connect to social media")
                        .font(.customfont(.semibold, fontSize: 15))
                        .foregroundStyle(.secondary)
                        .fontWeight(.bold)
                        .padding(.bottom,23)
                        .multilineTextAlignment(.center)
                   
                    ButtonCustom(title: "Start with Google", startColor: .blue, endColor: .blue, image: "icons8-google-50", colorText: .white) {
                        
                    } .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.4), Color.yellow]), startPoint: .leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing), lineWidth: 10)
                    )
                    .padding(.bottom,10)
           

                    ButtonCustom(title: "Start with Facebook", startColor: .blue, endColor: .blue.opacity(1), image: "icons8-facebook-50", colorText: .white) {
                        
                    }

                }
                .padding(.horizontal,20)
                .frame(width: .screenWidth,alignment: .leading)
                .padding(.top,.screenHeight/3.5)
          
//                NavigationLink(
//                                destination: SignUpView(),
//                                isActive: $navigateToNextView
//                            ) {
//                                EmptyView() // Invisible view as this is controlled programmatically
//                            }
            })
            .onAppear{
                self.contryObj = Country(phoneCode: "+91", isoCode: "IN")
            }
         
            .sheet(isPresented: $isShowPicker, content: {
                CountryPickerUI(country: $contryObj)
            })
            .ignoresSafeArea()
            .navigationTitle("")
           
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToNextView) {
                SignUpView()
            }

        }
    }
}

#Preview {
    NavigationStack{
        SignInView()
    }
    }
