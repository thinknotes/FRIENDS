//
//  GetStarted.swift
//  FRIENDS
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct GetStarted: View {
    var body: some View {

        VStack {
            
            VStack {
                
                Text("FRIENDS")
                    .font(.custom("Assistant-ExtraBold", size: 25))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    .bold()
                    .offset(y: -70)
//                    .foregroundColor(Color("red2"))
                    .foregroundColor(.white)
                
                
                
                Text("Find Your Next BFF")
                    .font(.custom("Assistant-Regular", size: 40))
                    .foregroundColor(.white)
//                    .foregroundColor(Color("red2"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    .offset(y: -230)
                
                Text("Discover people near you")
                    .font(.custom("Assistant-Regular", size: 20))
                    .foregroundColor(.white)
//                    .foregroundColor(Color("red2"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    .offset(y: -400)
                
                
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Get Started")
                            .frame(width: 200, height: 30)
                            .font(.custom("Assistant-Regular", size: 25))
                            .padding()
                            .background(Capsule().fill(.white))
//                            .background(Capsule().fill(Color("red2")))
                            .foregroundColor(.pink4)
                        
                            
                            
                            
                    })
                 
                   
                   
                }
                
            }
            
            
             
            
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("pink"), Color("pink2"), Color("pink3"), Color("pink4") ]), startPoint: .leading, endPoint: .top))
        
       
        
        
        
    }
}

#Preview {
    GetStarted()
}


//VStack {
//    LinearGradient(gradient: Gradient(colors: [Color("pink"), Color("pink2"), Color("pink3"), Color("pink4") ]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
//    
//    
//}
//.edgesIgnoringSafeArea(.all)
