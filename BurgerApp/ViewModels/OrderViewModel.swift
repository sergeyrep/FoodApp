import Foundation
import CoreData

final class OrderViewModel: ObservableObject {
  @Published var orders: [OrderBurgerHistory] = []
  
  private let context: NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
    self.context = context
    fetchOrders()
  }
  
  func fetchOrders() {
    let request: NSFetchRequest<OrderBurgerHistory> = OrderBurgerHistory.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \OrderBurgerHistory.date, ascending: false)]
    do {
      orders = try context.fetch(request)
    } catch {
      print("no orders found: \(error)")
    }
  }
  
  func addOrder(name: String, quantity: Int16, price: Double) {
    let newOrder = OrderBurgerHistory(context: context)
    newOrder.id = UUID()
    newOrder.name = name
    newOrder.price = price
    newOrder.date = Date()
    newOrder.quantity = Int16(quantity)
    
    save()
  }
  
  private func save() {
    do {
      try context.save()
      fetchOrders()
    } catch {
      print("error saving context: \(error)")
    }
  }
  
  func clearOrders() {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = OrderBurgerHistory.fetchRequest()
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    do {
      try context.execute(deleteRequest)
      try context.save()
      fetchOrders()
    } catch {
      print("Failed to clear orders: \(error.localizedDescription)")
    }
  }
  
  func deleteOrder(_ order: OrderBurgerHistory) {
    context.delete(order)
    save()
  }
}
