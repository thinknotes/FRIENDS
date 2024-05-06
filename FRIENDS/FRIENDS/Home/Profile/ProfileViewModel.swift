//
//  ProfileViewModel.swift
//  FRIENDS
//
//  Created by StudentAM on 5/6/24.
//

import Foundation


enum ProfileViewModel: Int, CaseIterable {
    case posts
    case reels
    case tagged
    
    var title: String {
        switch self {
            case .posts:  return "Your Posts"
            case .reels:  return "Reels"
            case .tagged: return "Taggeed"
        }
    }
    
    var image: String {
        switch self {
            case .posts: return "square.grid.3x3"
            case .reels:
                return "video.fill"
            case .tagged:
                return "person.crop.square"
        }
    }
}
