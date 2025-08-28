//
//  OrderBurgerHistory+CoreDataProperties.swift
//  BurgerApp
//
//  Created by Сергей on 28.08.2025.
//
//

import Foundation
import CoreData


extension OrderBurgerHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderBurgerHistory> {
        return NSFetchRequest<OrderBurgerHistory>(entityName: "OrderBurgerHistory")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var order: OrderBurger

}

extension OrderBurgerHistory : Identifiable {

}
