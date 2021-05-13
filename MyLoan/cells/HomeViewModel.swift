//
//  HomeDataView.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 07.03.2021.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    @Published var isNewData = false
    @Published var name = ""
    @Published var number = ""
    @Published var date = Date()
    @Published var typeperson = ""
    let typepersons = ["Выручатель", "Должник"]
    
    @Published var typecurrency = ""
    let typescurrency = ["UZS", "RUB", "USD"]
    @Published var sum = ""
    @Published var comment = ""
    @Published var done = false
    
    @Published var updateItem: Loan!
    
    func writeData(context: NSManagedObjectContext) {
        if updateItem != nil {
            updateItem.date = date
            updateItem.name = name
            updateItem.comment = comment
            updateItem.done = done
            updateItem.number = number
            updateItem.sum = sum
            updateItem.typeperson = typeperson
            updateItem.typecurrency = typecurrency
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            
            date = Date()
            comment = ""
            name = ""
            number = ""
            sum = ""
            typeperson = ""
            done = false
            typecurrency = ""
            return
        }
        let newLoan = Loan(context: context)
        newLoan.date = date
        newLoan.name = name
        newLoan.comment = comment
        newLoan.done = done
        newLoan.number = number
        newLoan.sum = sum
        newLoan.typeperson = typeperson
        newLoan.typecurrency = typecurrency
        do{
            try context.save()
            isNewData.toggle()
            date = Date()
            comment = ""
            name = ""
            number = ""
            sum = ""
            typeperson = ""
            typecurrency = ""
            done = false
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item: Loan) {
        updateItem = item
        
        date = item.date ?? Date()
        name = item.name ?? ""
        comment = item.comment ?? ""
        done = item.done
        number = item.number ?? ""
        sum = item.sum ?? ""
        typeperson = item.typeperson ?? ""
        typecurrency = item.typecurrency ?? ""
        
    }
}
