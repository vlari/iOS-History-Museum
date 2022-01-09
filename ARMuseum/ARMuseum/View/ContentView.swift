//
//  ContentView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationVM = NavigationViewModel()
    
    func toggleMenu() {
        self.navigationVM.isMenuOpened.toggle()
    }
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            switch navigationVM.selectedViewIndex {
            case 1:
                NavigationView {
                    ExploreView()
                        .environmentObject(navigationVM)
                        .navigationBarHidden(true)
                }
            case 2:
                NavigationView {
                    TicketManagerView()
                        .environmentObject(navigationVM)
                        .navigationBarHidden(true)
                }
            case 3:
                NavigationView {
                    BookmarksView()
                        .environmentObject(navigationVM)
                        .navigationTitle("Bookmarks")
                }
            case 4:
                NavigationView {
                    LoginView()
                        .environmentObject(navigationVM)
                        .navigationBarHidden(true)
                }
            default:
                Text("Hello")
            }

            SideBar(width: UIScreen.main.bounds.width/1.8,
                    isMenuOpened: navigationVM.isMenuOpened,
                    toggleMenu: toggleMenu)
                .environmentObject(navigationVM)
                .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
