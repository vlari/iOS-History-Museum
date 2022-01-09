//
//  ExhibitionSection.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import Foundation
import SwiftUI

struct ExhibitionSection: Identifiable {
    let id = UUID()
    let name: ResourceCategory
    let floor: String
}
