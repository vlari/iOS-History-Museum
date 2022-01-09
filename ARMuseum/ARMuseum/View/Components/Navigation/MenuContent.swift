//
//  MenuContent.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import Foundation
import SwiftUI

struct MenuContent: View {
    let toggleMenu: () -> Void
    let items: [SideMenuItem] = [
        SideMenuItem(text: "Dismiss", itemIdex: 0),
        SideMenuItem(text: "Explore", itemIdex: 1),
        SideMenuItem(text: "Tickets", itemIdex: 2),
        SideMenuItem(text: "Bookmarks", itemIdex: 3),
        SideMenuItem(text: "LogIn", itemIdex: 4)
    ]
    @EnvironmentObject var navigationVM: NavigationViewModel
    
    var body: some View {
        ZStack {
            Color.theme.black
            
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(items) { item in
                    HStack {
                        if item.itemIdex == 0 {
                            Button {
                                withAnimation(Animation.default) {
                                    toggleMenu()
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .imageScale(.large)
                                    .font(Font.system(size: 18, weight: .heavy))
                                    .foregroundColor(Color.white)
                            }
                        } else {
                            Text(item.text)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .font(.title3)
                        }
                        
                        Spacer()
                    }
                    .onTapGesture {
                        guard item.itemIdex != 0 else {
                            return
                        }
                        
                        navigationVM.selectedViewIndex = item.itemIdex
                        withAnimation(Animation.default) {
                            toggleMenu()
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding(.top, 30)
        }
    }
}
