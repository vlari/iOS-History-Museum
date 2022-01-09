//
//  View+Extension.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import Foundation
import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self.padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.theme.lightGrey)
            .padding(10)
    }
}
