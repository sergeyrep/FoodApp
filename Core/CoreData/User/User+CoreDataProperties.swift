//
//  User+CoreDataProperties.swift
//  BurgerApp
//
//  Created by Сергей on 29.08.2025.
//
//

import Foundation
import CoreData


extension User {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
    return NSFetchRequest<User>(entityName: "User")
  }
  
  @NSManaged public var avatar: Data?
  @NSManaged public var email: String?
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var password: String?
  @NSManaged public var adress: String?
  @NSManaged public var orders: NSSet?
  
}

extension User : Identifiable {
  
}

extension User {
  public var ordersArray: [OrderBurger] {
    let set = orders as? Set<OrderBurger> ?? []
    return set.sorted { $0.date ?? Date() > $1.date ?? Date() }
  }
  
  func addToOrders(_ value: OrderBurger) {
    self.mutableSetValue(forKey: "orders").add(value)
  }
  
  func removeFromOrders(_ value: OrderBurger) {
    self.mutableSetValue(forKey: "orders").remove(value)
  }
}

extension User {
  static let mock: User = {
    let user = User(context: PersistenceController.shared.container.viewContext)
    //user.id = UUID()
    user.name = "Test User"
    user.email = "test@test.com"
    user.password = "123456"
    user.avatar = Data()
    user.adress = "Test adress"
    return user
  }()
}
