//
//  Color.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 05/05/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        r = Double((int >> 16) & 0xFF) / 255
        g = Double((int >> 8) & 0xFF) / 255
        b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

import SwiftUI

extension Color {
    static let customAccentColor = Color("AccentColor")
    static let customBackgroundColor = Color("BackgroundColor")
}
