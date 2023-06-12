//
//  PortfolioDataService.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 10/06/23.
//

import Foundation
import CoreData

class PortfolioService {
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let EntityName: String = "PortfolioEntity"

    @Published var saveEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }
    }
    // MARK: PUBLIC
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        //check if coin is already in portfolio
        if let entity = saveEntities.first(where: { saveEntity -> Bool in
            return saveEntity.coinID == coin.id
        }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        }else {
            add(coin: coin, amount: amount)
        }
    }
    
    // MARK: PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: EntityName)
        do {
          saveEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portfolio Entities \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving the Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
