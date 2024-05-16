//
//  StoryViewModel.swift
//  FRIENDS
//
//  Created by StudentAM on 5/8/24.
//

import Foundation
import SwiftUI

class StoryViewModel: ObservableObject {
    
    @Published var stories: [StoryModel] = [
    
       StoryModel(profileName: "Aviator", profileImage: "PearlHarborArizona", stories: [
        
        
        Story(imageURL: "JerseyIsland"),
        Story(imageURL: "RioNegro"),
        Story(imageURL: "TajoRiver")
                 
                 ]),
       StoryModel(profileName: "Sammyisbest", profileImage: "Poinsettia", stories: [
        Story(imageURL: "HallofMosses"),
        Story(imageURL: "CheetahDay"),
        Story(imageURL: "CERNCenter")
        
       ]),
       StoryModel(profileName: "Hector", profileImage: "TreeLighting", stories: [
            Story(imageURL: "TreeLighting"),
            Story(imageURL: "CheetahDay"),
            Story(imageURL: "TrotternishStorr")
            
        
       ]),
       StoryModel(profileName: "Dominic", profileImage: "TrotternishStorr", stories: [
        Story(imageURL: "VermilionCliffs"),
        Story(imageURL: "CheetahDay"),
        Story(imageURL: "CERNCenter")
        
       ]
                ),
       StoryModel(profileName: "Swear Jar", profileImage: "VermilionCliffs", stories: [
        Story(imageURL: "BradgateFallow"),
        Story(imageURL: "CheetahDay"),
        Story(imageURL: "CERNCenter")
        
       ])
//
    ]
    
    @Published var showStory: Bool = false
    @Published var currentStory: String = ""
}
