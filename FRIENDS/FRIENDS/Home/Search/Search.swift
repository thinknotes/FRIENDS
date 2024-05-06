//
//  Search.swift
//  FRIENDS
//
//  Created by StudentAM on 5/2/24.
//

import SwiftUI


struct UserInfo: Hashable {
    let firstName: String
    let userName: String
}



struct Search: View {
        //    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State var allUsers: [User]
        //    @State private var search: String = ""
    @State private var searchText = ""
    @State private var showSearch: Bool = false
    var feedImages: [String] = ["AlpsCastles", "AngkorPark", "JerseyIsland","CERNCenter", "CheetahDay", "HumanKindness"]
    
    var columnGrid: [GridItem] = [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1) , GridItem(.flexible(), spacing: 1)]
    
    var body: some View {
        NavigationStack {
            
            if showSearch == true {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: {
                            Text(name.firstName)
                        }, label: {
                            HStack {
                                Text("\(name.firstName) - \(name.userName)")
                                Spacer()
                                    // Add your buttons or actions here
                            }
                        })
                    }
                }
            } else {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columnGrid) {
                        ForEach((0...44), id: \.self) {
                            Image(feedImages[$0 % feedImages.count])
                                .resizable()
                                .scaledToFill()
                               
//                                .padding()
                                .frame(width: (UIScreen.main.bounds.width / 3) - 1, height: (UIScreen.main.bounds.height / 3) - 1)
                                .clipped()
                            
                        }
                    }
                }
            }
            
            
        }
        .searchable(text: $searchText) {
            
            ForEach(searchResults, id: \.self) { userInfo in
                
                VStack {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        VStack {
                            Text(userInfo.firstName)
                                .searchCompletion(userInfo.firstName)
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                               
                            
                            Text(userInfo.userName)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
//                        .onTapGesture {
//                            showSearch = true
//                        }
                      
                        
                        
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
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                        }
                        
                            //
                            //
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "message.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                            
                        })
                        .padding()
                    }
                }
                
            }
        }
    }
    
    var searchResults: [UserInfo] {
        if searchText.isEmpty {
            return allUsers.map { UserInfo(firstName: $0.fristName, userName: $0.userName) }
        } else {
            return allUsers.filter { $0.fristName.contains(searchText) }.map { UserInfo(firstName: $0.fristName, userName: $0.userName) }
        }
    }
}
        
        
        
    


#Preview {
    Search(allUsers: [User(fristName: "Emily", lastNane: "Green", userName: "emaily@Green", email: "emaily@gmail.com", city: "Seattle"), User(fristName: "John", lastNane: "Doe", userName: "doe@icould.com", city: "none")])
}


    
