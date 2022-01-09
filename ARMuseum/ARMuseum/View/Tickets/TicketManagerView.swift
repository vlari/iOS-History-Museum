//
//  TicketManagerView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct TicketManagerView: View {
    @StateObject var ticketMangerVM = TicketmanagerViewModel()
    @EnvironmentObject var navigationVM: NavigationViewModel
    @State var selectedIndex = 1
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack(spacing: 8) {
                HStack {
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
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HMSegmentedButton(selected: self.$selectedIndex)
                
                if self.selectedIndex == 0 {
                    SavedTicketView()
                        .environmentObject(ticketMangerVM)
                } else {
                    PaymentView()
                        .environmentObject(ticketMangerVM)
                }
            }
            
        }
    }
}

struct TicketManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TicketManagerView()
    }
}
