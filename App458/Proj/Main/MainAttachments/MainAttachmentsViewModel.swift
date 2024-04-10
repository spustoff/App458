//
//  MainAttachmentsViewModel.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import CoreData

final class MainAttachmentsViewModel: ObservableObject {
    
    @Published var cards: [CardModel] = []
    @Published var card_payments: [PaymentModel] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedCard: CardModel? = nil
    
    @Published var isAddCard: Bool = false
    @Published var isAddPayment: Bool = false
    
    @Published var card_number: String = ""
    @Published var card_dateExpire: Date = Date()
    @Published var card_amount: String = ""
    
    @Published var payment_name: String = ""
    @Published var payment_date: Date = Date()
    @Published var payment_amount: String = ""
    
    func addCard() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CardModel", into: context) as! CardModel

        loan.card_number = card_number
        loan.date_expire = card_dateExpire
        loan.amount = Int16(card_amount) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCards() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CardModel>(entityName: "CardModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.cards = result
            
        } catch _ as NSError {
            
            self.cards = []
        }
    }
    
    func addPayment() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PaymentModel", into: context) as! PaymentModel

        loan.name = payment_name
        loan.date = payment_date
        loan.amount = Int16(payment_amount) ?? 0
        loan.card_number = selectedCard?.card_number ?? ""

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPayments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PaymentModel>(entityName: "PaymentModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.card_payments = result.filter{$0.card_number == selectedCard?.card_number}
            
        } catch _ as NSError {
            
            self.card_payments = []
        }
    }
}
