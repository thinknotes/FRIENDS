//
//  FindFriends.swift
//  FRIENDS
//
//  Created by StudentAM on 5/9/24.
//

import SwiftUI

struct FindFriends: View {
    @State var newfriendsprofile: Image?
    @State var name: String?
    @State var city: String?
    @State var distance: Int?
    @State var connections: Int?
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if let image = newfriendsprofile {
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    } else {
                        Image("Poinsettia")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                    
                    
                    VStack {
                        Text(name ?? "Unknown Name")
                            .font(.custom("Assistant-Medium", size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text(city ?? "Unknown City")
                            .font(.custom("Assistant-Medium", size: 12))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                
                Spacer()
                
                HStack {
                    
                    ZStack {
                        Text("\(distance ?? 0) Miles Away")
                            .font(.custom("Assistant-Medium", size: 12))
                            .foregroundColor(.white)
                            .padding()
                            .background(Capsule().fill(Color.blue2))
                            .frame(width: 120, height: 30)
                            //                        .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                        
                    }
                    .offset(x: 50)
                    .padding()
                    
                    ZStack {
                        Text("\(connections ?? 0) + Connections")
                            .font(.custom("Assistant-Medium", size: 12))
                            .foregroundColor(.white)
                            .padding()
                            .background(Capsule().fill(Color.pink2))
                            .frame(width: 120, height: 30)
                            //                        .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .offset(x: 30)
                    
                    ZStack {
                        NavigationLink(destination: {
//                            Profile(allUsers: [], logedin: [])
                        }, label: {
                            Image(systemName: "chevron.right")
                                .font(.custom("Assistant-Medium", size: 12))
                                .foregroundColor(.white)
                                .padding()
                                .background(Capsule().fill(Color.black))
                                .frame(width: 120, height: 30)
                                //                            .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        })
                    }
                    .offset(x: -20)
                    .padding()
                    
                }
                
            }
            .frame(width: 330, height: 200)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    FindFriends()
}
