import Foundation
import CoreData

final class OrderViewModel: ObservableObject {
  @Published var currentUser: User? //new
  @Published var orders: [OrderBurger] = []
  
  private let context: NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
    self.context = context
    fetchOrdersByUser()
  }
  
  //________________________________//
  
  func setCurrentUser(_ user: User?) {
    self.currentUser = user
    fetchOrdersByUser()
  }
  
  func fetchOrdersByUser() {
    guard let user = currentUser else {
      orders = []
      return
    }
    
    let request: NSFetchRequest<OrderBurger> = OrderBurger.fetchRequest()
    request.predicate = NSPredicate(format: "user == %@", user)
    request.sortDescriptors = [NSSortDescriptor(keyPath: \OrderBurger.date, ascending: false)]
    do {
      orders = try context.fetch(request)
    } catch {
      print("error")
      orders = []
    }
  }
  
  func addOrderByUser(from cartItems: [CartItem]) {
    guard let user = currentUser else {
      print("ne tot user")
      return
    }
    
    let newOrder = OrderBurger(context: context)
    newOrder.id = UUID()
    newOrder.date = Date()
    newOrder.user = user
    
    for item in cartItems {
      let orderItem = OrderBurgerHistory(context: context)
      orderItem.id = UUID()
      orderItem.name = item.product.name
      orderItem.price = item.product.price
      orderItem.quantity = Int16(item.quantity)
      orderItem.order = newOrder
      newOrder.addToItems(orderItem)
    }
    
    user.addToOrders(newOrder)
    
    save()
  }
  //---------------------------------//
  func fetchOrders() {
    let request: NSFetchRequest<OrderBurger> = OrderBurger.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \OrderBurger.date, ascending: false)]
    do {
      orders = try context.fetch(request)
    } catch {
      print("no orders found: \(error)")
    }
  }
  
  func addOrder(from cartItems: [CartItem]) {
    let newOrder = OrderBurger(context: context)
    newOrder.id = UUID()
    newOrder.date = Date()
    
    for item in cartItems {
      let orderItem = OrderBurgerHistory(context: context)
      orderItem.id = UUID()
      orderItem.name = item.product.name
      orderItem.price = item.product.price
      orderItem.quantity = Int16(item.quantity)
      
      orderItem.order = newOrder
      newOrder.addToItems(orderItem)
    }
    
    save()
  }
  
  private func save() {
    do {
      try context.save()
      fetchOrdersByUser()
    } catch {
      print("error saving context: \(error)")
    }
  }
  
  func clearOrders() {
    let fetchRequest: NSFetchRequest<OrderBurger> = OrderBurger.fetchRequest()
    
    do {
      let allOrders = try context.fetch(fetchRequest)
      for order in allOrders {
        if let items = order.items as? Set<OrderBurgerHistory> {
          for item in items {
            context.delete(item)
          }
        }
        context.delete(order)
      }
      save()
    } catch {
      print("Ошибка при получении заказов: \(error.localizedDescription)")
    }
    
//    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = OrderBurgerHistory.fetchRequest()
//    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//    
//    do {
//      try context.execute(deleteRequest)
//      try context.save()
//      fetchOrders()
//    } catch {
//      print("Failed to clear orders: \(error.localizedDescription)")
//    }
  }
  
  func deleteOrder(_ order: OrderBurger) {
    if let items = order.items as? Set<OrderBurgerHistory> {
      for item in items {
        context.delete(item)
      }
    }
    context.delete(order)
    save()
  }
}
