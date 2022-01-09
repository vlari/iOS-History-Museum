//
//  HMSegmentedButton.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct HMSegmentedButton: View {
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }, label: {
                Text("Saved")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
            })
                .buttonStyle(SegmentedButtonStyle(buttonIndex: 0, currentIndex: self.selected))
            
            Button(action: {
                self.selected = 1
            }, label: {
                Text("Buy")
                    .font(.headline)
            })
                .buttonStyle(SegmentedButtonStyle(buttonIndex: 1, currentIndex: self.selected))
            
        }
        .padding(8)
    }
}
