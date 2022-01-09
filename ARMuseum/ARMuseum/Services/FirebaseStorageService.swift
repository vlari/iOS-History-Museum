//
//  FirebaseStorageService.swift
//  ARMuseum
//
//  Created by Obed Garcia on 7/1/22.
//

import Foundation
import Firebase

class FirebaseStorageService {
    static private let cloudStorage = Storage.storage()
    
    class func asyncDownloadToFilesystem(relativePath: String, handler: @escaping (_ fileUrl: URL) -> Void) {
        // Create local filesystem URL
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = docsUrl.appendingPathComponent(relativePath)
        
        // Check if asset is alrady in the local filesystem
        // if it is, load that asset and return
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            handler(fileUrl)
            return
        }
        
        // Create a reference to the asset
        let storageRef = cloudStorage.reference(withPath: relativePath)
        
        // Download to the local filesystem
        storageRef.write(toFile: fileUrl) { url, error in
            guard let localUrl = url else {
                print("Error downloading file")
                return
            }
            
            handler(localUrl)
        }.resume()
    }
    
}
