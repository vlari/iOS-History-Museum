//
//  SearchItemView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI

var searchGridLayout: [GridItem] = [ GridItem(.flexible()) ]

struct SearchItemView: View {
    @ObservedObject var searchVM = SearchViewModel()
    @State private var isLinkActive: Bool = false
    var itemCategory: ResourceCategory
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: searchGridLayout, spacing: 10) {
                        ForEach(searchVM.resources) { s in
                            NavigationLink(destination: ResourceItemView(resourceItem: ResourceItem(name: s.name, category: s.category , author: s.author, country: s.country, description: s.description, thumbnail: s.thumbnail, fileName: s.fileName, scaleCompensation: s.scaleCompensation))) {
                                
                                SearchItemCell(searchItemCellVM: SearchItemCellViewModel(name: s.name, author: s.author, country: s.country, thumbnail: s.thumbnail))
                                    .padding(.vertical)
                            }
                        }
                    }
                    .padding()
                }
            }
            
        }
        .onAppear {
            self.searchVM.fetchResources(with: self.itemCategory.text)
        }
        
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(itemCategory: .painting)
    }
}
