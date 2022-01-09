//
//  SideBar.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import Foundation
import SwiftUI

struct SideBar: View {
    let width: CGFloat
    let isMenuOpened: Bool
    let toggleMenu: () -> Void
    @EnvironmentObject var navigationVM: NavigationViewModel
    
    var body: some View {
        ZStack {
            // Background view
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.isMenuOpened ? 1 : 0)
            .animation(.easeIn, value: 0.25)
            .onTapGesture {
                withAnimation(Animation.default) {
                    self.toggleMenu()
                }
                
            }
            
            // Menu Content
            HStack {
                MenuContent(toggleMenu: toggleMenu)
                    .frame(width: width)
                    .offset(x: isMenuOpened ? 0 : -width)
                    .environmentObject(navigationVM)
                
                Spacer()
            }
            
        }
    }
}
