//
//  TicketManagerViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 8/1/22.
//

import Foundation

class TicketmanagerViewModel: ObservableObject {
    @Published var savedTickets: [Ticket] = []
}
