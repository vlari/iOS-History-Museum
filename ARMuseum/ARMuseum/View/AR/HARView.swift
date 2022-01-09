//
//  ARView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import SwiftUI

struct HARView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    @EnvironmentObject var sessionSettings: SessionSettings
    @EnvironmentObject var sceneManager: SceneManager
    
    @State private var isControlsVisible: Bool = false
    @State private var showBrowse: Bool = false
    @State private var showSettings: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ARViewContainer()
                .environmentObject(placementSettings)
                .environmentObject(sessionSettings)
                .environmentObject(sceneManager)
            
            if self.placementSettings.selectedModel != nil {
                PlacementView()
            }
        }
        .ignoresSafeArea(.all)
        .onDisappear {
            self.placementSettings.selectedModel = nil
        }
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        HARView()
    }
}
