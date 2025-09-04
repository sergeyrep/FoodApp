//
//  OrderBurger+CoreDataProperties.swift
//  BurgerApp
//
//  Created by Сергей on 29.08.2025.
//
//

import Foundation
import CoreData


extension OrderBurger {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderBurger> {
        return NSFetchRequest<OrderBurger>(entityName: "OrderBurger")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var items: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for items
extension OrderBurger {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: OrderBurgerHistory)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: OrderBurgerHistory)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension OrderBurger : Identifiable {

}
