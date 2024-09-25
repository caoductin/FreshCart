//
//  SignUpView.swift
//  FreshCart
//
//  Created by cao duc tin  on 11/9/24.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.isPresented) private var isPresented
    @Environment(\.dismiss) var dismiss
    @StateObject var signupVM = MainViewModel.shared
    var body: some View {
      
        ZStack{
            //this image use for background
//            Image("")
//                .resizable()
//                .scaledToFill()
//                .frame(width: .screenWidth,height: UIScreen.main.bounds.height)
            ScrollView {
                
                VStack{
                    
                
                    Image(systemName: "applelogo")
                        
                        .resizable()
                        .foregroundStyle(.red)
                        .scaledToFit()
                        .frame(width: 40)
                    
                    Spacer()
                        .frame(height: .screenWidth * 0.15)
                    
                    Text("Loging")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,5)
                    
                    Text("Enter your emails and password")
                        .font(.customfont(.regular, fontSize: 18))
                        .foregroundStyle(Color.black.opacity(0.4))
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,2)
                    
                    CustomTextField(txt: $signupVM.txtUserName,title:"User name", placeholder: "Enter your user name",keyboardType: .default)
                        .padding(.top,20)
                    
                    CustomTextField(txt: $signupVM.txtEmail,title:"Email", placeholder: "Enter your email adress",keyboardType: .emailAddress)
                        .padding(.top,20)
                        .padding(.bottom,20)
                    
                    CustomSecureField(txt: $signupVM.txtPassword,title:"Password",placeholder: "Enter your password",isShowPassword: $signupVM.isShowPassword)
                        .modifier(ShowButton(isShow: $signupVM.isShowPassword))
                    
                    Button(action: {
                        MainViewModel.shared.isUserLogin = true
                    }, label: {
                        Text("logout")
                    })
                                        
                    ButtonCustom(title: "Sign up",image: nil) {
                        signupVM.serviceCallSignUp()
                    }
                    .padding(.top,30)
                    NavigationLink {
                        SignInView()
                    } label: {
                        HStack(spacing: 10){
                            Text("you already have an account?")
                                .font(.customfont(.semibold, fontSize: 15))
                                .foregroundStyle(.primary)
                        
                
                            Text("Sign in")
                                .font(.customfont(.semibold, fontSize: 15))
                                .foregroundStyle(Color.green)
                                
                        }
                        .padding(.top,.screenWidth*0.04)
                    }

                  
                    
                    Spacer()
                }
                .padding(.top,.topInsets + 40)
                .padding(.horizontal,20)
                .padding(.bottom,.bottomInsets)
                
            }
            VStack{
                HStack{
                    Button(action: {
                        dismiss() // This dismisses the current view
                    }, label: {
                        Image("left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30,height: 30)
                    })
                    Spacer()
                }
                Spacer()
                 
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
            
        }
        // Correct usage of `.alert`
        .alert( isPresented: $signupVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(signupVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("")
        .navigationDestination(isPresented: $signupVM.isUserLogin, destination: {
            MainView()
        })
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack
    {
        SignUpView()
    }
}
