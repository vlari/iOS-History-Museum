//
//  PaymentViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 8/1/22.
//

import Foundation
import Combine

class PaymentViewModel: ObservableObject {
    @Published var date = Date.now
    @Published var time = Date.now
    @Published var cardNumber: String = ""
    @Published var expiryDate: String = ""
    @Published var secureCode: String = ""
    @Published var nameOnCard: String = ""
    @Published var isValid = false
    private var anyCancellables = Set<AnyCancellable>()
    
    
    // MARK: - Form validation
    private var isNumberEmptyPublisher: AnyPublisher<Bool, Never> {
        $cardNumber
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isExpiryDateEmptyPublisher: AnyPublisher<Bool, Never> {
        $expiryDate
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isSecureCodeEmptyPublisher: AnyPublisher<Bool, Never> {
        $secureCode
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isNameEmptyPublisher: AnyPublisher<Bool, Never> {
        $nameOnCard
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(isNumberEmptyPublisher, isExpiryDateEmptyPublisher, isSecureCodeEmptyPublisher, isNameEmptyPublisher)
            .map { $0 == false && $1 == false && $2 == false && $3 == false }
            .eraseToAnyPublisher()
    }
    
    init() {
        isFormValidPublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &anyCancellables)
    }
    
    // MARK: - Public methods
    func makePayment(completion: @escaping  (Result<Ticket, PaymentError>) -> ())  {
        let ticket = Ticket(code: UUID().uuidString,
                            date: UtilService.shared.getFormattedDate(date: self.date),
                            time: UtilService.shared.getFormattedTime(time: self.time))
        
        resetForm()
        completion(.success(ticket))
    }
    
    private func resetForm() {
        self.cardNumber = ""
        self.expiryDate = ""
        self.nameOnCard = ""
        self.secureCode = ""
    }
    
}

public enum PaymentError: Error {
    case FailurePayment
}
