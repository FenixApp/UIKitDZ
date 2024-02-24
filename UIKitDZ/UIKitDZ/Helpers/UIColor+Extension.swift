// UIColor+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для быстрого доступа к добавленным цветам
extension UIColor {
    static func appGrayColor() -> UIColor? {
        UIColor(red: 17 / 255, green: 17 / 255, blue: 17 / 255, alpha: 1)
    }

    static func recommendColor() -> UIColor? {
        UIColor(red: 210 / 255, green: 223 / 255, blue: 238 / 255, alpha: 1)
    }

    static func profileColor() -> UIColor? {
        UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1)
    }
}

extension CGColor {
    static func appTabBarBorderColor() -> UIColor? {
        UIColor(red: 229 / 255, green: 229 / 255, blue: 229 / 255, alpha: 1)
    }
}
