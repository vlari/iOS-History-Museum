//
//  SearchItemCell.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct SearchItemCell: View {
    var searchItemCellVM: SearchItemCellViewModel = SearchItemCellViewModel()
    
    var body: some View {
        VStack(alignment:.leading) {
            AsyncImage(url: URL(string: searchItemCellVM.thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(1/1, contentMode: .fit)
            } placeholder: {
                VStack(alignment: .center) {
                    ProgressView()
                }
                .frame(width: 750, height: 750)
            }
            
            Text(searchItemCellVM.name)
                .foregroundColor(Color.white)
                .font(.headline)
            
            Text("\(searchItemCellVM.author), \(searchItemCellVM.country)")
                .foregroundColor(Color.theme.beige)
                .font(.body)
        }
    }
}

struct SearchItemCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemCell()
    }
}
