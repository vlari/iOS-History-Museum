//
//  ExploreView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 4/1/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var navigationVM: NavigationViewModel
    @StateObject var exploreVM: ExploreViewModel = ExploreViewModel()
    @State private var isLinkActive: Bool = false
    @State private var selectedSection: ResourceCategory = .painting
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        withAnimation(Animation.default) {
                            self.navigationVM.isMenuOpened.toggle()
                        }
                    } label: {
                        Image("menuIcon.SFSymbol")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                            .font(Font.system(size: 24, weight: .heavy))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack(alignment: .center) {
                    Image("iconImage")
                        .resizable()
                        .frame(width: 65, height: 65)
                }
                
                HStack(alignment: .center) {
                    Text("History Museum")
                        .foregroundColor(Color.white)
                        .font(.body)
                }
                
                menuSection
                
                Spacer()
            }
            
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

extension ExploreView {
    private var menuSection: some View {
        ScrollView {
            LazyVGrid(columns: exploreVM.gridLayout, spacing: 10) {
                ForEach(exploreVM.exhibitionSections) { s in
                    VStack {
                        
                        HStack {
                            Text(s.floor)
                                .foregroundColor(Color.theme.lightGrey)
                                .font(.body)
                            
                            Spacer()
                            
                            Text(s.name.text)
                                .foregroundColor(Color.white)
                                .font(.headline)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color.white)
                                .imageScale(.large)
                                .font(Font.system(size: 10, weight: .heavy))
                        }
                        .padding(.vertical)
                        
                        HMDivider()
                    }
                    .onTapGesture {
                        selectedSection = s.name
                        isLinkActive = true
                    }
                }
                
                
                NavigationLink("",
                               destination: SearchItemView(itemCategory: selectedSection).navigationTitle(selectedSection.text),
                               isActive: $isLinkActive)
                    .opacity(0)
                
            }
            .padding()
            
        }
        .padding(.top, 60)
    }
}
