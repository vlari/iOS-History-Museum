//
//  ResourceViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import Foundation
import FirebaseFirestore

class SearchViewModel: ObservableObject {
    @Published var resources: [ResourceItem] = []
    private let db = Firestore.firestore()
    
    func fetchResources(with category: String) {
        db.collection("resources").whereField("category", isEqualTo: category).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                return
            }
            
            self.resources = documents.map{ (queryDocumentSnapshot) -> ResourceItem in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let country = data["country"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let thumbnail = data["thumbnail"] as? String ?? ""
                let fileName = data["fileName"] as? String ?? ""
                let categoryText = data["category"] as? String ?? ""
                let category = ResourceCategory(rawValue: categoryText) ?? .painting
                let scaleCompensation = data["scaleCompensation"] as? Double ?? 1.0
                
                return ResourceItem(name: name, category: category, author: author, country: country, description: description, thumbnail: thumbnail, fileName: fileName, scaleCompensation: Float(scaleCompensation))
            }
        }
    }
}
