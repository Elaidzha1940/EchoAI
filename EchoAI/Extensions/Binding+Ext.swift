//  /*
//
//  Project EchoAI
//  File: Binding+Ext.swift
//  Created by: Elaidzha Shchukin
//  Date: 14.12.2024
//
//  */

import Foundation
import SwiftUI

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
