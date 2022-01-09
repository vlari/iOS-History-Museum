//
//  CustomButtonStyle.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import Foundation
import SwiftUI

struct HMButtonStyle: ButtonStyle {
    var isButtonDisabled: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(isButtonDisabled ? Color.theme.beige.opacity(0.5) : (configuration.isPressed ? Color.theme.darkBeige : Color.theme.beige))
            .foregroundColor(Color.theme.black)
            .cornerRadius(8.0)
    }
}

struct SegmentedButtonStyle: ButtonStyle {
    var buttonIndex: Int
    var currentIndex: Int
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 25)
            .foregroundColor(currentIndex == buttonIndex ? Color.theme.black : Color.theme.beige)
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(currentIndex == buttonIndex ? Color.theme.beige : Color.clear)
            .cornerRadius(8.0)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}
