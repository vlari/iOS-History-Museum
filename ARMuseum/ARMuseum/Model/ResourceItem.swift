//
//  ResourceItem.swift
//  ARMuseum
//
//  Created by Obed Garcia on 6/1/22.
//

import Foundation
import UIKit
import Combine
import RealityKit

enum ResourceCategory: String, CaseIterable {
    case painting
    case sculpture
    case architecture
    case weapon
    
    var text: String {
        get {
            switch self {
            case .painting:
                return "Paintings"
            case .sculpture:
                return "Sculptures"
            case .architecture:
                return "Architectures"
            case .weapon:
                return "Weapons"
            }
        }
    }
}

class ResourceItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var category: ResourceCategory
    var author: String
    var country: String
    var description: String
    var thumbnail: String
    var scaleCompensation: Float
    var modelEntity: ModelEntity?
    var fileName: String
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ResourceCategory, author: String, country: String, description: String, thumbnail: String, fileName: String, scaleCompensation: Float = 1.0) {
        
        self.name = name
        self.category = category
        self.author = author
        self.country = country
        self.description = description
        self.thumbnail = thumbnail
        self.fileName = fileName
        self.scaleCompensation = scaleCompensation
        
    }
    
    func asyncLoadModelEntity() {
        FirebaseStorageService.asyncDownloadToFilesystem(relativePath: "resources/\(self.fileName).usdz") { localUrl in
            
            self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl)
                .sink { loadCompletion in
                    switch loadCompletion {
                    case .failure(let error):
                        print("Loading error \(error)")
                    case .finished:
                        break
                    }
                } receiveValue: { modelEntity in
                    self.modelEntity = modelEntity
                    self.modelEntity?.scale *= self.scaleCompensation
                    
                    print("model for \(self.name) is loaded")
                }
            
        }
        
    }
    
}
