//
//  PaymentConfirmationSheet.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct PaymentConfirmationSheet: View {
    @Environment(\.presentationMode) var presentationMode
    private let menuLabels: [String] = ["Date:", "Time:", "Price:"]
    var ticketConfirmation: TicketConfirmation = TicketConfirmation()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.black
                    .ignoresSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center) {
                        Image("sampleimage")
                            .resizable()
                            .aspectRatio(1/1, contentMode: .fit)
                        
                        confirmationContent
                    
                        qrCode
                    }
                }
                .padding()
            }
            .navigationTitle("Your Ticket")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .font(Font.system(size: 18, weight: .heavy))
                            .foregroundColor(Color.white)
                    }

                }
            }
            
            
        }
    }
}

struct PaymentConfirmationSheet_Previews: PreviewProvider {
    static var previews: some View {
        PaymentConfirmationSheet()
    }
}

extension PaymentConfirmationSheet {
    private var confirmationContent: some View {
        HStack {
            VStack {
                ForEach(menuLabels, id: \.self) { menuLabel in
                    Text(menuLabel)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .padding()
                }
            }
            .padding()
            
            VStack {
                Text(ticketConfirmation.date)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .padding()
                
                Text(ticketConfirmation.time)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .padding()
                
                Text(ticketConfirmation.price)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .padding()
            }
            .padding()
        }
    }
    
    private var qrCode: some View {
        Image(uiImage: UtilService.shared.generateQRCode(from: ticketConfirmation.qrCode))
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
