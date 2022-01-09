//
//  BookmarkCell.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct BookmarkCell: View {
    var name: String = ""
    var author: String = ""
    var country: String = ""
    var thumbnail: String = ""
    
    var body: some View {
        HStack(alignment: .top) {
            Image(self.thumbnail)
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 5) {
                Text(self.name)
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                
                Text("\(self.author), \(self.country)")
                    .foregroundColor(Color.theme.beige)
                    .font(.body)
                    .padding(.vertical)
            }
        }
    }
}

struct BookmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkCell()
            .previewLayout(.sizeThatFits)
    }
}
