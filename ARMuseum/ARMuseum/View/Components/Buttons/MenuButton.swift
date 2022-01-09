//
//  MenuButton.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct MenuButton: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    
    var body: some View {
        Button {
            withAnimation(Animation.default) {
                self.navigationVM.isMenuOpened.toggle()
            }
        } label: {
            Image("menuIcon.SFSymbol")
                .foregroundColor(Color.white)
                .imageScale(.large)
                .font(Font.system(size: 24, weight: .heavy))
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton()
    }
}
