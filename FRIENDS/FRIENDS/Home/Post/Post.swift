//
//  Post.swift
//  FRIENDS
//
//  Created by StudentAM on 4/30/24.
//

import SwiftUI

struct Post: View {
    @State var name: String
    @State var city: String
    @State var likes: Int
    @State var comments: Int
    var postPics: [String]
//    var postPics = ["AlpsCastles", "AngkorPark", "JerseyIsland"]
    var friendsPics = ["CERNCenter", "CheetahDay", "HumanKindness"]
    var friendsNames = ["Emily Johnson", "Michael Smith", "Jessica Martinez"]
    @State var commentText = "Can't wait to see what you do next" /*+ "Have a great trip!!" + "So Lucky, wish i was there"*/
    @State var profilePic: Image?
    @State var showLike: Bool = false
    @State private var commentClicked: Bool = false
    @State private var likesClicked: Bool = false
    @State private var bookmarkClicked: Bool = false
    @State private var showSheet: Bool = false
    @State var caption: String
    @State private var dateString: String = ""
    @State private var newComment: String = ""
    @State private var replyComment: String = ""
    @State var commentTraker: Bool = false
    
 
    
    
    
    var body: some View {
        VStack {
            HStack {
                
                if let profilePics = profilePic {
                    profilePics
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 50)
                        .clipShape(Circle())
                        
                        
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        
                       
                }

                
                VStack {
                    
                    Text(name)
                        .bold()
                        .font(.custom("Assistant-Bold", size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                      
                    
                    Text(city)
                        .foregroundColor(.gray)
                        .font(.custom("Assistant-Medium", size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                   
                }
                .padding()
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
                
                Text(caption)
                    .foregroundColor(.gray)
                    .font(.custom("Assistant-Medium", size: 15))
                
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
                       } else {
                           likes -= 1
                           likesClicked = false
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
                        } else {
                            comments -= 1
                            commentClicked = false 
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
                    
                    
                    ForEach(friendsPics.indices, id: \.self) { image in
                        let Pic = friendsPics[image]
//                        let comment = commentText[image]
                        Image(Pic)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -30)
                        
//                        Text("\(comment)")
//                            .font(.custom("Assistant-Medium", size: 15))
                    }
                    
                    

                        
//                    Text("\(comment)")
//                        .font(.custom("Assistant-Medium", size: 15))
                    
                    
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
                                
                                
//                                List {
                                ForEach(friendsPics.indices, id: \.self) { f in
                                    let friendPic = friendsPics[f]
                                    let friendName = friendsNames[f]
//                                    let friendComment = commentText[f]
                                        
                                            
                                            VStack {
                                                HStack {
                                                    Image(friendPic)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 50, height: 50)
                                                        .clipShape(Circle())
                                                    VStack {
                                                        Text("\(friendName)")
                                                            .font(.custom("Assistant-Bold", size: 15))
                                                            .bold()
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                        
                                                        
                                                            //                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                        
                                                        Text("\(commentText)")
                                                            .font(.custom("Assistant-Medium", size: 15))
                                                            .frame(maxWidth: .infinity,  alignment: .leading)
                                                            .frame(height: 50)
                                                        
                                                        
                                                        Button(action: {
                                                            commentTraker = true
                                                        }, label: {
                                                            
                                                            
                                                            Image(systemName: "")
                                                            Text("Reply")
                                                                .font(.custom("Assistant-Medium", size: 15))
                                                                .frame(maxWidth: .infinity,  alignment: .leading)
                                                                .foregroundColor(.gray)
                                                        })
                                                        
                                                        if commentTraker == true {
                                                            HStack {
                                                                TextField("", text: $replyComment)
                                                                    .textFieldStyle(.roundedBorder)
                                                                
                                                                
                                                                Spacer()
                                                                
                                                                Button(action: {
                                                                    
                                                                }, label: {
                                                                    Image(systemName: "paperplane.fill")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(width: 20, height: 20)
                                                                        .padding()
                                                                        .foregroundColor(.accentColor)
                                                                })
                                                                
                                                                
                                                                Button(action: {
                                                                    commentTraker = false
                                                                }, label: {
                                                                    Image(systemName: "xmark")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(width: 20, height: 20)
                                                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                                                                        .padding()
                                                                        .foregroundColor(.accentColor)
                                                                })
                                                            }
                                                        }
                                                        
                                                    }
                                                    .padding()
                                                    
                                                    Text("\(Date().formatted(date: .omitted, time: .standard))")
                                                        .font(.custom("Assistant-Medium", size: 15))
                                                    
                                                    
                                                    
                                                    
                                                }
                                                .padding()
                                                
                                              
                                            }
                                        
                                    }
                                
                                HStack {
                                    
                                    TextField("Comment", text: $newComment)
                                        .textFieldStyle(.roundedBorder)
                                        .padding()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                                    
                                    Button(action: {
                                          
                                        
                                        
                                    }, label: {
                                        Image(systemName: "paperplane.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                            .foregroundColor(.accentColor)
                                    })
                                    
                                }
                                
                               
//                                }
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
    Post(name: "Mark", city: "San Franscisco, CA", likes: 0, comments: 0, postPics: [""], profilePic: Image("SF"), caption: "I love the view todau is so preety ")
       
}
