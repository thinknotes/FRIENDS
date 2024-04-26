//
//  NewAccount.swift
//  FRIENDS
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

struct NewAccount: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userName: String = ""
    @State var city: String = ""
//    @Binding var user: [User]
//    @State private var users: [User] = []
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                
                
                Text("FRIENDS")
                    .font(.custom("Assistant-ExtraBold", size: 40))
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                
                Text("Create Your Account")
                    .font(.custom("Assistant-ExtraBold", size: 20))
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                
                VStack {
                    
                    TextField("First Name", text: $firstName)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    TextField("FullName", text: $fullName)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    TextField("UserName", text: $userName)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    TextField("Email", text: $email)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    
                    SecureField("Passsword", text: $password)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    TextField("I Live In ", text: $city)
                        .padding()
                        .autocapitalization(.none)
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .padding()
                    
                    
                    
                    VStack {
                        
                        Button(action: {
//
                        }, label: {
                            Text("Sign Up")
                                .frame(width: 200, height: 30)
                                .font(.custom("Assistant-Regular", size: 25))
                                .padding()
                                .background(Capsule().fill(.white))
                                .foregroundColor(.blue)
                        })
                    }
                    .padding()
                    
                    
                    
                    HStack {
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2)  - 40, height: 0.5 )
                            .foregroundColor(.white)
                        
                        Text("OR")
                            .font(.custom("Assistant-SemiBold", size: 15))
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2)  - 40, height: 0.5 )
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        
                        Text("Continue with Apple")
                            .font(.custom("Assistant-SemiBold", size: 15))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                        //                        Divider()
                    
                    
                    NavigationLink(destination: {
                        Login().navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack {
                            Text("have an account?")
                                .foregroundColor(.white)
                            
                            Text("Sign In!")
                                .font(.custom("Assistant-SemiBold", size: 15))
                                .foregroundColor(.blue)
                        }
                    })
                    .padding()
                }
                
                
                    //                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("blue4"), Color("blue"), Color("blue3"), Color("blue4") ]), startPoint: .leading, endPoint: .top))
        }
        
        
    }
}





#Preview {
    NewAccount()
}
