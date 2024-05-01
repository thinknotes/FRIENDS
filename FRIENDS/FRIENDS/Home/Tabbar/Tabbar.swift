//
//  Tabbar.swift
//  FRIENDS
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Tabbar: View {
    
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
         ("house", "Home"),
         ("magnifyingglass", "Search"),
         ("heart", "Favorites"),
         ("person", "Profile")
    
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack {
                ForEach(0..<4) { index in
                    Button(action: {
                        tabSelection = index + 1
                    }, label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                                .font(.custom("Assistant-Bold", size: 15))
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.blue)
                                    .matchedGeometryEffect(id: "SelecedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                            
                            
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                    })
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    Tabbar(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
