//
//  HMDivider.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI

struct HMDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.theme.lightGrey)
            .frame(height: 1)
            .padding(.vertical)
    }
}

struct HMDivider_Previews: PreviewProvider {
    static var previews: some View {
        HMDivider()
    }
}
