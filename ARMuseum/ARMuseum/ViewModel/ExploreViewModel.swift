//
//  ExploreViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import Foundation
import SwiftUI

class ExploreViewModel: ObservableObject {
    var exhibitionSections: [ExhibitionSection] = [
        ExhibitionSection(name: .painting, floor: "01"),
        ExhibitionSection(name: .sculpture, floor: "02"),
        ExhibitionSection(name: .architecture, floor: "03"),
        ExhibitionSection(name: .weapon, floor: "04")
    ]
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)
    }
}
