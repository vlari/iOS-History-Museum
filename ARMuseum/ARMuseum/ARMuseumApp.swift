//
//  ARMuseumApp.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI
import Firebase

@main
struct ARMuseumApp: App {
    
    init() {
        FirebaseApp.configure()
        
        Auth.auth().signInAnonymously { authDataResult, error in
            guard let _ = authDataResult?.user else {
                print("****Authentication Failed****")
                return
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
