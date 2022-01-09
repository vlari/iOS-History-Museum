//
//  LoginView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        withAnimation(Animation.default) {
                            self.navigationVM.isMenuOpened.toggle()
                        }
                    } label: {
                        Image("menuIcon.SFSymbol")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                            .font(Font.system(size: 24, weight: .heavy))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack(alignment: .center) {
                    Image("iconImage")
                        .resizable()
                        .frame(width: 65, height: 65)
                }
                
                HStack(alignment: .center) {
                    Text("History Museum")
                        .foregroundColor(Color.white)
                        .font(.body)
                }
                
                Spacer()
                
                TextField("e-mail", text: $email)
                    .underlineTextField()
                
                SecureField("password", text: $password)
                    .underlineTextField()
                
                Button {
                    // Log in
                } label: {
                    Text("Log in")
                }
                .buttonStyle(HMButtonStyle())
                .padding(.top)
                
                Text("Forgot your password?")
                    .foregroundColor(Color.theme.lightGrey)
                
                Button {
                    // Sign up
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(HMButtonStyle())
            }
            .padding()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
