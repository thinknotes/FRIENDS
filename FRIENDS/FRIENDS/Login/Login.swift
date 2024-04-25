//
//  Login.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            VStack {
                Text("Welcome Back!")
                    .font(.custom("Assistant-ExtraBold", size: 25))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    .bold()
                    .offset(y: -70)
                    .foregroundColor(Color("red2"))
//                    .foregroundColor(.white)
                
                
                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Passsword", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
       
    }
}

#Preview {
    Login()
}


//.background(LinearGradient(gradient: Gradient(colors: [Color("pink"), Color("pink2"), Color("pink3"), Color("pink4") ]), startPoint: .leading, endPoint: .top))
