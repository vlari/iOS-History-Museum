//
//  NavigationViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var selectedViewIndex: Int = 1
    @Published var isMenuOpened = false
}
