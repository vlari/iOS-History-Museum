//
//  SavedTicketView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct SavedTicketView: View {
    @EnvironmentObject var ticketManagerVM: TicketmanagerViewModel
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Your Tickets")
                        .font(.title)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: searchGridLayout, spacing: 10) {
                        ForEach(ticketManagerVM.savedTickets) { ticket in
                            TicketCell(ticket: ticket)
                            
                            HMDivider()
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            
        }
    }
}

struct SavedTicketView_Previews: PreviewProvider {
    static var previews: some View {
        SavedTicketView()
    }
}
