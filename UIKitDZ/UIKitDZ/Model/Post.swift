// Posts.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Пост
struct Post {
    let nickname: String
    let photo: UIImage
    let pictures: [UIImage]
    let timeText: String
}

/// Уведомление
struct Notification {
    let text: String
    let avatar: UIImage
    let picture: UIImage
}
