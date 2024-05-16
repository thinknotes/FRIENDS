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
//    @State var images: UIImage
    @State private var postss: [posts] = [
    
        posts(name: "Aviator", city: "Dayton Beach, Florida", postPics: ["PearlHarborArizona"], friendsPics: ["TreeLighting", "Poinsettia", "SF"], numOfLikes: 350, numOfComments: 260, caption: "", commentText: "How is Florida going?!", profiePic: Image("PearlHarborArizona")),
        
        posts(name: "Sammyisbest", city: "Aspen, Colorado", postPics: ["Aspen "], friendsPics: ["RioNegro", "SF", "JerseyIsland"], numOfLikes: 1000000, numOfComments: 390, caption: "Today i went to Aspen and am enjoying life!, Totally didnt ditch the comp sci final lol", commentText: "Arent you supposed to be school 😉", profiePic: Image("Poinsettia"))
        
//   
//        posts(name: "Dominic", city: "", postPics: <#T##[String]#>, friendsPics: <#T##[String]#>, numOfLikes: <#T##Int#>, numOfComments: <#T##Int#>, caption: <#T##String#>, commentText: <#T##String#>, profiePic: <#T##Image#>)
        

        
    
    ]
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack {
                    Text("FRIENDS")
                        .font(.custom("Assistant-ExtraBold", size: 30))
                        .padding()
                        .bold()
                        .foregroundColor(.red1)
                    
                    HStack {
                        
                        NavigationLink(destination: {
                            Text(",")
                        }, label: {
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                                .foregroundColor(.red1)
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        NavigationLink(destination: {
                            options(post: $postss)
                                .navigationBarBackButtonHidden(true)
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
                        HStack {
                            FindFriends(newfriendsprofile: Image("TreeLighting"), name: "Matthew Brown", city: "Palo Alto, CA", distance: 23, connections: 1)
                            
                            
                            FindFriends(newfriendsprofile: Image("HumanKindness"), name: "Emily Johnson", city: "San Francisco, CA", distance: 31, connections: 0)
                            
                            FindFriends(newfriendsprofile: Image("PearlHarborArizona"), name: "Amanda Davis", city: "Santa Clara, CA", distance: 10, connections: 2)
                        }
                        
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
                    
                    VStack {
                        
                        ScrollView(.vertical) {
                            ForEach(postss.indices, id: \.self) { i in
                                
                                Post(name: postss[i].name, city: postss[i].city, likes: postss[i].numOfLikes, comments: postss[i].numOfComments, postPics: postss[i].postPics, friendsPics: postss[i].friendsPics, commentText: postss[i].commentText, profilePic: postss[i].profiePic, showLike: false, caption: postss[i].caption)
//                                Text(postss[i].name)
                            }
                        
//
//
//
                        }
                    }
                }
                
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
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
