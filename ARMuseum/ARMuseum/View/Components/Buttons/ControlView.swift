//
//  ControlView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import SwiftUI

struct ControlView: View {
    @Binding var isControlsVisible: Bool
    
    var body: some View {
        VStack {
            ControlVisibilityToggleButton(isControlsVisible: $isControlsVisible)
                .frame(width: 50, height:50)
                .padding(.top, 45)
                .padding(.trailing, 20)
            
            Spacer()
            
        }
    }
}

struct ControlVisibilityToggleButton: View {
    @Binding var isControlsVisible: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Color.black.opacity(0.25)
                
                Button(action: {
                    self.isControlsVisible.toggle()
                }, label: {
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                })
                .frame(width: 50, height:50)
                .cornerRadius(8)
            }
        }
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            
            self.action()
            
        }, label: {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        })
        .frame(width: 50, height: 50)
    }
}
