//
//  Login.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isChecked: Bool = false
    @State private var wrong: Bool = false
    @State private var showView: Bool = false
    @State  var allUsers: [User]
    
    var body: some View {
        
        
       
            NavigationStack {
                VStack {
                    
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
                    
                    VStack {
                        TextField("Email or Username", text: $email)
                            .padding()
                            .autocapitalization(.none)
                            .background()
                            .cornerRadius(10)
                            .padding(.horizontal, 24)
                        
                        
                        
                        SecureField("Passsword", text: $password)
                            .padding()
                            .autocapitalization(.none)
                            .background()
                            .cornerRadius(10)
                            .padding(.horizontal, 24)
                        
                        
                        
                        Toggle(isOn: $isChecked) {
                            Text("Remember Me")
                        }
                        .padding()
                        .font(.custom("Assistant-SemiBold", size: 17))
                        .toggleStyle(CheckboxStyle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundColor(.gray)
                        
                        
                        Button(action: {
                            authenciation()
                        }, label: {
                            Text("Sign In")
                            .frame(width: 200, height: 30)
                            .font(.custom("Assistant-Regular", size: 25))
                            .padding()
                            .background(Capsule().fill(.white))
                            .foregroundColor(.blue)
                        })
                           
                        
                        NavigationLink(destination: Home(users: allUsers).navigationBarBackButtonHidden(true), isActive: $showView) {
                            EmptyView()
                        }
                        
//
                        
                        
                        
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
                            NewAccount(users: $allUsers).navigationBarBackButtonHidden(true)
                        }, label: {
                            HStack {
                                Text("Don't have an account?")
                                    .foregroundColor(.white)
                                
                                Text("Create One!")
                                    .font(.custom("Assistant-SemiBold", size: 15))
                                    .foregroundColor(.white)
                            }
                        })
                        .padding()
                    }
                    
                    
                        //                Spacer()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color("blue4"), Color("blue"), Color("blue3"), Color("blue4") ]), startPoint: .leading, endPoint: .top))
            }
            .alert("Wrong Username/Email or Password", isPresented: $wrong) {
                    //
            }
        }
    
    func authenciation() {
        print("DEBUG: All Users: \(allUsers)")
        
        for user in allUsers {
            if user.userName == email && user.password == password {
                print("DEBUG: Match Succesfully")
                showView = true
            } else {
                print("DEBUG: Not Runing")
            }
            
            
   
        }
        
        
        
    }
    
    }




#Preview {
    Login(allUsers: [])
}



struct CheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .white)
                .font(.system(size: 20, weight: .regular, design: .default))
            configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
        
    }
}



