//
//  options.swift
//  FRIENDS
//
//  Created by StudentAM on 5/9/24.
//

import SwiftUI

struct options: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var post: [posts]
//    @State var images: [String]
    @State var bioText: String = ""
    @State var friends: [String] = [""]
    @State var bioClick: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .foregroundColor(.black)

                })
                
             
                
                Text("Create New")
                    .font(.custom("Assistant-Bold", size: 35))
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: Text("Story")) {
                    Text("Story")
                        .font(.custom("Assistant-Medium", size: 20))
                        .frame(width: 200, height: 50)
                        .background(Color.accentColor.opacity(0.5))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: NewPost(bioClicked: bioClick, bioText: bioText,  friends: friends, post: $post).navigationBarBackButtonHidden(true)) {
                    Text("Post")
                        .font(.custom("Assistant-Medium", size: 20))
                        .frame(width: 200, height: 50)
                        .background(Color.accentColor.opacity(0.5))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: Text("Reels")) {
                    Text("Reel")
                        .font(.custom("Assistant-Medium", size: 20))
                        .frame(width: 200, height: 50)
                        .background(Color.accentColor.opacity(0.5))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }

    }
}

#Preview {
    options(post: .constant([]))
}
