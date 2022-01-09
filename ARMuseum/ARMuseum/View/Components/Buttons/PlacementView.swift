//
//  PlacementView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import SwiftUI

struct PlacementView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        HStack {
            Spacer()
            // Temporarily useless
            PlacementButton(systemIconName: "xmark.circle.fill") {
                print("Cancel placement")
                self.placementSettings.selectedModel = nil
            }
            
            PlacementButton(systemIconName: "checkmark.circle.fill") {
                print("Confirm placement button pressed")
                self.placementSettings.confirmed = self.placementSettings.selectedModel
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
        }
        .padding(.bottom, 30)
        
    }
}

struct PlacementButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: systemIconName)
                .font(.system(size: 50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        })
        .frame(width: 75, height: 75)
    }
}
