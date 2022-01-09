//
//  ResourceItemView.swift.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI
import AVFoundation

struct ResourceItemView: View {
    var resourceItem: ResourceItem
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var sessionSettings = SessionSettings()
    @StateObject var sceneManager = SceneManager()
    @State private var x: Image? = nil
    @State private var isLinkActive: Bool = false
    
    var synthesizerVM = SynthesizerViewModel()
    
    var body: some View {
        ScrollView {
            
            GeometryReader { geometry in
                
                ZStack {
                    
                    // MARK: - TODO: Refactor the code below
                    if geometry.frame(in: .global).minY <= 0 {
                        
                        
                        if x == nil {
                            AsyncImage(url: URL(string: resourceItem.thumbnail)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .offset(y: geometry.frame(in: .global).minY/9)
                                    .clipped()
                                
                                let _ = DispatchQueue.main.async {
                                    x = image
                                }
                                
                            } placeholder: {
                                VStack(alignment: .center) {
                                    ProgressView()
                                }
                            }
                        } else {
                            x!.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .offset(y: geometry.frame(in: .global).minY/9)
                                .clipped()
                        }
                        
                        //                        Image(self.thumbnail)
                        //                            .resizable()
                        //                            .aspectRatio(contentMode: .fill)
                        //                            .frame(width: geometry.size.width, height: geometry.size.height)
                        //                            .offset(y: geometry.frame(in: .global).minY/9)
                        //                            .clipped()
                    } else {
                        
                        if x == nil {
                            AsyncImage(url: URL(string: resourceItem.thumbnail)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                                
                                let _ = DispatchQueue.main.async {
                                    x = image
                                }
                            } placeholder: {
                                VStack(alignment: .center) {
                                    ProgressView()
                                }
                            }
                        } else {
                            x!.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        }
                        
                        //                        Image(self.thumbnail)
                        //                            .resizable()
                        //                            .aspectRatio(contentMode: .fill)
                        //                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                        //                            .clipped()
                        //                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
            
            VStack(alignment: .leading) {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(resourceItem.name)
                            .foregroundColor(Color.white)
                            .font(.title2)
                        
                        Text("\(resourceItem.author), \(resourceItem.country)")
                            .foregroundColor(Color.theme.beige)
                            .font(.body)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            self.synthesizerVM.speak(from: self.resourceItem.description)
                        } label: {
                            Image(systemName: "headphones")
                                .imageScale(.large)
                                .font(Font.system(size: 14, weight: .medium))
                        }
                        
                        Button {
                            // Bookmark
                        } label: {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .font(Font.system(size: 14, weight: .medium))
                        }
                    }
                }
                .padding(.top, 8)
                
                Button {
                    // Present AR View
                    resourceItem.asyncLoadModelEntity()
                    self.placementSettings.selectedModel = resourceItem
                    isLinkActive = true
                } label: {
                    HStack(alignment: .center) {
                        Image(systemName: "arkit")
                        Text("Try AR")
                    }
                }
                .buttonStyle(HMButtonStyle())
                .padding(.top)
                
                HMDivider()
                
                Text(resourceItem.description)
                    .font(.body)
                
                
            }
            .padding(.horizontal)
            
            NavigationLink("",
                           destination: HARView()
                            .environmentObject(placementSettings)
                            .environmentObject(sessionSettings)
                            .environmentObject(sceneManager),
                           isActive: $isLinkActive)
                .opacity(0)
        }
        .ignoresSafeArea(edges: .top)
        .onDisappear {
            if synthesizerVM.isSpeaking {
                synthesizerVM.silence()
            }
        }
        
    }
}
