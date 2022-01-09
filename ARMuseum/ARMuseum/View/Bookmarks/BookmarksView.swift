//
//  BookmarksView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

// Test data
struct SearchItem: Identifiable {
    let id = UUID()
    var name: String = ""
    var author: String = ""
    var country: String = ""
    var thumbnail: String = ""
    var description: String = ""
}
let stuff: [SearchItem] = [
    SearchItem(name: "1hello this is a lorem ipsum", author: "shomeone", country: "Germany", thumbnail: "sampleimage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    SearchItem(name: "2hello", author: "shomeone", country: "Germany", thumbnail: "sampleimage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    SearchItem(name: "3hello", author: "shomeone", country: "Germany", thumbnail: "sampleimage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    SearchItem(name: "4hello", author: "shomeone", country: "Germany", thumbnail: "sampleimage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    SearchItem(name: "5hello", author: "shomeone", country: "Germany", thumbnail: "sampleimage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
]

struct BookmarksView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: searchGridLayout, spacing: 10) {
                 
                        ForEach(stuff) { s in
//                            NavigationLink(destination: ResourceItemView(name: s.name, author: s.author, country: s.country, description: s.description, thumbnail: s.thumbnail)) {
//                                BookmarkCell(name: s.name, author: s.author, country: s.country, thumbnail: s.thumbnail)
//                            }
                            
                            HMDivider()
                        }
                        
                    }
                    .padding()
                }

                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
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
        
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
            .environmentObject(NavigationViewModel())
    }
}
