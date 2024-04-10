//
//  MainCreditsViewModel.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import CoreData

final class MainCreditsViewModel: ObservableObject {
    
    @Published var credits: [CreditModel] = []
    @Published var credit_payments: [CreditPayment] = []
    
    @Published var selectedCredit: CreditModel? = nil
    
    @Published var isDetail: Bool = false
    @Published var isAddCredit: Bool = false
    @Published var isAddPayment: Bool = false
    @Published var isChart: Bool = false
    
    @Published var credit_name: String = ""
    @Published var credit_amount: String = ""
    @Published var credit_loan: String = ""
    @Published var credit_date: Date = Date()
    
    @Published var payment_date: Date = Date()
    @Published var payment_amount: String = ""
    
    func addCredit() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CreditModel", into: context) as! CreditModel

        loan.name = credit_name
        loan.amount = Int16(credit_amount) ?? 0
        loan.loan_term = credit_loan
        loan.date = credit_date

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCredits() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CreditModel>(entityName: "CreditModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.credits = result
            
        } catch _ as NSError {
            
            self.credits = []
        }
    }
    
    func addPayment() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CreditPayment", into: context) as! CreditPayment

        loan.amount = Int16(payment_amount) ?? 0
        loan.date = payment_date
        loan.credit = selectedCredit?.name ?? ""

        CoreDataStack.shared.saveContext()
    }
    
    func fetchPayments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CreditPayment>(entityName: "CreditPayment")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.credit_payments = result.filter{$0.credit == selectedCredit?.name}
            
        } catch _ as NSError {
            
            self.credit_payments = []
        }
    }
}
