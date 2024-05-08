//
//  StoryModel.swift
//  FRIENDS
//
//  Created by StudentAM on 5/8/24.
//

import Foundation
import SwiftUI


struct StoryModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var profileName: String
    var profileImage: String
    var isSeen: Bool = false
    var stories: [Story]
}

struct Story: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
