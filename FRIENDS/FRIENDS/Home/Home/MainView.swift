//
//  MainView.swift
//  FRIENDS
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var HomeModel = LocationViewModel()
    @StateObject var storyData = StoryViewModel()
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
                    .font(.custom("Assistant-Medium", size: 20))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
             
               
                    Text("For You")
                        .font(.custom("Assistant-Medium", size: 25))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundColor(.red1)
                
                ScrollView(.horizontal) {
                    
                }
                
                
                Text("Your Friends")
                    .font(.custom("Assistant-Medium", size: 25))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.red1)
                
                
                HStack {
                                        
                    ForEach($storyData.stories) { $bundle in
                        StoryProfileView(bundle: $bundle)
                            .environmentObject(storyData)
                    }
                                        
                    
                }
            }
           
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .overlay(StoryView().environmentObject(storyData))
        .onAppear {
            HomeModel.locationManager.delegate = HomeModel
            HomeModel.locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MainView()
}

struct StoryProfileView: View {
    
    @Binding var bundle: StoryModel
    @Environment(\.colorScheme) var scheme
    
    @EnvironmentObject var storyData: StoryViewModel
    
    
    var body: some View {
        Image(bundle.profileImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .background(scheme == .dark ? .black : .white, in: Circle())
            .background(LinearGradient(colors: [.red, .orange, .red, .orange], startPoint: .top, endPoint: .bottom)
                .clipShape(Circle())
                .opacity(bundle.isSeen ? 0 : 1)
            
            )
            .onTapGesture {
                withAnimation {
                    bundle.isSeen = true 
                    
                    storyData.currentStory = bundle.id
                    storyData.showStory = true
                }
            }
    }
}
