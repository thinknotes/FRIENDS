//
//  Profile.swift
//  FRIENDS
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct Profile: View {
    @State private var userName: String = "MarkGreen2221"
    @State private var followers: Int = 27000
    @State private var following: Int = 73
    @State var selectedTab: String = ""
    @Namespace var animation
    @State private var selectedFilter: ProfileViewModel = .posts
    @State private var showEditProfile: Bool = false
    @State private var fullName: String = ""
    @State private var newuserName: String = ""
    @State private var bio: String = ""
    @State var logedin: [User]
    
    
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(.systemGray))
                    .frame(width: 30, height: 30)
            })
            .padding()
//
            Spacer()
            
           Button(action: {
               
           }, label: {
               HStack {
                   Text("")
//                   Text("\(logedin[0].userName)")
                       .font(.custom("Assistant-Medium", size: 20))
                       .padding()
                       .offset(x: -30)
                   
                   Image(systemName: "chevron.down")
                       .offset(x: -50)
               }
               .foregroundColor(.gray)
           })
            
            
            Button(action: {
                
            }, label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(.systemGray))
                    .frame(width: 30, height: 30)
            })
            .padding()
        }
        
        Spacer()
        
        HStack {
            VStack {
                Text("\(followers)")
                    .font(.custom("Assistant-Bold", size: 25))
                
                Text("Followers")
                    .foregroundColor(.gray)
                    .font(.custom("Assistant-Medium", size: 17))
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            
            VStack {
                
                    Image("AlpsCastles")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                       
//
                       Button(action: {
                           
                       }, label: {
                           Image(systemName: "plus.circle.fill")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 20, height: 20)
                               .foregroundColor(.white)
                       })
                       .offset(y: -54)
                        
                
            }
            
            VStack {
                Text("\(following)")
                    .font(.custom("Assistant-Bold", size: 25))
                
                Text("Following")
                    .foregroundColor(.gray)
                    .font(.custom("Assistant-Medium", size: 17))
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            
        }
        
        VStack {
            Text("Bio")
        }
        
        VStack {
            HStack {
                Button(action: {
                    showEditProfile.toggle()
                }, label: {
                    Text("Edit Profile")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(height: 30)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                    
                })
                .sheet(isPresented: $showEditProfile, content: {
                    ScrollView(.vertical) {
                        
                        VStack {
                            Button(action: {
                                showEditProfile.toggle()
                            }, label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .font(.custom("Assistant-Medium", size: 15))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                    //                    .offset(y: -30)
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            Text("Edit profile")
                                .font(.custom("Assistant-Bold", size: 30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            
                            Text("Provide details about yourself and any other pertinent infomation")
                                .font(.custom("Assistant-Medium", size: 20))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .padding()
                        
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(height: 5)
                            .foregroundColor(.gray)
                            .padding()
                        
                        }
                    VStack {
                        
                        Section("Full name") {
                            TextField("", text: $fullName)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Section("User name") {
                            TextField("", text: $userName)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Section("Bio") {
                            TextField("", text: $bio)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Brief description for your profile")
                            .foregroundColor(.gray)
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding()
                    
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Save")
                            .frame(width: 300, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    })
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Insights")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(height: 30)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Promotions")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(height: 30)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                    
                })
              
//                .padding()
                
            }
        }
        .padding()
        
        ScrollView(.horizontal) {
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .font(.caption)
                    .fontWeight(.bold)
                    .frame(height: 40)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 1))
                
                
            })
            
            Text("New")
            
           
                
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        
        ExtractedView()
        
        
           
        
        
            
       
            
           
            
        
        
    }
}

#Preview {
    Profile(logedin:  [])
}



struct Posts: View {
    var posts = ["AlpsCastles", "AngkorPark", "JerseyIsland", "CERNCenter", "CheetahDay", "HumanKindness"].shuffled()
    
    var userName: String = "MarkGreen2221"
    let likes = Int.random(in: 1...1000)
    let comments = Int.random(in: 1...1000)
    let isLiked = Bool.random()
    var cities = ["New York", "Tokyo", "London", "Paris", "Sydney"].shuffled()
    
    @State private var postView: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Button(action: {
                    postView.toggle()
                    
                   
                }, label: {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 3), spacing: 4) {
                        ForEach(posts, id: \.self) { index in
                            
                            Image(index)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .cornerRadius(30)
                                .padding()
                                
                            
                            
                        }
                        
                        
                        
                    }
                })
                .sheet(isPresented: $postView, content: {
                    Button(action: {
                        postView.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .font(.custom("Assistant-Medium", size: 15))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .offset(y: -30)
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Post(name: userName,   likes: likes, comments: comments, postPics: posts, showLike: isLiked)
                })
            }
        }
    }
}

#Preview {
    Posts()
}

struct Reels: View {
    var body: some View {
        VStack {
            Text("Share a memory with the world ")
                .font(.custom("Assistant-Bold", size: 30))
                .padding()
            
            Button(action: {
                
            }, label: {
                Text("Create a reel")
                    .font(.custom("Assistant-Medium", size: 20))
                    .padding()
            })
        }
    }
}

#Preview {
    Reels()
}

struct ExtractedView: View {
    @State private var selectedFilter: ProfileViewModel = .posts
    @Namespace var animation
    var body: some View {
      HStack  {
        ForEach(ProfileViewModel.allCases, id: \.rawValue) { item in
            VStack {
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(selectedFilter == item ? .semibold : .regular)
                    .foregroundColor(selectedFilter == item ? .black : .gray)
                
                if selectedFilter == item {
                    Capsule()
                        .foregroundColor(Color(.systemBlue))
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "filter", in: animation)
                } else {
                    Capsule()
                        .foregroundColor(Color.clear)
                        .frame(height: 5)
                }
                
                
                if selectedFilter == .posts {
                    Posts()
                } else if selectedFilter == .reels {
                    VStack {
                        Text("Share a memory with the world ")
                            .font(.custom("Assistant-Bold", size: 30))
                            .padding()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Create a reel")
                                .font(.custom("Assistant-Medium", size: 20))
                                .padding()
                        })
                    }
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.selectedFilter = item
                }
            }
        }
        
        
        }
    }
}

//struct EditProfile: View {
//    
//    var body: some View {
//        ScrollView(.vertical)
//    }
//}
//
//#Preview {
//    EditProfile()
//}
