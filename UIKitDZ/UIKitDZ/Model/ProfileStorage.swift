// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Картинки историй
enum ProfileStoryConstant {
    static let storySpace = "storySpace"
    static let storyAstronavt = "storyAstronavt"
    static let storyMoon = "storyMoon"
    static let storyRocket = "storyRocket"
}

/// Истории профиля
struct ProfileStorage {
    let story = [
        ProfileStoryConstant.storySpace,
        ProfileStoryConstant.storyAstronavt,
        ProfileStoryConstant.storyMoon,
        ProfileStoryConstant.storyRocket
    ]
}
