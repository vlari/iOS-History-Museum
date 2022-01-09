//
//  Ticket.swift
//  ARMuseum
//
//  Created by Obed Garcia on 8/1/22.
//

import Foundation

struct Ticket: Identifiable {
    let id = UUID()
    var code: String = ""
    let admissionLevel: String = "General admission"
    var date: String = ""
    var time: String = ""
    let price: String = "$40.00"
}
