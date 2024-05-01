//
//  Post.swift
//  FRIENDS
//
//  Created by StudentAM on 4/30/24.
//

import SwiftUI

struct Post: View {
    @State var name: String = "John Smith"
    @State var city: String = "Los Angles"
    @State var likes: Int = 2500
    @State var comments: Int = 1000
    var postPics = ["AlpsCastles", "AngkorPark", "JerseyIsland"]
    var friendsPics = ["CERNCenter", "CheetahDay", "HumanKindness"]
    @State var commentText: String = "Can't wait to see what you do next"
    @State var profilePic: Image?
    @State var showLike: Bool = false
    @State private var commentClicked: Bool = false
    @State private var likesClicked: Bool = false
    @State private var bookmarkClicked: Bool = false
    @State private var showSheet: Bool = false
    
    
    
    var body: some View {
        VStack {
            HStack {
                if let profilePics = profilePic {
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }

                
                VStack {
                    
                    Text(name)
                        .bold()
                        .font(.custom("Assistant-Bold", size: 17))
                    
                    Text(city)
                        .foregroundColor(.gray)
                        .font(.custom("Assistant-Medium", size: 15))
                    
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                
                Menu {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "eye.slash.fill")
                        Text("Not Interested")
                    })
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "exclamationmark.octagon.fill")
                            .foregroundColor(.red)
                        Text("Report Abuse")
                            
                    })
                    
                    
                } label: {
                    Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack {
                
                    TabView {
                        ForEach(postPics, id: \.self ) { post in
                            Image(post)
                                .resizable()
                                .scaledToFill()
                                .onTapGesture {
                                    withAnimation {
                                        showLike.toggle()
                                    }
                                }
                            
//
                        }
                    }
                    .frame(width: 300, height: 230)
                    .cornerRadius(20)
                    .tabViewStyle(.page)
                
            }
            
            Spacer()
            Spacer()
//            Spacer()
            
           
            HStack {
                HStack {
                   Button(action: {
                       if !likesClicked {
                           likes += 1
                           likesClicked = true
                       }
                   }, label: {
                       Image(systemName: "heart.fill")
                           .foregroundColor(likesClicked ? .pink : .white)
                           .font(.custom("Assistant-Medium", size: 15))
                       
                           //
                       
                       Text("\(likes)")
                           .foregroundColor(.white)
                           .font(.custom("Assistant-Medium", size: 15))
                   })
                    
//
                }
                
                .padding()
                .background(Capsule().fill())
                .padding()
                
                HStack {
                    Button(action: {
                        if !commentClicked {
                            comments += 1
                            commentClicked = true
                        }
                    }, label: {
                        Image(systemName: "message.fill")
                            .foregroundColor(commentClicked ? .pink : .white)
                        
                        
                        Text("\(comments)K")
                            .font(.custom("Assistant-Medium", size: 17))
                            .foregroundColor(.black)
                    })
                    
                }
                
                
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                    })
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        bookmarkClicked.toggle()
                    }, label: {
                        Image(systemName: bookmarkClicked ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(bookmarkClicked ? .pink : .black)
                    })
                    .offset(x: -10)
                }
                
                
               
                    
            }
            .offset(y: 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                HStack {
                    
                    
                    ForEach(friendsPics, id: \.self) { image in
                        Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -30)
                    }
                    
                    

                        
                    Text("\(commentText)")
                        .font(.custom("Assistant-Medium", size: 15))
                    
                    
                   Spacer()
                    
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Text("More")
                            .foregroundColor(.white)
                            .font(.custom("Assistant-Medium", size: 15))
                    })
                    .sheet(isPresented: $showSheet, content: {
                        VStack {
                            
                            
                            VStack {
                                Button(action: {
                                    showSheet.toggle()
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .font(.custom("Assistant-Medium", size: 15))
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(comments) Comments")
                                    .font(.custom("Assistant-Medium", size: 25))
                            }
                            
                            ScrollView(.vertical) {
                                
                            }
                            
                            Spacer()
                           
                        }
                    })
                    .padding()
                    .background(Capsule().fill())
                    .padding()
                        
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .offset(x: 20)
            
        }
        .frame(width: 340, height: 550)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
    }
       
}

#Preview {
    Post()
       
}
