//
//  StoryView.swift
//  FRIENDS
//
//  Created by StudentAM on 5/8/24.
//

import SwiftUI

struct StoryView: View {
    @EnvironmentObject var storyData: StoryViewModel
    var body: some View {
        if storyData.showStory {
            TabView(selection: $storyData.currentStory) {
                ForEach($storyData.stories) {$bundle in
                    StoryCardView(bundle: $bundle)
                        .environmentObject(storyData)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            .transition(.move(edge: .bottom))
        }
    }
}

#Preview {
    MainView()
}

struct StoryCardView: View {
    @Binding var bundle: StoryModel
    
    @EnvironmentObject var storyData: StoryViewModel
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var timerProgress: CGFloat = 0
    
    var body: some View {
        
        GeometryReader{ proxy in
            ZStack {
                let index = min(Int(timerProgress), bundle.stories.count - 1)
                
//                if let story = bundle.stories[index] {
                    
                Image(bundle.stories[index].imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                HStack {
                    
                    Image(bundle.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    
                    Text(bundle.profileName)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                }
                .padding()
                
                ,alignment: .topTrailing
                
            )
            .overlay(
                
                HStack {
                    ForEach(bundle.stories.indices) { story in
                        GeometryReader{proxy in
                            
                            let width = proxy.size.width
                            let progress = timerProgress - CGFloat(story)
                            let perfectProgress = min(max(progress, 0), 1)
                            
                            Capsule()
                                .fill(.gray.opacity(0.5))
                                .overlay(
                                   Capsule()
                                    .fill(.white)
                                    .frame(width: width * perfectProgress )
                                   , alignment: .leading
                                )
                            
                        }
                    }
                 }
                .frame(height: 1.4)
                .padding(.horizontal)
                ,alignment: .top
            )
            .rotation3DEffect(
                .zero,
                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
                anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing, perspective: 2.5
            )
        }
        .onAppear {
            timerProgress = 0
        }
        .onReceive(timer) { _ in
            if storyData.currentStory == bundle.id {
                if !bundle.isSeen {
                    bundle.isSeen = true
                }
                
                if timerProgress < CGFloat(bundle.stories.count) {
                    timerProgress += 0.03
                } else {
                    updateStory()
                }
            }
        }
        
       
    }
    
    func updateStory(forward: Bool = true) {
        let index = min(Int(timerProgress), bundle.stories.count - 1)
        
        let story = bundle.stories[index]
        
        if let last = bundle.stories.last, last.id == story.id {
            if let lastBundle = storyData.stories.last, lastBundle.id == bundle.id {
                withAnimation {
                    storyData.showStory = false
                }
                timerProgress = 0
            } else {
                let bundleIndex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0
                
                withAnimation {
                    storyData.currentStory = storyData.stories[index + 1].id
                }
            }
        }
    }
    
    func findAngle(proxy: GeometryProxy) -> Angle {
        let progress = proxy.frame(in: .global).midX / proxy.size.width
        let rotationAngle: CGFloat = 45
        let degress = rotationAngle * progress
        
        return Angle(degrees: Double(degress))
    }
}
