//
//  PlacementSettings.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import Foundation
import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject {
    // When user selects a model in browse view, this property is set
    @Published var selectedModel: ResourceItem? {
        willSet(newValue) {
            print("Setting models to \(String(describing: newValue?.name))")
        }
    }
    
    // When user taps confirm in placement view, the value of selected model is assigned to confirmed Model
    @Published var confirmed: ResourceItem? {
        willSet(newValue) {
            guard let model = newValue else {
                print("clearint model")
                return
            }
            
            print("setting confirmed model to \(model.name)")
        }
    }
    
    // THis property retains the cancellable for sceneEvents.Update subscraber
    var sceneObserver: Cancellable?
    
    // Retains a record of placed models in the scene. the las element in the array is the most recently placed model.
    @Published var recentlyPlaced: [ResourceItem] = []
    
}
