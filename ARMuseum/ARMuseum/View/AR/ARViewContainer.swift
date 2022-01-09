//
//  ARViewContainer.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    @EnvironmentObject var sceneManager: SceneManager
    
    func makeUIView(context: Context) -> some CustomARView {
        
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings)
        
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            
            // Call updateScene method
            self.updateScene(for: arView)
            
        })
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func updateScene(for arView: CustomARView) {
        // Only display focusEntity when the user has selected a model for placement
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        // Add model to scene if confirmed for placement
        if let confirmedModel = self.placementSettings.confirmed,
           let modelEntity = confirmedModel.modelEntity {
            
            // Call place method
            self.place(modelEntity, in: arView)
            
            self.placementSettings.confirmed = nil
            
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        // Clone modelENtity to reference the same model
        let cloneEntity = modelEntity.clone(recursive: true)
        
        // Enable translation and rotation gestures
        cloneEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation], for: cloneEntity)
        
        // Create anchorentity and add the clone entity to the anchor entity
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(cloneEntity)
        
        // Add the anchor entity to the arView.scene
        arView.scene.addAnchor(anchorEntity)
    }
}


// MARK: - Persistence

class SceneManager: ObservableObject {
    @Published var isPersistenceAvailable: Bool = false
    
    // Keeps track of anchor entities with modelentities
    @Published var anchorEntities: [AnchorEntity] = []
}
