//
//  LoginView.swift
//  FreshCart
//
//  Created by cao duc tin  on 19/8/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.isPresented) private var isPresented
    @State var txtEmail: String = ""
    @StateObject var loginVM = MainViewModel.shared;
    var body: some View {
        ZStack{
//            Image("")
//                .resizable()
//                .scaledToFill()
//                .frame(width: .screenWidth,height: .screenHeight)
            
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
                
                CustomTextField(txt: $loginVM.txtEmail,title:"Email", placeholder: "Enter your email adress",keyboardType: .emailAddress)
                    .padding(.top,20)
                    .padding(.bottom,20)
                CustomSecureField(txt: $loginVM.txtPassword,title:"Password",placeholder: "Enter your password",isShowPassword: $loginVM.isShowPassword)
                    .modifier(ShowButton(isShow: $loginVM.isShowPassword))
         
                    Button(action: {}, label: {
                        Text("Forgot password")
                            .foregroundStyle(.black)
                            .font(.customfont(.medium, fontSize: 14))
                         
                    })
                    .padding(.top,30)
                    .padding(.bottom,40)
                    .frame(minWidth: 0,maxWidth: .infinity ,alignment: .trailing)
                
                ButtonCustom(title: "Login",image: nil) {
                    loginVM.serviceCallLogin()
                }
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack(spacing: 10){
                        Text("I don't have an account?")
                            .font(.customfont(.semibold, fontSize: 15))
                            .foregroundStyle(.primary)
                    
            
                        Text("Sign up")
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
            
            
            VStack{
                HStack{
                    Button(action: {
                     
                    }, label: {
                        Image("left")
                            .resizable()
                            .frame(width: 40,height: .screenWidth * 0.08)
                    })
                    Spacer()
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
         
        }
        .alert( isPresented: $loginVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(loginVM.errorMessage),
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
    NavigationStack{
        LoginView()
    }
}
