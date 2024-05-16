//
//  NewPost.swift
//  FRIENDS
//
//  Created by StudentAM on 5/9/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct NewPost: View {

    @State private var index: Int = 0
    @State var bioClicked: Bool = false
    @State var bioText: String = "Story Bio"
    @State var postTitle: Bool = false
    @State var SubTitle: Bool = false
    @State var titletex: String = ""
    @State var subtext: String = ""
    @State var postColor: Bool = false
    @State var postCity: Bool = false
    @State var selectedColor: Color = .accentColor
    @State var cityText: String = "San Fransciso, CA"
    @State var postTag: Bool = false
    @State var tagSelection = "Emily"
    @State var photos: [String] = ["JerseyIsland"]
   
    @State var friends: [String]
    let tagable = ["Emily Johnson", "Michael Smith", "Jessica Martinez", "Christopher Brown", "Amanda Davis"]
    
    @Binding var post: [posts]
    
    var body: some View {
        TabView(selection: $index) {
            New(city: $cityText, photos: photos, bio: $bioClicked, title: $postTitle, sub: $SubTitle, color: $postColor, citys: $postCity, tag: $postTag)
                //
            
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(width: 400, height: 300)
        .background(.black)
        .transition(.move(edge: .bottom))
        
        Spacer()
        
       
       
            ScrollView(.vertical) {
                if bioClicked == true {
                    TextEditor(text: $bioText)
                        .cornerRadius(20)
                        .padding()
                        .frame(height: 200)
                        .foregroundColor(selectedColor)
                        
                        .background(Color(.secondarySystemBackground))
                }
                
                if postTitle == true {
                    TextField("Enter Post Title", text: $titletex)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                }
                
                if SubTitle == true {
                    TextField("Enter Post SubTitle", text: $subtext)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                }
                
                if postColor == true {
                    CustomColorPicker(selectedColor: $selectedColor)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                }
                
                if postCity == true {
                    TextField("Enter Post City", text: $cityText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                }
                
                if postTag == true {
                    HStack {
                        Text("Add And Tag Your Friends")
//                        Image("CheetahDay")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 35, height: 35)
//                            .clipShape(Circle())
                        Picker("", selection: $tagSelection) {
                            ForEach(tagable, id: \.self) {
                                Text($0)
                            }
                        }
                        .background(Color(.secondarySystemBackground))
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    
                    
                }
                
                
            
                HStack {
                    Text("Upload Post")
                        .padding()
                    Button(action: {
                        let newPost = posts(name: titletex, city: cityText, postPics: [""], friendsPics: friends, numOfLikes: 0, numOfComments: 0, caption: bioText, commentText: "", profiePic: Image(""))
                        
                        post.append(newPost)
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
        }
        
       
        
    }
    
}

#Preview {
    NewPost(photos: [""], friends: [""], post: .constant([]))
        
}


struct New: View {
    @State private var profileName: String?
    @State private var profileImage: Image?
    @Binding var  city: String
    @State private var photoPickerItme: PhotosPickerItem?
    @State  var photos: [String] = ["JerseyIsland"]
//    @State var photos: UIImage
    @Environment(\.dismiss) var dismiss
    @State private var newElement: Bool = false
    @Binding var bio: Bool
    @Binding var title: Bool
    @Binding var sub: Bool
    @Binding var color: Bool
    @Binding var citys: Bool
    @Binding var tag: Bool
    var body: some View {
       GeometryReader { proxy in
            ZStack {
                
                
//                Image("\(photos)")
//                    .resizable()
//                    .foregroundColor(.white)
//                    .aspectRatio(contentMode: .fill)
               
                PhotosPicker(selection: $photoPickerItme) {
                        Image("\(photos)")
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fill)
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onChange(of: photoPickerItme) { _, _ in
                Task {
                    if let photoPickerItme,
                       let data = try? await photoPickerItme.loadTransferable(type: Data.self) {
//                        if let imageData = image.jpegData(compressionQuality: 0.5) {
//                            let base64String = imageData.base64EncodedString()
//                            photos.append(base64String)
//                        }
//                        if let image = UIImage(data: data) {
//                            photos = image
//                        }
                    }
                }
            }
            .overlay(
                HStack {
                    
                   
                    if let pic = profileImage {
                        pic
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                    } else {
                        Image("Poinsettia")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                       
                    
                    
                    
                    
                    VStack {
                        Text(profileName ?? "Unknown")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text(city )
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        newElement.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                    .offset(x: -30)
                    .sheet(isPresented: $newElement, content: {
                        VStack {
                            Button(action: {
                                newElement.toggle()
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding()
                                    .foregroundColor(.black)
                                
                            })
                            
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Button(action: {
                                        title = true
                                        newElement.toggle()
                                    }, label: {
                                        Image(systemName: "textformat.size")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                        Text("Title")
                                            .frame(width: 50)
                                    })
                                    .padding()
                                    .border(Color.blue)
                                    
                                    Button(action: {
                                        sub = true
                                        newElement.toggle()
                                    }, label: {
                                        Image(systemName: "textformat.abc")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                        Text("Subtitle")
                                            .frame(width: 90)
                                    })
                                    .padding()
                                    .border(Color.blue)
                                    
                                }
                                
                                HStack {
                                    Button(action: {
                                        bio = true
                                        newElement.toggle()
                                    }, label: {
                                        Image(systemName: "pencil.and.scribble")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                        Text("Bio")
                                            .frame(width: 50)
                                    })
                                    .padding()
                                    .border(Color.blue)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 45)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Button(action: {
                                    tag = true
                                    newElement.toggle()
                                }, label: {
                                    Image("Poinsettia")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    Text("Tag ")
                                        .frame(width: 50)
                                })
                                .padding()
                                .border(Color.blue)
                                
                              
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    Image("Poinsettia")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    Text("Add To Close Friends")
                                        .frame(width: 130)
                                })
                                .padding()
                                .border(Color.blue)
                            }
                            
                            HStack {
                                Button(action: {
                                    citys = true
                                    newElement.toggle()
                                }, label: {
                                    Image(systemName: "building.2.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                    
                                    Text("Add City ")
                                        .frame(width: 70)
                                })
                                .padding()
                                .border(Color.blue)
                            }
                            
                            HStack {
                                Button(action: {
                                    color = true
                                    newElement.toggle()
                                }, label: {
                                    Image(systemName: "paintbrush.pointed.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                    
                                    Text("Custom Color")
                                        .frame(width: 90)
                                })
                                .padding()
                                .border(Color.blue)
                            }
                        }
                        
                        
                    })
                    
                    Button(action: {
                        withAnimation {
                            dismiss()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                    .offset(x: -30)
                    
                    
                    
                    
                }
                .padding()
                ,alignment: .topTrailing
                
                
            )
//
           
            
        }
    }
}

#Preview {
    New(city: .constant(""), photos: [""], bio: .constant(false), title: .constant(false), sub: .constant(false), color: .constant(false), citys: .constant(false), tag: .constant(false))
}

struct CustomColorPicker: View {
    @Binding var selectedColor: Color
    private let colors: [Color] = [
        
        Color("blue4"),
        Color("darkblue1"),
        Color("blue"), Color("blue2") ,Color("blue3"), Color("darkblue"),Color("darkblue2"), Color("darkblue3"), Color("darkblue4"),
        
        
        Color("darkblue5"), Color("pink"), Color("pink2"), Color("pink3"), Color("pink4"), Color("red1"),Color("red2"), Color("red3"), Color("red4")
        
    ]
    var body: some View {
        ScrollView(.horizontal){
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .foregroundColor(color)
                    .frame(width: 45, height: 45)
                    .opacity(color == selectedColor ? 0.5 : 1.0)
                    .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                    .onTapGesture {
                        selectedColor = color
                    }
            }
            
        }
        }
    }
}
