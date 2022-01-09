//
//  PaymentView.swift
//  ARMuseum
//
//  Created by Obed Garcia on 5/1/22.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var paymentVM = PaymentViewModel()
    @EnvironmentObject var ticketManagerVM: TicketmanagerViewModel
    @State private var isShowingConfirmationModal: Bool = false
    @State private var ticketConfirmation: TicketConfirmation = TicketConfirmation()
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    paymentTitle
                    
                    paymentDescription
                    
                    paymentForm
                }
            }

        }
        .fullScreenCover(isPresented: $isShowingConfirmationModal, onDismiss: {
            
        }, content: {
            PaymentConfirmationSheet(ticketConfirmation: ticketConfirmation)
        })
        
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

extension PaymentView {
    private var paymentTitle: some View {
        HStack {
            Text("Payment")
                .font(.title)
                .foregroundColor(Color.white)
            
            Spacer()
        }
        .padding()
    }
    
    private var paymentDescription: some View {
        HStack {
            Text("General admission")
                .font(.headline)
                .foregroundColor(Color.white)
            
            Spacer()
            
            Text("$40.00")
                .font(.headline)
                .foregroundColor(Color.white)
        }
        .padding()
    }
    
    private var paymentForm: some View {
        VStack {
            
            // MARK: - Fields
            DatePicker("Date", selection: $paymentVM.date, displayedComponents: .date)
                .padding()
            
            DatePicker("Time", selection: $paymentVM.time, displayedComponents: .hourAndMinute)
                .padding()
            
            TextField("Credit card number", text: $paymentVM.cardNumber)
                .underlineTextField()
            
            HStack {
                TextField("Expiry date", text: $paymentVM.expiryDate)
                    .underlineTextField()
                
                TextField("Secure code", text: $paymentVM.secureCode)
                    .underlineTextField()
            }
            
            TextField("Name on card", text: $paymentVM.nameOnCard)
                .underlineTextField()
            
            // MARK: - Button
            Button {
                paymentVM.makePayment { result in
                    switch result {
                    case .success(let generatedTicket):
                        ticketManagerVM.savedTickets.append(generatedTicket)
                        ticketConfirmation = TicketConfirmation(date: generatedTicket.date,
                                                                time: generatedTicket.time,
                                                                price: generatedTicket.price,
                                                                qrCode: generatedTicket.code)
                        
                        isShowingConfirmationModal.toggle()
                    default:
                        print("payment error!")
                    }
                }
                
                
            } label: {
                Text("Pay")
            }
            .padding()
            .buttonStyle(HMButtonStyle(isButtonDisabled: !paymentVM.isValid))
            .disabled(!paymentVM.isValid)
            .animation(Animation.easeIn, value: 0.25)
            
        }
    }
    
}
