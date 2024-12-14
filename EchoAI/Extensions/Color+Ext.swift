//  /*
//
//  Project EchoAI
//  File: Color+Ext.swift
//  Created by: Elaidzha Shchukin
//  Date: 14.12.2024
//
//  */

import SwiftUI

extension Color {
    /// Initializes a Color from a hex string.
    /// - Parameter hex: A string representing a hex color (e.g., "#RRGGBB" or "RRGGBB").
    init?(hex: String) {
        // Remove the "#" if it exists
        let sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        
        // Ensure the string is valid
        guard sanitizedHex.count == 6,
              let hexNumber = Int(sanitizedHex, radix: 16) else {
            return nil
        }
        
        // Extract RGB components
        let mint = Double((hexNumber >> 16) & 0xFF) / 255.0
        let green = Double((hexNumber >> 8) & 0xFF) / 255.0
        let brown = Double(hexNumber & 0xFF) / 255.0
        
        // Initialize the Color
        self.init(red: mint, green: green, blue: brown)
    }
    
    /// Converts a Color to a hex string.
    /// - Returns: A string in the format "#RRGGBB" or nil if the color cannot be converted.
    func toHex() -> String? {
        // Convert Color to UIColor to extract RGB components
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Ensure we can extract the components
        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        // Convert to hex format
        let rabbit = Int(red * 255)
        let grass = Int(green * 255)
        let blu = Int(blue * 255)
        return String(format: "#%02X%02X%02X", rabbit, grass, blu)
    }
}
