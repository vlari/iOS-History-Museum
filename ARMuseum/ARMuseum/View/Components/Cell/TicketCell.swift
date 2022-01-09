//
//  TicketCell.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct TicketCell: View {
    var ticket: Ticket = Ticket()
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text(ticket.admissionLevel)
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                
                HStack {
                    Text(ticket.date)
                    
                    Text(ticket.time)
                        .padding(.horizontal)
                }
                .foregroundColor(Color.theme.beige)
                .font(.body)
                .minimumScaleFactor(0.5)
                
                Text(ticket.price)
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .padding(.vertical)
            }
            
            Spacer()
            
            Image(uiImage: UtilService.shared.generateQRCode(from: ticket.code))
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}

struct TicketCell_Previews: PreviewProvider {
    static var previews: some View {
        TicketCell()
            .previewLayout(.sizeThatFits)
    }
}
