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
            Story(imageURL: "HallofMosses"),
            Story(imageURL: "CheetahDay"),
            Story(imageURL: "CERNCenter")
            
        
       ]),
       StoryModel(profileName: "Henry Jean", profileImage: "TrotternishStorr", stories: [
        Story(imageURL: "HallofMosses"),
        Story(imageURL: "CheetahDay"),
        Story(imageURL: "CERNCenter")
        
       ]
                ),
       StoryModel(profileName: "Swar Jar", profileImage: "VermilionCliffs", stories: [
        Story(imageURL: "HallofMosses"),
        Story(imageURL: "CheetahDay"),
        Story(imageURL: "CERNCenter")
        
       ])
//
    ]
    
    @Published var showStory: Bool = false
    @Published var currentStory: String = ""
}
