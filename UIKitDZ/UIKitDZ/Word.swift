// Word.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

// Модель
struct Word {
    func getWord(word: String) -> String {
        String(word.reversed())
    }
}
