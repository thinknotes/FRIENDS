//
//  MainView.swift
//  FRIENDS
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var HomeModel = LocationViewModel()
    var body: some View {
        NavigationStack {
            HStack {
                Text("FRIENDS")
                    .font(.custom("Assistant-ExtraBold", size: 30))
                    .padding()
                    .bold()
                    .foregroundColor(.red1)
                
                HStack {
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.red1)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 25)
                            .padding()
                            .foregroundColor(.red1)
                    })
                    
                }
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Text(HomeModel.userLocation == nil ? "Location..." : "Near: \(HomeModel.userAddress)")
                    .font(.custom("Assistant-ExtraBold", size: 20))
                    .foregroundColor(.gray)
                
                
             
                  
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .onAppear {
            HomeModel.locationManager.delegate = HomeModel
            HomeModel.locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MainView()
}
